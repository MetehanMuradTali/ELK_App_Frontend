import 'package:elk_frontend/core/sizes.dart';
import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/report_cubit.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/search_cubit.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/sort_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/count_widget/count_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/report_widgets/report_table_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/report_widgets/report_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/search_widgets/search_result_pagination_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/sort_widgets/sort_result_table.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/sort_widgets/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/main_page_widgets/form_widget.dart';
import '../widgets/main_page_widgets/search_widgets/search_result_table.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    double searchWidth = width * 0.8;

    return ListView(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          children: [
            Wrap(
              direction: Axis.vertical,
              spacing: 10,
              runSpacing: 10,
              children: [
                const SizedBox(height: 5),
                SizedBox(width: searchWidth, child: const FormWidget()),
                SizedBox(
                  height: MainDoubles.mainHeight,
                  width: searchWidth,
                  child: const SearchResultTable(),
                ),
                SizedBox(width: searchWidth, child: const PaginationWidget()),
                const SizedBox(height: 10),
                const SizedBox(height: 100, child:  CountWidget())
              ],
            ),
            const Wrap(
              direction: Axis.vertical,
              spacing: 10,
              runSpacing: 10,
              children: [
                SizedBox(height: 5),
                SizedBox(
                    width: SortWidgetDoubles.mainWidth, child: SortWidget()),
                SizedBox(
                    height: MainDoubles.mainHeight,
                    width: SortWidgetDoubles.mainWidth,
                    child: SortResultTable()),
                SizedBox(height: 5),
                SizedBox(
                    width: SortWidgetDoubles.mainWidth, child: ReportWidget()),
                SizedBox(
                    height: MainDoubles.mainHeight,
                    width: SortWidgetDoubles.mainWidth,
                    child: ReportsTable()),
              ],
            )
          ],
        ),
      ],
    );
  }
}
