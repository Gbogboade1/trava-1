import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/users/profile_data.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/typedefs.dart';

class ProfileSetUpDataListeningWidget extends HookWidget {
  final ListenerBuilder<ProfileData?> builder;

  ProfileSetUpDataListeningWidget({Key? key, required this.builder}) : super(key: key);
  final AuthHttpService _authHttpService = AuthHttpService();
// /user/profile
  @override
  Widget build(BuildContext context) {
    final profileState = useState<ProfileData?>(null);

    return profileState.value != null
        ? builder(context, profileState.value)
        : FutureBuilder<ProfileData?>(
            future: _authHttpService.getProfile(),
            builder: (context, task) {
              if (task.connectionState == ConnectionState.waiting &&
                  task.data == null) return const Apploader();
              if (task.hasError && task.data == null) {
                return TravaErrorState(
                  errorMessage: parseError(
                    task.error,
                    "We could not fetch profile",
                  ),
                  onRetry: () {},
                );
              }
              profileState.value = task.data;
              return builder(context, task.data);
            },
          );
  }
}
