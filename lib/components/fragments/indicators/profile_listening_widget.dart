// import 'dart:developer';

// import 'package:flutter/widgets.dart';
// import 'package:cred_agent/models/http/response/onboarding_models.dart';
// import 'package:cred_agent/services/storage/storage.dart';
// import 'package:cred_agent/utils/helpers.dart';
// import 'package:cred_agent/utils/typedefs.dart';

// class ProfileDataListeningWidget extends StatelessWidget {
//   final ListenerBuilder<UserData> builder;

//   ProfileDataListeningWidget({required this.builder});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: LocalStorage.userDataListener,
//       builder: (context, _, __) {
//         final userData = profileInfo();
//         return builder(context, userData.userData);
//       },
//     );
//   }
// }
