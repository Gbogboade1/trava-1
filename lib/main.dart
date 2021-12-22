import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trava/state_wrapper.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/screens/splash_screen/splash_screen.dart';
import 'package:trava/utils/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("app_data");
  await Hive.openBox("user_data");
  runApp(const TravaApp());
}

class TravaApp extends StatelessWidget {
  const TravaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateWrapper(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "TRAVA",
          theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedIconTheme: const IconThemeData(
                color: Color(0XFF17123B),
              ),
              unselectedIconTheme: const IconThemeData(
                color: Color(0XFFBDBDBD),
              ),
              selectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0XFF17123B),
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0XFFBDBDBD),
              ),
            ),
            colorScheme: ColorScheme.light(
              primary: const Color(0XFF17123B),
              primaryVariant: const Color(0XFF8B889D),
              onPrimary: const Color(0XFFFFFDFD),
              secondary: const Color(0xFFFBFCFF),
              secondaryVariant: const Color(0xffD0D1D4).withOpacity(0.5),
            ),
            textTheme: GoogleFonts.koHoTextTheme(
              TextTheme(
                headline1: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  color: TravaColors.black,
                ),
                headline2: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: TravaColors.black,
                ),
                headline3: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: TravaColors.black,
                ),
                headline4: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: TravaColors.black,
                ),
                headline5: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: TravaColors.black,
                ),
                bodyText1: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color:  TravaColors.black,
                ),
                bodyText2: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: TravaColors.black,
                ),
                button: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0XFFFBFCFF),
                ),
              ),
            ),
          ),
          routes: routes,
          initialRoute: SplashScreen.routeName,
          onGenerateRoute: dynamicRoutes,
        ),
      ),
    );
  }
}
