import 'package:elk_frontend/core/sizes.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/presentation/state_manement/search_page_manager/cubit/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_pagination/number_pagination.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.getWidth;
    loadNewPage({required int newPageNumber, required SearchState newState}) {
      if (newState.currentState == SearchingStates.success) {
        BlocProvider.of<SearchCubit>(context).search(pageNumber: newPageNumber);
      }
    }

    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) {
        if (previous.totalResultCount == current.totalResultCount) {
          return false;
        } else {
          return true;
        }
      },
      builder: (context, state) {
        int pageCount = generatePageCount(state.totalResultCount);
        return NumberPagination(
            pageTotal: pageCount,
            iconPrevious: const Row(children: [
              Icon(Icons.keyboard_arrow_left),
              Text(SearchWidgetStrings.prevPageBtnText),
              SizedBox(width: 10),
            ]),
            iconNext: const Row(children: [
              SizedBox(width: 10),
              Text(SearchWidgetStrings.nextPageBtnText),
              Icon(Icons.keyboard_arrow_right)
            ]),
            threshold: width > 800
                ? 10
                : width > 400
                    ? 4
                    : 1,
            onPageChanged: (int newPageNumber) =>
                loadNewPage(newPageNumber: newPageNumber, newState: state));
      },
    );
  }
}

generatePageCount(int count) {
  if (count == 1) {
    return 1;
  } else if (count < 10000) {
    return ((count+10) / 10).truncate();
  } else {
    return 999;
  }
}
