import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trava/models/https/users/otp_response.dart';
import 'package:trava/models/https/users/profile_data.dart';
import 'package:trava/models/https/users/profile_update_request.dart';
import 'package:trava/models/https/users/reset_request.dart';
import 'package:trava/models/https/users/sign_in_request.dart';
import 'package:trava/models/https/users/sign_in_response.dart';
import 'package:trava/models/https/users/sign_out_response.dart';
import 'package:trava/models/https/users/sign_up.dart';
import 'package:trava/models/https/users/sign_up_response.dart';
import 'package:trava/models/https/users/update_password_request.dart';
import 'package:trava/services/storage/storage.dart';
import 'package:trava/utils/token_manager.dart';

import '../base_http.dart';

class AuthHttpService extends HttpService {
  AuthHttpService()
      : super(
          collectionUrl: "/user",
        );

  Future<SignUpResponse> signUp(SignUpRequest data) async {
    try {
      final req = await http.post(
        "/signup",
        data: data.toJson(),
      );
      // final data =

      log("my new data -${req.data}");

      return SignUpResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<SignOutResponse> addWithdrawalMethod() async {
    try {
      final req = await http.get(
        "/bank/add",
      );
      // final data =

      log("my new data -${req.data}");

      return SignOutResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<SignInResponse> signIn(SignInRequest data) async {
    try {
      final req = await http.post(
        "/signin",
        data: data.toJson(),
      );

      await Hive.box("user_data").clear();

      SignInResponse result = SignInResponse.fromJson(req.data);
      await Hive.box("user_data").clear();
      final tokenManager = TravaTokenManager.instance;
      tokenManager.setToken(
        accessToken: result.token,
        email: result.user?.email ?? data.email,
      );

      LocalStorage.setItem(key: LocalStorage.userData, value: req.data);

      log("my new data -${req.data}");

      return result;
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<SignOutResponse> signOut() async {
    try {
      final req = await http.get(
        "/signout",
      );
      // final data =

      log("my new data -${req.data}");

      return SignOutResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<ProfileData> getProfile() async {
    try {
      final req = await http.get(
        "/profile",
      );
      // final data =

      log("my new data -${req.data}");

      return ProfileData.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<ProfileData> getProfileById(String id) async {
    try {
      final req = await http.get(
        "/profile/$id",
      );
      // final data =

      log("my new data -${req.data}");

      return ProfileData.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<OtpResponse> forgotPassword(String email) async {
    try {
      final req = await http.post(
        "/password_recovery",
        data: {"email": email},
      );
      // final data =

      return OtpResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<ProfileData> newPassword(ResetRequest data) async {
    try {
      final req = await http.post(
        "/password_reset",
        data: data.toJson(),
      );
      // final data =

      return ProfileData.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<ProfileData> updatePassword(UpdatePasswordRequest data) async {
    try {
      final req = await http.patch(
        "/update_password",
        data: data.toJson(),
      );
      // final data =

      return ProfileData.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<ProfileData> profileUpdate(ProfileUpdateRequest data,
      {File? img}) async {
    try {
      final req = await http.patch(
        "/update_profile",
        data: data.toJson(),
      );
      return ProfileData.fromJson(req.data);

      // final data =

    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }
}
// 
// 