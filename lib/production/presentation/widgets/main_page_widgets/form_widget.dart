import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/constants/projects_lists.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/presentation/state_manement/cubit/search_cubit/search_cubit.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/count_widget/count_widget.dart';
import 'package:elk_frontend/production/presentation/widgets/main_page_widgets/dropdown.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormState();
}

class _FormState extends State<FormWidget> {
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
            customTextFormField(),
            const CustomDropDownWidget(),
            searchButton(),
            const CountWidget(),
          ],
        ),
      ),
    );
  }
  //********FUNCTIONS******

  textFormFieldFunction(String value) {
    BlocProvider.of<SearchCubit>(context).changeOfValueFromForm(value: value);
  }

  searchButtonFunction() {
    BlocProvider.of<SearchCubit>(context).search();
  }

  //********WIDGETS******
  customTextFormField() => SizedBox(
        width: FormWidgetDoubles.textFieldWidth,
        child: TextFormField(
          onChanged: textFormFieldFunction,
          style: MainStyles.greenStyle,
          decoration: FormWidgetDecorations.textFormDecoration,
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
            items: MainLists.ddWidgetOptions,
            selectedColumn:
                BlocProvider.of<SearchCubit>(context).state.columnName));
  }

  dropDownFunction(String? newColumn) {
    BlocProvider.of<SearchCubit>(context)
        .changeOfColumnFromForm(columnName: newColumn!);
    setState(() {});
  }
}
