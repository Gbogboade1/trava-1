import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final InputDecoration kTextFieldDecoration = InputDecoration(
  isDense: true,
  filled: true,
  fillColor: const Color(0xffefefef).withOpacity(0.5),
  hintStyle: TextStyle(
      color: const Color(0xff828282),
      fontSize: 12.sp,
      fontWeight: FontWeight.w300),
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8.0),
  ),
);

final InputDecoration kOTPFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 12.w),
  isDense: true,
  filled: true,
  fillColor: const Color(0xffefefef).withOpacity(0.5),
  hintStyle: TextStyle(
      color: const Color(0xff828282),
      fontSize: 12.sp,
      fontWeight: FontWeight.w300),
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xffE0E0E0)),
    borderRadius: BorderRadius.circular(8.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xffE0E0E0)),
    borderRadius: BorderRadius.circular(8.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xffE0E0E0)),
    borderRadius: BorderRadius.circular(8.0),
  ),
);