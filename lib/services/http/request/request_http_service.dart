import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:trava/models/https/request/send_package_request.dart';
import 'package:trava/models/https/request/send_package_response.dart';
import 'package:trava/models/https/users/profile_data.dart';
import 'package:trava/models/https/users/sign_in_request.dart';
import 'package:trava/models/https/users/sign_in_response.dart';
import 'package:trava/models/https/users/sign_out_response.dart';
import 'package:trava/models/https/users/sign_up.dart';
import 'package:trava/models/https/users/sign_up_response.dart';

import '../base_http.dart';

class PaymentHttpService extends HttpService {
  PaymentHttpService()
      : super(
          collectionUrl: "/request",
        );

  Future<SendPackageResponse> sendPackage(SendPackageRequest data) async {
    try {
      final req = await http.post(
        "/send",
        data: data.toJson(),
      );
      // final data =

      log("my new data -${req.data}");

      return SendPackageResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<SignInResponse> pick(SignInRequest data) async {
    try {
      final req = await http.post(
        "/pick",
        data: data.toJson(),
      );
      // final data =

      log("my new data -${req.data}");

      return SignInResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<SignOutResponse> availablePackages() async {
    try {
      final req = await http.get(
        "/pick",
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

  Future<ProfileData> pickAPackage(String packageId) async {
    try {
      final req = await http.get(
        "/pick/$packageId",
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

  Future<ProfileData> cancelRequest() async {
    try {
      final req = await http.patch(
        "/cancel",
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

  Future<ProfileData> cancelSendPackageRequest(String packageId) async {
    try {
      final req = await http.delete(
        "/delete/$packageId",
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

  Future<ProfileData> getRequestById(String packageId) async {
    try {
      final req = await http.get(
        "/$packageId",
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

  Future<ProfileData> getAllRequest() async {
    try {
      final req = await http.get(
        "/all",
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
}
// all