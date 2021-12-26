import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/components/hooks/profile_data_listening_widget.dart';
import 'package:trava/models/enums/is_bloody.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/models/https/users/profile_update_request.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/constants.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/validators.dart';
import 'package:trava/widgets/buttons/default_button.dart';
import 'package:trava/widgets/custom_bottom_sheet.dart';
import 'package:trava/widgets/package_details_view.dart';

class PickUpDetailsBottomSheet extends HookWidget {
  const PickUpDetailsBottomSheet(
    this.package, {
    Key? key,
  }) : super(key: key);
  final Data package;
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: "Details",
      content: TravaSizedBox(
        height: 65,
        width: 100,
        child: PackageDetailsView(
          package: package,
          bloody: isBloody.yellow,
        ),
      ),
    );
  }
}
