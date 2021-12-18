import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/widgets/buttons/back_button.dart';

class TrackPackageScreen extends StatefulWidget {
  static const String routeName = "/track_package";
  const TrackPackageScreen(this.package, {Key? key}) : super(key: key);
  final Data package;

  @override
  _TrackPackageScreenState createState() => _TrackPackageScreenState();
}

class _TrackPackageScreenState extends State<TrackPackageScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(7.376736, 3.939786), zoom: 17.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24.0.w),
              child: Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text("Track Package",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
            ),
            const Expanded(
              child: GoogleMap(
                myLocationEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: _initialCameraPosition,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        // height: 200,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 24.h),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: TravaColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Package ${widget.package.deliveryCode} Tracking Details ",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 14.sp),
            ),
            SizedBox(height: 17.h),
            Row(
              children: [
                const Icon(Icons.my_location_outlined,
                    color: Color(0xff1A1AF2)),
                SizedBox(width: 20.w),
                Text(
                  "${widget.package.sendTown}, ${widget.package.sendState} State",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: TravaColors.black),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 11.w),
                height: 40.h,
                decoration: DottedDecoration(
                  shape: Shape.line,
                  linePosition: LinePosition.left,
                )),
            Row(
              children: [
                const Icon(Icons.local_taxi_sharp, color: Color(0xffFFD80B)),
                SizedBox(width: 20.w),
                Flexible(
                  child: Text(
                    "Ife, Osun State (2 hours out to delivery location)",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: TravaColors.black),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 11.w),
              height: 40.h,
              decoration: DottedDecoration(
                shape: Shape.line,
                linePosition: LinePosition.left,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.location_on, color: Color(0xff06B248)),
                SizedBox(width: 20.w),
                Flexible(
                  child: Text(
                    "${widget.package.destTown}, ${widget.package.destState} State",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: TravaColors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
