import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/screens/splash_screen/splash_screen.dart';
import 'package:trava/utilities/routes.dart';

void main() {
  runApp(const TravaApp());
}

class TravaApp extends StatelessWidget {
  const TravaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        title: "TRAVA",
        theme: ThemeData(
          colorScheme:  ColorScheme.light(
            primary: const Color(0XFF17123B),
            primaryVariant: const Color(0XFF8B889D),
            secondary: const Color(0xFFFBFCFF),
            secondaryVariant: const Color(0xffD0D1D4).withOpacity(0.5),
          ),
          textTheme: GoogleFonts.koHoTextTheme(
            TextTheme(
              headline1: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                color: Colors.black,
              ),
              headline2: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
              headline3: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              bodyText1: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              bodyText2: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
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
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}