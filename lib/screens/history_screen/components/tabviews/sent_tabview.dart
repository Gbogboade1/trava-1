import 'dart:math';
import 'package:flutter/material.dart';
import 'package:trava/screens/history_screen/components/history_tiles.dart';



class SentTabView extends StatelessWidget {
  const SentTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Scrollbar(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              PackageDeliveryStatus packageDeliveryStatus =
                  PackageDeliveryStatus.values[
                      Random().nextInt(PackageDeliveryStatus.values.length)];
              return SentHistoryTile(packageDeliveryStatus: packageDeliveryStatus);
            },
          ),
        ),
      ),
    );
  }
}
