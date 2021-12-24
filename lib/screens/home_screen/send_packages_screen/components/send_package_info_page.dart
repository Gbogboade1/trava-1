import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/spacers/app_date_input.dart';
import 'package:trava/components/fragments/state/avatar_sheet.dart';
import 'package:trava/models/https/hubs/hubs.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/models/podos/send_package_controllers.dart';
import 'package:trava/screens/home_screen/send_packages_screen/components/add_new_package.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/image_utils.dart';
import 'package:trava/utils/snacks.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/trava_dropdown.dart';

class SendPackageInfoPage extends HookWidget {
  final bool offstage;
  final Hubs hubs;
  final SendControllers controllers;
  final GlobalKey<FormState> formKey;
  final VoidCallback? onPackageButtonTapped;
  const SendPackageInfoPage(this.hubs, this.formKey, this.controllers,
      {Key? key, required this.offstage, this.onPackageButtonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final departureStateValue = useState("");
    final destinationStateValue = useState("");
    final model = context.watch<AuthState>();

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //What state will you be sending from?
            Text(
              "What State will you be sending from?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              controllers.departureState,
              validator: TravaValidators.required,
              items: model.state,
              hintText: "e.g Ondo State",
              onChanged: (s) {
                departureStateValue.value = s.selectedData;
              },
            ),
            SizedBox(height: 24.h),
            //What Town will you be sending from?"
            Text(
              "What Town will you be sending from?",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TownDropDownInput(
              controller: controllers.departureTown,
              state: departureStateValue.value,
              validator: TravaValidators.required,
            ),
            SizedBox(height: 24.h),
            //Type of package
            Text(
              "Type of package",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              controllers.weightLevel,
              validator: TravaValidators.required,
              items: [
                SelectionData("Light", "Light"),
                SelectionData("Medium", "Medium"),
                SelectionData("Heavy", "Heavy"),
              ],
              hintText: "e.g Heavy package ",
            ),
            SizedBox(height: 24.h),
            //Package Description
            Text(
              "Package Description",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
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
                controller: controllers.packageDescription,
                minLines: null,
                maxLines: null,
                validator: TravaValidators.required,
                maxLength: 50,
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
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              validator: TravaValidators.required,
              controller: controllers.capacity,
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
            //Package Delivery Mode of Transport
            Text(
              "Package Delivery Mode of Transport",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              controllers.transportMode,
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
            //Package Destination State
            Text(
              "Package Destination State",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              controllers.destinationState,
              validator: TravaValidators.required,
              items: model.state,
              hintText: "e.g Osun State",
              onChanged: (s) => destinationStateValue.value = s.selectedData,
            ),
            SizedBox(height: 24.h),
            //Package Destination Town
            Text(
              "Package Destination Town",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TownDropDownInput(
              controller: controllers.destinationTown,
              state: destinationStateValue.value,
              validator: TravaValidators.required,
            ),
            SizedBox(height: 24.h),
            //Package Delivery Date
            Text(
              "Package Delivery Date",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDateInput(
              controllers.leaveDate,
              validator: TravaValidators.required,
              hintText: "When do you want your package to be delivered?",
            ),
            SizedBox(height: 24.h),
            //Pickup Time
            Text(
              "Pickup Time",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDateInput(
              controllers.leaveTime,
              validator: TravaValidators.required,
              hintText: "When should the deliverer come pickup the package?",
            ),
            SizedBox(height: 24.h),
            //Pickup Location
            Text(
              "Pickup Location",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),

            TravaDropdown(
              controllers.location,
              validator: TravaValidators.required,
              items: hubs.data!
                  .map((e) => SelectionData(e.name ?? "", e.sId ?? ""))
                  .toList(),
              hintText: "e,g DHL, office, Ilesha",
            ), // TextFormField(
            //   controller: controllers.location,
            //   validator: TravaValidators.required,
            //   style: Theme.of(context)
            //       .textTheme
            //       .headline5!
            //       .copyWith(color: kGray1),
            //   keyboardType: TextInputType.number,
            //   decoration: kTextFieldDecoration.copyWith(
            //     hintText: "Where should the deliverer come pickup the package?",
            //   ),
            // ),
            SizedBox(height: 24.h),
            //Select your preferred delivery hub
            Text(
              "Select your preferred delivery hub",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            TravaDropdown(
              controllers.preferredHub,
              validator: TravaValidators.required,
              items: hubs.data!
                  .map((e) => SelectionData(e.name ?? "", e.sId ?? ""))
                  .toList(),
              hintText: "e,g DHL, office, Ilesha",
            ),
            SizedBox(height: 24.h),
            Text(
              "Upload package picture",
              style:
                  Theme.of(context).textTheme.button!.copyWith(color: kBlack),
            ),
            SizedBox(height: 8.h),
            Container(
              decoration: DottedDecoration(
                shape: Shape.box,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                onTap: () async {
                  try {
                    final isGal = await showModalBottomSheet<bool>(
                      backgroundColor: TravaColors.transparent,
                      context: context,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (context) {
                        return const AvatarBottomSheet();
                      },
                    );
                    if (isGal == null) {
                      return;
                    }
                    final imgData = await pickImage(isGal: isGal);
                    if (imgData != null) {
                      final cropImg = await cropImage(imgData);
                      if (cropImg == null) {
                        return;
                      }

                      try {
                        controllers.image.value = cropImg;
                      } catch (e) {
                        showSnack(
                          context: context,
                          message:
                              "Hub picture update failed, please try again",
                          type: SnackType.error,
                        );
                      }
                    }
                  } catch (_) {
                    showSnack(
                      context: context,
                      message: "Hub picture update failed, please try again",
                      type: SnackType.error,
                    );
                  }
                },
                child: ValueListenableBuilder<File?>(
                    valueListenable: controllers.image,
                    builder: (context, daata, ____) {
                      return daata == null
                          ? Container(
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
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: kGray3)),
                                      const TextSpan(
                                          text: " to upload package picture"),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Image.file(daata);
                    }),
              ),
            ),

            SizedBox(height: 24.h),
            ValueListenableBuilder<bool>(
                valueListenable: controllers.insure,
                builder: (context, isChecked, child) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          isChecked = !isChecked;
                        },
                        child: Container(
                            height: 16.w,
                            width: 16.w,
                            decoration: BoxDecoration(
                              color: isChecked
                                  ? TravaColors.black
                                  : TravaColors.white,
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
                  );
                }),
            SizedBox(height: 40.h),
            Offstage(
              offstage: offstage,
              child: AddNewPackageButton(onTap: () {
                if (formKey.currentState!.validate() &&
                    controllers.image.value != null) {
                  onPackageButtonTapped != null
                      ? onPackageButtonTapped!()
                      : () {};
                }
              }),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
