import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/send_packages_screen/components/send_package_info_page.dart';
import 'package:trava/widgets/buttons/back_button.dart';
import 'package:trava/widgets/buttons/default_button.dart';

class SendPackagesScreen extends HookWidget {
  static const String routeName = "/send_payments";
 
  const SendPackagesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final packageList = useState<List<int>>([1]);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const Spacer(),
                  Text("Send Package(s)",
                      style: Theme.of(context).textTheme.headline2),
                  const Spacer()
                ],
              ),
              SizedBox(height: 24.h),
              ...[
                if (packageList.value.length == 1)
                  Expanded(
                    child: SendPackageInfoPage(
                      offstage: false,
                      onPackageButtonTapped: () {
                        packageList.value.isNotEmpty
                            ? packageList.value.add(packageList.value.last + 1)
                            : packageList.value.add(1);
                      },
                    ),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: packageList.value.length,
                      itemBuilder: (context, index) {
                        String packageRank = () {
                          switch (index) {
                            case 0:
                              return "1st";
                            case 1:
                              return "2nd";
                            case 2:
                              return "3rd";
                            default:
                              return "${index + 1}th";
                          }
                        }();
                        return ExpansionTile(
                          maintainState: true,
                          initiallyExpanded:
                              packageList.value[index] == packageList.value.last
                                  ? true
                                  : false,
                          title: Text("$packageRank Package Details"),
                          children: [
                            SendPackageInfoPage(
                              onPackageButtonTapped: () {
                                packageList.value.isNotEmpty
                                    ? packageList.value
                                        .add(packageList.value.last + 1)
                                    : packageList.value.add(1);
                              },
                              offstage: packageList.value[index] ==
                                      packageList.value.last
                                  ? false
                                  : true,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
              ],
              const DefaultButton(
                isActive: false,
                buttonLabel: "Request for a deliverer",
              )
            ],
          ),
        ),
      ),
    );
  }
}
