import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:trava/models/https/users/profile_data.dart';
import 'package:trava/models/https/users/sign_in_request.dart';
import 'package:trava/models/https/users/sign_in_response.dart';
import 'package:trava/models/https/users/sign_out_response.dart';
import 'package:trava/models/https/users/sign_up.dart';
import 'package:trava/models/https/users/sign_up_response.dart';

import '../base_http.dart';

class RequestHttpService extends HttpService {
  RequestHttpService()
      : super(
          collectionUrl: "/user/bank",
        );

  Future<SignUpResponse> topUp (SignUpRequest data) async {
    try {
      final req = await http.post(
        "/deposit",
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

 Future<SignInResponse> removeWithdrawalMethod (SignInRequest data) async {
    try {
      final req = await http.delete(
        "/delete",
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

   Future<SignOutResponse> addWithdrawalMethod () async {
    try {
      final req = await http.get(
        "/add",
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


}
