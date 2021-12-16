import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/request/sent_response.dart';
import 'package:trava/screens/history_screen/components/history_tiles.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/helpers.dart';

class SentTabView extends HookWidget {
  const SentTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Expanded(
      child: SizedBox(
        child: Scrollbar(
          child: ValueListenableBuilder<Future<HistorySentResponse?>?>(
              valueListenable: model.sent,
              builder: (context, data, ___) {
                return FutureBuilder<HistorySentResponse?>(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting &&
                          snapshot.data == null) return const Apploader();
                      if (snapshot.hasError && snapshot.data == null) {
                        return TravaErrorState(
                          errorMessage: parseError(
                            snapshot.error,
                            "We could not fetch sent history",
                          ),
                          onRetry: () {},
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return SentHistoryTile(
                            packageDeliveryStatus: getpackaheDeliveryStatus(
                              snapshot.data!.data![index],
                            ),
                            packageDetails: snapshot.data!.data![index],
                          );
                        },
                      );
                    });
              }),
        ),
      ),
    );
  }
}
