import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/widgets/trava_dropdown.dart';

class RequestToDeliverForm extends StatefulWidget {
  const RequestToDeliverForm({Key? key}) : super(key: key);

  @override
  _RequestToDeliverFormState createState() => _RequestToDeliverFormState();
}

class _RequestToDeliverFormState extends State<RequestToDeliverForm> {
  final ValueNotifier<SelectionData?> _chosenSendingState = ValueNotifier(null);
  final ValueNotifier<SelectionData?> _chosenSendingTown = ValueNotifier(null);
  final ValueNotifier<SelectionData?> _chosenTransportMode =
      ValueNotifier(null);
  final ValueNotifier<SelectionData?> _chosenDestinationState =
      ValueNotifier(null);
  final ValueNotifier<SelectionData?> _chosenDestinationTown =
      ValueNotifier(null);
  final ValueNotifier<SelectionData?> _chosenTravelDate = ValueNotifier(null);
  final ValueNotifier<SelectionData?> _chosenTravelTime = ValueNotifier(null);
  final ValueNotifier<SelectionData?> _chosenPackageType = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //What State will you be travelling from?
            Text(
              "What State will you be travelling from?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              hint: "e.g Ondo State",
              items: const [],
              value: _chosenSendingState,
              onChanged: (SelectionData? value) {
                _chosenSendingState.value = value;
              },
            ),
            SizedBox(height: 24.h),
            //What Town will you be travelling from?
            Text(
              "What Town will you be travelling from?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              items: const [],
              hint: "e.g Ibadan",
              value: _chosenSendingTown,
              onChanged: (SelectionData? value) {
                _chosenSendingTown.value = value;
              },
            ),
            SizedBox(height: 24.h),
            //How many packages can you deliver?
            Text(
              "How many Package(s) can you deliver?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: kGray1),
              keyboardType: TextInputType.number,
              decoration: kTextFieldDecoration.copyWith(
                hintText: "e.g 2",
              ),
            ),
            SizedBox(height: 24.h),
            //What is the mode of transport you will be using?
            Text(
              "Mode of Transport",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              items: const [],
              hint: "e.g Public Transport",
              value: _chosenTransportMode,
              onChanged: (SelectionData? value) {
                _chosenTransportMode.value = value;
              },
            ),
            SizedBox(height: 24.h),

            //What state are you travelling to?
            Text(
              "What State are you Travelling to?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              items: const [],
              hint: "e.g Ondo State",
              value: _chosenDestinationState,
              onChanged: (SelectionData? value) {
                _chosenDestinationState.value = value;
              },
            ),
            SizedBox(height: 24.h),
            //What Town are you travelling to?
            Text(
              "What Town are you Travelling to?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              items: const [],
              hint: "e.g Ibadan",
              value: _chosenDestinationTown,
              onChanged: (SelectionData? value) {
                _chosenDestinationTown.value = value;
              },
            ),
            SizedBox(height: 24.h),
            //When are you travelling?
            Text(
              "When are you Travelling?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              items: const [],
              hint: "What's your travel date",
              value: _chosenTravelDate,
              onChanged: (SelectionData? value) {
                _chosenTravelDate.value = value;
              },
            ),
            SizedBox(height: 24.h),
            //What Time are you travelling?
            Text(
              "What Time are you Travelling?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              items: const [],
              hint: "What time will you be travelling at the set date?",
              value: _chosenTravelTime,
              onChanged: (SelectionData? value) {
                _chosenTravelTime.value = value;
              },
            ),
            SizedBox(height: 24.h),
            //What type of Package can you deliver?
            Text(
              "What type of Package can you deliver?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              items: const [],
              hint: "e.g Any kind of package",
              value: _chosenPackageType,
              onChanged: (SelectionData? value) {
                _chosenPackageType:
                value;
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
