import 'dart:io';

import 'package:flutter/material.dart';

class SendControllers {
  ValueNotifier<File?> image = ValueNotifier(null);
  ValueNotifier<bool> insure = ValueNotifier(false);
  TextEditingController departureState = TextEditingController();
  TextEditingController destinationState = TextEditingController();
  TextEditingController capacity = TextEditingController();
  TextEditingController location = TextEditingController();
  final TextEditingController destinationTown = TextEditingController();
  final TextEditingController preferredHub = TextEditingController();
  final TextEditingController packageDescription = TextEditingController();
  final TextEditingController departureTown = TextEditingController();
  final TextEditingController transportMode = TextEditingController();
  final TextEditingController weightLevel = TextEditingController();
  final TextEditingController leaveTime = TextEditingController();
  final TextEditingController leaveDate = TextEditingController();
}
