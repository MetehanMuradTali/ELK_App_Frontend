import 'package:elk_frontend/core/sizes.dart';
import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/presentation/state_manement/ip_status_page_manager/search_cubit/search_cubit.dart';
import 'package:elk_frontend/production/presentation/state_manement/ip_status_page_manager/send_ips_cubit/send_ips_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/ip_status_page_widgets/search_widgets/form_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/ip_status_page_widgets/search_widgets/search_result_pagination_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/ip_status_page_widgets/search_widgets/search_result_table.dart';
import 'package:elk_frontend/production/presentation/widgets/ip_status_page_widgets/send_ips_widget/send_ips_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IpStatusPage extends StatelessWidget {
  const IpStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StatusSearchCubit>(
            create: (context) => StatusSearchCubit()),
        BlocProvider<SendIpsCubit>(
            create: (context) => SendIpsCubit()),
      ],
      child: const ListOfItems(),
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
          sendIpsWidgets(),
        ]),
      ],
    );
  }

  searchWidgets(searchWidth) => Wrap(
        direction: Axis.vertical,
        spacing: MainDoubles.wrapSpacing1,
        children: [
          const SizedBox(height: MainDoubles.margin1),
          SizedBox(width: searchWidth, child: const StatusFormWidget()),
          SizedBox(
              height: MainDoubles.mainHeight,
              width: searchWidth,
              child: const StatusSearchResultTable()),
          SizedBox(width: searchWidth, child: const StatusPaginationWidget()),
        ],
      );
   sendIpsWidgets() => const Wrap(
        direction: Axis.vertical,
        spacing: MainDoubles.wrapSpacing1,
        children: [
          SizedBox(height: MainDoubles.margin1),
          SizedBox(width: SortWidgetDoubles.mainWidth, child: SendIpsWidget()),
        ],
      );
}
