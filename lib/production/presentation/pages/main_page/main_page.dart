import 'package:elk_frontend/core/sizes.dart';
import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/last1hour_cubit/last1hour_cubit.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/latest1hour_cubit/latest1hour_cubit.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/report_cubit/report_cubit.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/search_cubit/search_cubit.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/sort_cubit/sort_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/count_widget/count_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/last1hour_widgets/last1hour_table_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/last1hour_widgets/last1hour_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/latest1hour_widgets/latest1hour_table_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/latest1hour_widgets/latest1hour_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/report_widgets/report_table_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/report_widgets/report_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/search_widgets/search_result_pagination_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/sort_widgets/sort_result_table.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/sort_widgets/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/main_page_widgets/form_widget.dart';
import '../../widgets/main_page_widgets/search_widgets/search_result_table.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color2,
      appBar: AppBar(
        backgroundColor: MainColors.color5,
        title: const Center(child: Text(MainStrings.mainTitle)),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
          BlocProvider<SortCubit>(
            create: (context) =>
                SortCubit(searchCubit: BlocProvider.of<SearchCubit>(context)),
          ),
          BlocProvider<ReportCubit>(
            create: (context) =>
                ReportCubit(searchCubit: BlocProvider.of<SearchCubit>(context)),
          ),
          BlocProvider<Last1HourCubit>(
            create: (context) => Last1HourCubit(),
          ),
          BlocProvider<Latest1HourCubit>(
            create: (context) => Latest1HourCubit(),
          ),
        ],
        child: const ListOfItems(),
      ),
    );
  }
}

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.getWidth;
    double searchWidth = width * 0.9;

    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          searchWidgets(searchWidth),
          Wrap(
            direction: Axis.horizontal,
            spacing: MainDoubles.wrapSpacing4,
            children: [
              sortWidgets(),
              reportWidgets(),
              latest1HourWidgets(),
              last1HourWidgets()
            ],
          ),
          const SizedBox(
            height: MainDoubles.wrapSpacing4,
          )
        ]),
      ],
    );
  }

  searchWidgets(searchWidth) => Wrap(
        direction: Axis.vertical,
        spacing: MainDoubles.wrapSpacing1,
        children: [
          const SizedBox(height: MainDoubles.margin1),
          SizedBox(width: searchWidth, child: const FormWidget()),
          SizedBox(
              height: MainDoubles.mainHeight,
              width: searchWidth,
              child: const SearchResultTable()),
          SizedBox(width: searchWidth, child: const PaginationWidget()),
        ],
      );

  countWidgets() => const Wrap(
        children: [
          SizedBox(height: MainDoubles.margin2),
          SizedBox(height: CountWidgetDoubles.height, child: CountWidget())
        ],
      );

  last1HourWidgets() => const Wrap(
        direction: Axis.vertical,
        spacing: MainDoubles.wrapSpacing1,
        children: [
          SizedBox(height: MainDoubles.margin1),
          SizedBox(width: SortWidgetDoubles.mainWidth, child: Last1Hour()),
          SizedBox(
              height: MainDoubles.mainHeight,
              width: SortWidgetDoubles.mainWidth,
              child: Last1HourTable())
        ],
      );
  latest1HourWidgets() => const Wrap(
        direction: Axis.vertical,
        spacing: MainDoubles.wrapSpacing1,
        children: [
          SizedBox(height: MainDoubles.margin1),
          SizedBox(width: SortWidgetDoubles.mainWidth, child: Latest1Hour()),
          SizedBox(
              height: MainDoubles.mainHeight,
              width: SortWidgetDoubles.mainWidth,
              child: Latest1HourTable())
        ],
      );
  sortWidgets() => const Wrap(
        direction: Axis.vertical,
        spacing: MainDoubles.wrapSpacing1,
        children: [
          SizedBox(height: MainDoubles.margin1),
          SizedBox(width: SortWidgetDoubles.mainWidth, child: SortWidget()),
          SizedBox(
              height: MainDoubles.mainHeight,
              width: SortWidgetDoubles.mainWidth,
              child: SortResultTable())
        ],
      );
  reportWidgets() => const Wrap(
        direction: Axis.vertical,
        spacing: MainDoubles.wrapSpacing1,
        children: [
          SizedBox(height: MainDoubles.margin1),
          SizedBox(width: SortWidgetDoubles.mainWidth, child: ReportWidget()),
          SizedBox(
              height: MainDoubles.mainHeight,
              width: SortWidgetDoubles.mainWidth,
              child: ReportsTable())
        ],
      );
}
