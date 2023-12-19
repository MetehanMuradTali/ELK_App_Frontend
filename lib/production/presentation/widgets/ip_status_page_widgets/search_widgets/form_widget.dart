import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/presentation/state_manement/ip_status_page_manager/search_cubit/search_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/ip_status_page_widgets/count_widget/status_count_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/search_page_widgets/dropdown.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusFormWidget extends StatefulWidget {
  const StatusFormWidget({super.key});

  @override
  State<StatusFormWidget> createState() => _StatusFormState();
}

class _StatusFormState extends State<StatusFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: CustomPaddings.mainPadding,
        decoration: CustomBoxDecorations.outsideBoxDecor,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: MainDoubles.insideSpacings,
          runSpacing: MainDoubles.insideSpacings,
          children: [
            customTextFormField1(),
            customTextFormField2(),
            const CustomDropDownWidget(),
            searchButton(),
            const StatusCountWidget(),

          ],
        ),
      ),
    );
  }
  //********FUNCTIONS******

  textFormFieldFunction1(String value) {
    BlocProvider.of<StatusSearchCubit>(context)
        .changeOfSaddrFromForm(sourceAdress: value);
  }

  textFormFieldFunction2(String value) {
    BlocProvider.of<StatusSearchCubit>(context)
        .changeOfDaddrFromForm(destinationAdress: value);
  }

  searchButtonFunction() {
    BlocProvider.of<StatusSearchCubit>(context).search();
  }

  //********WIDGETS******
  customTextFormField1() => SizedBox(
        width: FormWidgetDoubles.textFieldWidth,
        child: TextFormField(
          onChanged: textFormFieldFunction1,
          style: MainStyles.greenStyle,
          decoration: FormWidgetDecorations.statusTextFormDecoration1,
        ),
      );
  customTextFormField2() => SizedBox(
        width: FormWidgetDoubles.textFieldWidth,
        child: TextFormField(
          onChanged: textFormFieldFunction2,
          style: MainStyles.greenStyle,
          decoration: FormWidgetDecorations.statusTextFormDecoration2,
        ),
      );
  searchButton() => OutlinedButton(
      style: FormWidgetStyles.searchBtnStyle,
      onPressed: searchButtonFunction,
      child: const Text(FormWidgetStrings.searchBtnTxt));
}

class CustomDropDownWidget extends StatefulWidget {
  const CustomDropDownWidget({super.key});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: FormWidgetDoubles.ddButtonWidth,
        decoration: CustomBoxDecorations.ddWidgetOutsideDecor,
        child: DDWidget(
            callback: dropDownFunction,
            items: StatusPageLists.ddWidgetOptions,
            selectedColumn:
                BlocProvider.of<StatusSearchCubit>(context).state.status));
  }

  dropDownFunction(String? newColumn) {
    BlocProvider.of<StatusSearchCubit>(context)
        .changeOfStatusFromForm(status: newColumn!);
    setState(() {});
  }
}
