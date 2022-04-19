
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/spacers/app_date_input.dart';
import 'package:trava/models/https/request/pick_package_request.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/trava_dropdown.dart';

class RequestToDeliverScreen extends HookWidget {
  RequestToDeliverScreen({Key? key}) : super(key: key);
  static const routeName = '/request-to-deliver';
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final departureStateValue = useState("");
    final destinationStateValue = useState("");

    TextEditingController departureState = useTextEditingController();
    TextEditingController destinationState = useTextEditingController();
    TextEditingController capacity = useTextEditingController();
    final TextEditingController destinationTown = useTextEditingController();
    final TextEditingController departureTown = useTextEditingController();
    final TextEditingController transportMode = useTextEditingController();
    final TextEditingController weightLevel = useTextEditingController();
    final TextEditingController leaveTime = useTextEditingController();
    final TextEditingController leaveDate = useTextEditingController();
    final model = context.watch<AuthState>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text("Request to deliver package(s)",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //What State will you be travelling from?
                        Text(
                          "What State will you be travelling from?",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kBlack),
                        ),
                        SizedBox(height: 8.h),
                        TravaDropdown(
                          departureState,
                          validator: TravaValidators.required,
                          hintText: "e.g Ondo State",
                          items: model.state,
                          onChanged: (s) {
                            departureStateValue.value = s.selectedData;
                          },
                        ),
                        SizedBox(height: 24.h),
                        //What Town will you be travelling from?
                        Text(
                          "What Town will you be travelling from?",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kBlack),
                        ),
                        SizedBox(height: 8.h),
                        TownDropDownInput(
                          controller: departureTown,
                          state: departureStateValue.value,
                          validator: TravaValidators.required,
                        ),
                        SizedBox(height: 24.h),
                        //How many packages can you deliver?
                        Text(
                          "How many Package(s) can you deliver?",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kBlack),
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: kGray1),
                          keyboardType: TextInputType.number,
                          controller: capacity,
                          validator: TravaValidators.required,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "e.g 2",
                          ),
                        ),
                        SizedBox(height: 24.h),
                        //What is the mode of transport you will be using?
                        Text(
                          "Mode of Transport",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kBlack),
                        ),
                        SizedBox(height: 8.h),
                        TravaDropdown(
                          transportMode,
                          validator: TravaValidators.required,
                          items: [
                            SelectionData(
                              "Public Transportation",
                              "Public Transportation",
                            ),
                            SelectionData(
                              "Private vehicle",
                              "Private vehicle",
                            ),
                          ],
                          hintText: "e.g Public Transport",
                        ),
                        SizedBox(height: 24.h),

                        //What state are you travelling to?
                        Text(
                          "What State are you Travelling to?",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kBlack),
                        ),
                        SizedBox(height: 8.h),

                        TravaDropdown(
                          destinationState,
                          validator: TravaValidators.required,
                          hintText: "eg. Ondo State",
                          items: model.state,
                          onChanged: (s) =>
                              destinationStateValue.value = s.selectedData,
                        ),
                        SizedBox(height: 24.h),
                        //What Town are you travelling to?
                        Text(
                          "What Town are you Travelling to?",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kBlack),
                        ),
                        SizedBox(height: 8.h),
                        TownDropDownInput(
                          controller: destinationTown,
                          state: destinationStateValue.value,
                          validator: TravaValidators.required,
                        ),

                        SizedBox(height: 24.h),
                        //When are you travelling?
                        Text(
                          "When are you Travelling?",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kBlack),
                        ),
                        SizedBox(height: 8.h),
                        TravaDateInput(
                          leaveDate,
                          validator: TravaValidators.required,
                          // items: const [],
                          hintText: "DD - MM - YYYY?",
                        ),
                        SizedBox(height: 24.h),
                        //What Time are you travelling?
                        Text(
                          "What Time are you Travelling?",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kBlack),
                        ),
                        SizedBox(height: 8.h),
                        TravaDateInput.time(
                          leaveTime,
                          validator: TravaValidators.required,
                          // items: const [],
                          hintText: "Hr:mm?",
                        ),
                        SizedBox(height: 24.h),
                        //What type of Package can you deliver?
                        Text(
                          "What type of Package can you deliver?",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: kBlack),
                        ),
                        SizedBox(height: 8.h),
                        TravaDropdown(
                          weightLevel,
                          validator: TravaValidators.required,
                          items: [
                            SelectionData("Light", "Light"),
                            SelectionData("Medium", "Medium"),
                            SelectionData("Heavy", "Heavy"),
                          ],
                          hintText: "e.g Any kind of package",
                        ),

                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
              DefaultButton(
                isActive: true,
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    String time =
                        "${leaveDate.text} ${leaveTime.text.substring(0, leaveTime.text.length - 3)}:00 ${leaveTime.text.substring(leaveTime.text.length - 2)} Z";
                    final formatter =
                        DateFormat(r'''dd-MMM-yyyy hh:mm:ss a Z''');

                    final dateTimeFromStr = formatter.parse(time);

                    model.deliveryRequest(
                      PickPackageRequest(
                        capacity: int.tryParse(capacity.text),
                        fromState: departureState.text,
                        fromTown: departureTown.text,
                        toState: destinationState.text,
                        toTown: destinationTown.text,
                        packageType: weightLevel.text,
                        transportMode: transportMode.text,
                        travelTime: dateTimeFromStr.toString(),
                      ),
                      context,
                    );
                  }
                },
                buttonLabel: "Request to deliver",
              )
            ],
          ),
        ),
      ),
    );
  }
}
