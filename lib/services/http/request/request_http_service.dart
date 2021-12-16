import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:trava/models/https/payment/tranaction_history.dart';
import 'package:trava/models/https/request/cancel_delivery_response.dart';
import 'package:trava/models/https/request/delivered_response.dart';
import 'package:trava/models/https/request/items_to_pick_up_response.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/models/https/request/pick_package_request.dart';
import 'package:trava/models/https/request/send_package_request.dart';
import 'package:trava/models/https/request/send_package_response.dart';
import 'package:trava/models/https/request/sent_response.dart';
import 'package:trava/models/https/request/tbd_response.dart';
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
          collectionUrl: "/request",
        );

  Future<SendPackageResponse> sendPackage(SendPackageRequest data) async {
    try {
      var formData = FormData.fromMap({
        'name': 'wendux',
        'age': 25,
        'file':
            await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
        'files': [
          await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
          await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
        ]
      });
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

  Future<SendPackageResponse> pick(PickPackageRequest data) async {
    try {
      final req = await http.post(
        "/pick",
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

  Future<PickAPackageResponse> pickAPackage(String packageId) async {
    try {
      final req = await http.get(
        "/pick/$packageId",
      );
      // final data =

      log("my new data -${req.data}");

      return PickAPackageResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<CancelDeliveryResponse> cancelRequest() async {
    try {
      final req = await http.patch(
        "/cancel",
      );
      // final data =

      log("my new data -${req.data}");

      return CancelDeliveryResponse.fromJson(req.data);
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

  Future<HistorySentResponse> getSentRequest() async {
    try {
      final req = await http.get(
        "/sent",
      );
      // final data =

      log("my new data -${req.data}");

      return HistorySentResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<HistoryTBDResponse> getTBDRequest() async {
    try {
      final req = await http.get(
        "/tbd",
      );
      // final data =

      log("my new data -${req.data}");

      return HistoryTBDResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<HistoryDeliveredResponse> getDeliveredRequest() async {
    try {
      final req = await http.get(
        "/delivered",
      );
      // final data =

      log("my new data -${req.data}");

      return HistoryDeliveredResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<ItemsToPickUpResponse> getPickUpRequest() async {
    try {
      final req = await http.get(
        "/pickup",
      );
      // final data =

      log("my new data -${req.data}");

      return ItemsToPickUpResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }
}
// /