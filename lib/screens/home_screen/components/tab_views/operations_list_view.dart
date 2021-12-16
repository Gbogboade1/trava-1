import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/request/sent_response.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/helpers.dart';

class OperationsListView extends StatelessWidget {
  const OperationsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return ValueListenableBuilder<Future<HistorySentResponse?>?>(
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
                Data packageDetails = snapshot.data!.data![index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/speaker.svg',
                      ),
                      SizedBox(width: 16.w),
                      Flexible(
                        child: Text(
                          "Your package (${packageDetails.sId})  to be delivered at ${packageDetails.deliveryHub}, ${packageDetails.destTown}, ${packageDetails.destState} State by  ${packageDetails.sender}. ",
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: const Color(0xff171718),
                                  ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
