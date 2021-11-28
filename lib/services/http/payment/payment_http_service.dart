import 'dart:developer';
import 'package:dio/dio.dart';
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
          collectionUrl: "/user",
        );

  Future<SignUpResponse> signUp (SignUpRequest data) async {
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

 Future<SignInResponse> signIn (SignInRequest data) async {
    try {
      final req = await http.post(
        "/signin",
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

   Future<SignOutResponse> signOut () async {
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


   Future<ProfileData> getProfile () async {
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


  Future<ProfileData> getProfileById (String id) async {
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


}
