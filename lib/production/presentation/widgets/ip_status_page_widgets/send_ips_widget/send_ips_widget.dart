import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/state_manement/ip_status_page_manager/send_ips_cubit/send_ips_cubit.dart';
import 'package:flutter/material.dart';
import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/decorations/custom_decorations.dart';
import 'package:elk_frontend/production/others/decorations/custom_paddings.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/presentation/widgets/search_page_widgets/tooltip_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendIpsWidget extends StatefulWidget {
  const SendIpsWidget({super.key});

  @override
  State<SendIpsWidget> createState() => _SendIpsWidgetState();
}

class _SendIpsWidgetState extends State<SendIpsWidget> {
  sendIps() {
    BlocProvider.of<SendIpsCubit>(context).sendIps();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: CustomPaddings.mainPadding,
        decoration: CustomBoxDecorations.outsideBoxDecor,
        child: BlocConsumer<SendIpsCubit, SendIpsState>(
          buildWhen: (previous, current) {
            if (previous.currentState == current.currentState) {
              return false;
            } else {
              return true;
            }
          },
          builder: (context, state) {
            return Wrap(
              alignment: WrapAlignment.center,
              spacing: MainDoubles.wrapSpacing1,
              runSpacing: MainDoubles.wrapSpacing1,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const CustomTooltip(
                    headerText: ReportWidgetStrings.headerText,
                    tooltipText: ReportWidgetStrings.tooltipText),
                customTextFormField1(),
                customTextFormField2(),
                TextButton(
                    style: FormWidgetStyles.searchBtnStyle,
                    onPressed: () {
                      sendIps();
                    },
                    child: const Text(MainStrings.reportBtnString)),
              ],
            );
          },
          listenWhen: (previous, current) {
          if (previous.currentState == current.currentState) {
            return false;
          } else {
            return true;
          }
        },
        listener: snacbarGenerator));
  }
  snacbarGenerator(context, SendIpsState state) {
    String result = "";
    Color backgroundColor = Colors.red;
    switch (state.currentState) {
      case SendingStates.success:
        result = SnackBarStrings.ipSuccess;
        backgroundColor = MainColors.color1;
      case SendingStates.loading:
        result = SnackBarStrings.ipLoading;
        backgroundColor = Colors.yellow;
      case SendingStates.empty:
        result = SnackBarStrings.ipEmpty;
        backgroundColor = Colors.red;
      default:
        result = SnackBarStrings.ipFailed;
        backgroundColor = Colors.red;
    }
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(child: Text(result)),
      backgroundColor: backgroundColor,
    ));
  }

  textFormFieldFunction1(String value) {
    BlocProvider.of<SendIpsCubit>(context)
        .changeOfSaddrFromForm(sourceAddress: value);
  }

  textFormFieldFunction2(String value) {
    BlocProvider.of<SendIpsCubit>(context)
        .changeOfDaddrFromForm(destinationAddress: value);
  }

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
          decoration: FormWidgetDecorations.statusTextFormDecoration1,
        ),
      );
}
