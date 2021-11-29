import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apploader extends StatelessWidget {
  const Apploader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator(
              radius: 15,
            )
          : const CircularProgressIndicator(),
    );
  }
}
