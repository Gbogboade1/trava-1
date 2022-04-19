import 'dart:async';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/state/profile/auth_state.dart';
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
  Set<Marker> _markers = Set();
  late BitmapDescriptor customIcon;
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(8.376736, 3.939786), zoom: 17.0);
  final Completer<GoogleMapController> _controller = Completer();

  String address = "";
  @override
  initState() {
    super.initState();

    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        devicePixelRatio: 1.5,
        size: Size(10, 10),
      ),
      'assets/images/driving_pin.png',
    ).then((d) {
      customIcon = d;
      _markers.add(
        Marker(
          markerId: const MarkerId(
            'sourcePin',
          ),
          position: _initialCameraPosition.target,
          // infoWindow: InfoWindow(title: address, snippet: "go here"),
          icon: d,
        ),
      );
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return ValueListenableBuilder<LatLng>(
      valueListenable: model.positions,
      builder: (context, position, child) {
        updatePinOnMap(position);
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
                Expanded(
                  child: GoogleMap(
                    myLocationEnabled: false,
                    markers: _markers,
                    mapToolbarEnabled: true,
                    zoomControlsEnabled: !false,
                    onMapCreated: (controller) {
                      _controller.complete(controller);
                      showPinsOnMap(position);
                    },
                    initialCameraPosition: _initialCameraPosition,
                  ),
                )
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
                    const Icon(Icons.local_taxi_sharp,
                        color: Color(0xffFFD80B)),
                    SizedBox(width: 20.w),
                    Flexible(
                      child: Text(
                        address,
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
      },
    );
  }

  void showPinsOnMap(LatLng pinPosition) {
    _markers.add(Marker(
      markerId: MarkerId('sourcePin'),
      position: pinPosition,
      icon: customIcon,
    ));
  }

  void updatePinOnMap(LatLng pinPosition) async {
    CameraPosition cPosition = CameraPosition(
      zoom: 17.0,
      bearing: 30,
      target: pinPosition,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));

    List<Placemark> result = await placemarkFromCoordinates(
        pinPosition.latitude, pinPosition.longitude);

    address = result.first.locality ??
        result.first.subLocality ??
        result.first.thoroughfare ??
        result.first.subThoroughfare ??
        "";
    setState(() {
      _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
      _markers.add(
        Marker(
          markerId: MarkerId('sourcePin'),
          position: pinPosition,
          icon: customIcon,
        ),
      );
    });
  }
}
