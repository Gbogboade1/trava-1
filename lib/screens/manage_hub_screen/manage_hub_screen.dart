import 'dart:developer';
import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/src/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/components/hooks/profile_data_listening_widget.dart';
import 'package:trava/models/https/hubs/hubs.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';
import 'package:trava/widgets/trava_dropdown.dart';
import 'package:trava/utils/extensions.dart';

class ManageHubScreen extends HookWidget {
  static const routeName = '/manage-hub';

  ValueNotifier<String> state = ValueNotifier<String>("");
  ManageHubScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    final scaler = context.scaler;
    final description = useTextEditingController();
    final stateDrop = useTextEditingController();
    final town = useTextEditingController();
    final name = useTextEditingController();
    return Container(
      height: scaler.sizer.height,
      width: scaler.sizer.width,
      color: TravaColors.white,
      child: ValueListenableBuilder<Future<Hubs?>?>(
        valueListenable: model.myHubs,
        builder: (context, data, ____) {
          return FutureBuilder<Hubs?>(
            future: data,
            builder: (context, task) {
              if (task.connectionState == ConnectionState.waiting &&
                  task.data == null) return const Apploader();
              if (task.hasError && task.data == null) {
                return TravaErrorState(
                  errorMessage: parseError(
                    task.error,
                    "We could not fetch profile",
                  ),
                  onRetry: () =>
                      model.myHubs = ValueNotifier(model.getMyHubsFromOnline()),
                );
              }
              log(task.data!.data![0].toJson().toString());
              description.text = task.data!.data![0].description!;
              town.text = task.data!.data![0].town!;
              stateDrop.text = task.data!.data![0].state!;
              state.value = task.data!.data![0].state!;
              name.text = task.data!.data![0].name!;
              try {
                //
                model.networkToFile(task.data!.data![0].images?[0]);
              } catch (e) {}
              return CustomScaffold(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBackButton(),
                      SizedBox(height: 16.h),
                      Text(
                        "Manage your hub",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Please fill the fields below to register your hub",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Hub Name",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: name,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "The name of your hub",
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.headline5,
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
                          controller: description,
                          maxLines: null,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: kGray1),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "eg. 22 Gberikoko opposite ondo fuel station",
                            hintStyle: TextStyle(
                                color: const Color(0xff828282),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "State",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: kBlack),
                      ),
                      SizedBox(height: 8.h),
                      TravaDropdown(
                        stateDrop,
                        validator: TravaValidators.required,
                        items: model.state,
                        onChanged: (s) => state.value = s.selectedData,
                        hintText: "Choose the state your hub in located at",
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "City/Town",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: kBlack),
                      ),
                      SizedBox(height: 8.h),
                      ValueListenableBuilder<String>(
                        valueListenable: state,
                        builder: (context, data, ___) => TownDropDownInput(
                          controller: town,
                          state: data.toLowerCase(),
                          validator: TravaValidators.required,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Upload hub picture(s)",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: kBlack),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        decoration: DottedDecoration(
                          shape: Shape.box,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ValueListenableBuilder<File?>(
                            valueListenable: model.image,
                            builder: (context, data, ___) {
                              if (data == null) {
                                return Container(
                                  color:
                                      const Color(0xffEFEFEF).withOpacity(0.5),
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
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  model.selectImage(context);
                                                },
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      color: kGray3)),
                                          const TextSpan(
                                              text:
                                                  " to upload hub picture(s)"),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return TravaSizedBox(
                                height: 25,
                                width: 100,
                                child: Stack(
                                  children: [
                                    Image.file(
                                      data,
                                      fit: BoxFit.cover,
                                      height: scaler.sizer.height * 0.25,
                                      width: scaler.sizer.width,
                                    ),
                                    Center(
                                      child: Container(
                                        color: const Color(0xffEFEFEF)
                                            .withOpacity(0.9),
                                        padding: scaler.insets.all(1.5),
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                color: kGray3,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w300),
                                            children: [
                                              TextSpan(
                                                  text: "Tap here",
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          model.selectImage(
                                                              context);
                                                        },
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
                                                      .copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          color: kGray3)),
                                              const TextSpan(
                                                  text:
                                                      " to upload hub picture(s)"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: 27.h),
                      DefaultButton(
                        isActive: true,
                        buttonLabel: "Manage Hub",
                        onTap: () async {
                          if (formKey.currentState!.validate() &&
                              model.image.value != null) {
                            final register = await formSubmitDialog(
                                context: context,
                                future: model.manageHub(
                                  town.text,
                                  name.text,
                                  description.text,
                                  stateDrop.text,
                                ),
                                prompt: "Managing your hub...");

                            if (register != null) {
                              model.status.value = null;
                              model.image.value = null;
                              showNotificationBottomSheet(
                                context,
                                title: "Hub Successful Managed",
                                message:
                                    "Your hub has been successfully managed. You’ll get a notification when your registration has been rectified.",
                              );
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
