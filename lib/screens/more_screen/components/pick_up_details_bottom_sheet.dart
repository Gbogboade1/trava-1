
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trava/components/fragments/spacers/app_sized_box.dart';
import 'package:trava/models/enums/is_bloody.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
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
