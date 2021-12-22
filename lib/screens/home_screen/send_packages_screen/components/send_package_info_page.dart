import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/screens/home_screen/send_packages_screen/components/add_new_package.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/validators.dart';
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
  final ValueNotifier<SelectionData?> _chosenSendingState = ValueNotifier(null);

  final ValueNotifier<SelectionData?> _chosenSendingTown = ValueNotifier(null);

  final ValueNotifier<SelectionData?> _chosenPackageType = ValueNotifier(null);

  final ValueNotifier<SelectionData?> _chosenDeliveryMode = ValueNotifier(null);

  final ValueNotifier<SelectionData?> _chosenDestinationState =
      ValueNotifier(null);

  final ValueNotifier<SelectionData?> _chosenDestinationTown =
      ValueNotifier(null);

  final ValueNotifier<SelectionData?> _chosenDeliveryDate = ValueNotifier(null);

  final ValueNotifier<SelectionData?> _chosenPickupTime = ValueNotifier(null);

  final ValueNotifier<SelectionData?> _chosenPickupLocation =
      ValueNotifier(null);

  final ValueNotifier<SelectionData?> _chosenDeliveryHub = ValueNotifier(null);

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
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "e.g Ondo State",
          ),
          SizedBox(height: 24.h),
          //What Town will you be sending from?"
          Text(
            "What Town will you be sending from?",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "e.g Akure",
          ),
          SizedBox(height: 24.h),
          //Type of package
          Text(
            "Type of package",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "e.g Heavy package ",
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
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "e.g Private car",
          ),
          SizedBox(height: 24.h),
          //Package Destination State
          Text(
            "Package Destination State",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "e.g Osun State",
          ),
          SizedBox(height: 24.h),
          //Package Destination Town
          Text(
            "Package Destination Town",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            hintText: "e.g Ilesha",
            items: const [],
          ),
          SizedBox(height: 24.h),
          //Package Delivery Date
          Text(
            "Package Delivery Date",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "When do you want your package to be delivered?",
          ),
          SizedBox(height: 24.h),
          //Pickup Time
          Text(
            "Pickup Time",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "When should the deliverer come pickup the package?",
          ),
          SizedBox(height: 24.h),
          //Pickup Location
          Text(
            "Pickup Location",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "Where should the deliverer come pickup the package?",
          ),
          SizedBox(height: 24.h),
          //Select your preferred delivery hub
          Text(
            "Select your preferred delivery hub",
            style: Theme.of(context).textTheme.button!.copyWith(color: kBlack),
          ),
          SizedBox(height: 8.h),
          TravaDropdown(
            TextEditingController(),
            validator: TravaValidators.required,
            items: const [],
            hintText: "e,g DHL, office, Ilesha",
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
            child: InkWell(
              onTap: () async {
                final ImagePicker _picker = ImagePicker();
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                //TODO: upload image
              },
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
                      color: isChecked ? TravaColors.black : TravaColors.white,
                      border: Border.all(width: 1.0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: isChecked
                        ? const FittedBox(
                            child: Icon(
                              Icons.check,
                              // size: 30.0,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox()),
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
