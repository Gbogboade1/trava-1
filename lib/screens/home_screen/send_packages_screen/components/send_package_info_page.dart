import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/send_packages_screen/components/add_new_package.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/widgets/trava_dropdown.dart';

class SendPackageInfoPage extends StatefulWidget {
  final bool offstage;
  final VoidCallback? onPackageButtonTapped;
  const SendPackageInfoPage(
      {Key? key, required this.offstage, this.onPackageButtonTapped})
      : super(key: key);

  @override
  _SendPackageInfoPageState createState() => _SendPackageInfoPageState();
}

class _SendPackageInfoPageState extends State<SendPackageInfoPage> {
  String? _chosenSendingState;

  String? _chosenSendingTown;

  String? _chosenPackageType;

  String? _chosenDeliveryMode;

  String? _chosenDestinationState;

  String? _chosenDestinationTown;

  String? _chosenDeliveryDate;

  String? _chosenPickupTime;

  String? _chosenPickupLocation;

  String? _chosenDeliveryHub;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // final sendingState = useTextEditingController();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //What state will you be sending from?
          Text(
            "What State will you be sending from?",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
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
          //What Town will you be sending from?"
          Text(
            "What Town will you be sending from?",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            hint: "e.g Akure",
            value: _chosenSendingTown,
            onChanged: (String? value) {
              setState(() {
                _chosenSendingTown = value;
              });
            },
          ),
          SizedBox(height: 24.h),
          //Type of package
          Text(
            "Type of package",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            hint: "e.g Heavy package ",
            value: _chosenPackageType,
            onChanged: (String? value) {
              setState(() {
                _chosenPackageType = value;
              });
            },
          ),
          SizedBox(height: 24.h),
          //Package Description
          Text(
            "Package Description",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 88.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: const Color(0xffefefef).withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: null,
              maxLines: null,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: kGray1),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Not more than 50 words",
                hintStyle: TextStyle(
                    color: const Color(0xff828282),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          //Package Quantity
          Text(
            "Package Quantity",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            style:
                Theme.of(context).textTheme.headline5!.copyWith(color: kGray1),
            keyboardType: TextInputType.number,
            decoration: kTextFieldDecoration.copyWith(
              hintText: "e.g 2",
            ),
          ),
          SizedBox(height: 24.h),
          //Package Delivery Mode of Transport
          Text(
            "Package Delivery Mode of Transport",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            hint: "e.g Private car",
            value: _chosenDeliveryMode,
            onChanged: (String? value) {
              setState(() {
                _chosenDeliveryMode = value;
              });
            },
          ),
          SizedBox(height: 24.h),
          //Package Destination State
          Text(
            "Package Destination State",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            hint: "e.g Osun State",
            value: _chosenDestinationState,
            onChanged: (String? value) {
              setState(() {
                _chosenDestinationState = value;
              });
            },
          ),
          SizedBox(height: 24.h),
          //Package Destination Town
          Text(
            "Package Destination Town",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            hint: "e.g Ilesha",
            value: _chosenDestinationTown,
            onChanged: (String? value) {
              setState(() {
                _chosenDestinationTown = value;
              });
            },
          ),
          SizedBox(height: 24.h),
          //Package Delivery Date
          Text(
            "Package Delivery Date",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            hint: "When do you want your package to be delivered?",
            value: _chosenDeliveryDate,
            onChanged: (String? value) {
              setState(() {
                _chosenDeliveryDate = value;
              });
            },
          ),
          SizedBox(height: 24.h),
          //Pickup Time
          Text(
            "Pickup Time",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            hint: "When should the deliverer come pickup the package?",
            value: _chosenPickupTime,
            onChanged: (String? value) {
              setState(() {
                _chosenPickupTime = value;
              });
            },
          ),
          SizedBox(height: 24.h),
          //Pickup Location
          Text(
            "Pickup Location",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            hint: "Where should the deliverer come pickup the package?",
            value: _chosenPickupLocation,
            onChanged: (String? value) {
              setState(() {
                _chosenPickupLocation = value;
              });
            },
          ),
          SizedBox(height: 24.h),
          //Select your preferred delivery hub
          Text(
            "Select your preferred delivery hub",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            hint: "e,g DHL, office, Ilesha",
            value: _chosenDeliveryHub,
            onChanged: (String? value) {
              setState(() {
                _chosenDeliveryHub = value;
              });
            },
          ),
          SizedBox(height: 24.h),
          Text(
            "Upload package picture",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          Container(
            decoration: DottedDecoration(
              shape: Shape.box,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              color: const Color(0xffEFEFEF).withOpacity(0.5),
              padding: EdgeInsets.symmetric(vertical: 33.h),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: kGray3,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300),
                    children: [
                      TextSpan(
                          text: "Tap here",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  decoration: TextDecoration.underline,
                                  color: kGray3)),
                      const TextSpan(text: " to upload package picture"),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 24.h),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Container(
                  height: 16.w,
                  width: 16.w,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                  ),
                  child: isChecked
                      ? const FittedBox(
                          child: Icon(Icons.check_box_rounded),
                        )
                      : const SizedBox(),
                ),
              ),
              SizedBox(width: 8.w),
              const Text("Insure my packages at 400")
            ],
          ),
          SizedBox(height: 40.h),
          Offstage(
            offstage: widget.offstage,
            child: AddNewPackageButton(onTap: widget.onPackageButtonTapped),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
