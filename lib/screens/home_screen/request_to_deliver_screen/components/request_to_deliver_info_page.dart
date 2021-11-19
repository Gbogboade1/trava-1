import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/utilities/constants.dart';
import 'package:trava/widgets/trava_dropdown.dart';

class RequestToDeliverForm extends StatefulWidget {
  const RequestToDeliverForm({Key? key}) : super(key: key);

  @override
  _RequestToDeliverFormState createState() =>
      _RequestToDeliverFormState();
}

class _RequestToDeliverFormState extends State<RequestToDeliverForm> {
  String? _chosenSendingState;
  String? _chosenSendingTown;
  String? _chosenTransportMode;
  String? _chosenDestinationState;
  String? _chosenDestinationTown;
  String? _chosenTravelDate;
  String? _chosenTravelTime;
  String? _chosenPackageType;
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
              value: _chosenSendingState,
              onChanged: (String? value) {
                setState(() {
                  _chosenSendingState = value;
                });
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
              hint: "e.g Ibadan",
              value: _chosenSendingTown,
              onChanged: (String? value) {
                setState(() {
                  _chosenSendingTown = value;
                });
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
              hint: "e.g Public Transport",
              value: _chosenTransportMode,
              onChanged: (String? value) {
                setState(() {
                  _chosenTransportMode = value;
                });
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
              hint: "e.g Ondo State",
              value: _chosenDestinationState,
              onChanged: (String? value) {
                setState(() {
                  _chosenDestinationState = value;
                });
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
              hint: "e.g Ibadan",
              value: _chosenDestinationTown,
              onChanged: (String? value) {
                setState(() {
                  _chosenDestinationTown = value;
                });
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
              hint: "What's your travel date",
              value: _chosenTravelDate,
              onChanged: (String? value) {
                setState(() {
                  _chosenTravelDate = value;
                });
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
              hint: "What time will you be travelling at the set date?",
              value: _chosenTravelTime,
              onChanged: (String? value) {
                setState(() {
                  _chosenTravelTime = value;
                });
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
              hint: "e.g Any kind of package",
              value: _chosenPackageType,
              onChanged: (String? value) {
                setState(() {
                  _chosenPackageType = value;
                });
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
