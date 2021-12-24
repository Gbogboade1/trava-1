import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:trava/models/https/payment/top_up.dart';
import 'package:trava/models/https/payment/top_up_wallet_response.dart';
import 'package:trava/models/https/payment/tranaction_history.dart';
import 'package:trava/models/https/users/sign_in_request.dart';
import 'package:trava/models/https/users/sign_in_response.dart';
import 'package:trava/models/https/users/sign_out_response.dart';
import 'package:trava/models/https/users/sign_up.dart';
import 'package:trava/models/https/users/sign_up_response.dart';

import '../base_http.dart';

class PaymentHttpService extends HttpService {
  PaymentHttpService()
      : super(
          collectionUrl: "/payment",
        );

  Future<TopUpWalletResponse> topUp(TopUpWallet data) async {
    try {
      final req = await http.post(
        "/deposit",
        data: data.toJson(),
      );
      // final data =

      return TopUpWalletResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<SignUpResponse> withdrawal(int amt, String bankId) async {
    try {
      final req = await http.post(
        "/withdraw",
        data: {"bankId": bankId, "amount": amt},
      );
      // final data =

      return SignUpResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<SignInResponse> removeWithdrawalMethod(SignInRequest data) async {
    try {
      final req = await http.delete(
        "/delete",
        data: data.toJson(),
      );
      // final data =

      return SignInResponse.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }

  Future<TransactionHistory> getTransactions() async {
    try {
      final req = await http.get(
        "/transactions",
      );
      // final data =

      return TransactionHistory.fromJson(req.data);
    } on DioError catch (e) {
      throw {
        "statusCode": e.response?.statusCode,
        "data": e.response?.data ?? {"message": e.error ?? e}
      };
    }
  }
}
