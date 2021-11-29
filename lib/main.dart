import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trava/navigation.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/screens/splash_screen/splash_screen.dart';
import 'package:trava/utils/routes.dart';

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
                color: const Color(0xff171718),
              ),
              headline2: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: const Color(0xff171718),
              ),
              headline3: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff171718),
              ),
              
              headline4: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              headline5: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff171718),
              ),
              bodyText1: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff171718),
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
