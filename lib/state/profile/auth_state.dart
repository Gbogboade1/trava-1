import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/material.dart';
import 'package:trava/models/https/payment/tranaction_history.dart';
import 'package:trava/models/https/request/delivered_response.dart';
import 'package:trava/models/https/request/items_to_pick_up_response.dart';
import 'package:trava/models/https/request/sent_response.dart';
import 'package:trava/models/https/request/tbd_response.dart';
import 'package:trava/models/https/users/profile_data.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/services/http/payment/payment_http_service.dart';
import 'package:trava/services/http/request/request_http_service.dart';

class AuthState extends ChangeNotifier {
  static AuthState? _instance;
  static AuthState get instance {
    _instance ??= AuthState();
    return _instance!;
  }

  final AuthHttpService _http = AuthHttpService();
  final PaymentHttpService _paymentHttp = PaymentHttpService();
  final RequestHttpService _requestHttp = RequestHttpService();

  ValueNotifier<Future<ProfileData?>?> _profileStatus = ValueNotifier(null);
  ValueNotifier<Future<TransactionHistory?>?> _transactions =
      ValueNotifier(null);
  ValueNotifier<Future<ItemsToPickUpResponse?>?> _itemsToBePicked =
      ValueNotifier(null);
  ValueNotifier<Future<HistorySentResponse?>?> _sentHistory =
      ValueNotifier(null);
  ValueNotifier<Future<HistoryTBDResponse?>?> _toBeDeliveredHistory =
      ValueNotifier(null);
  ValueNotifier<Future<HistoryDeliveredResponse?>?> _deliveriedHistory =
      ValueNotifier(null);
  set profile(value) => _profileStatus.value = Future.value(value);

  ValueNotifier<Future<ProfileData?>?> get status {
    if (_profileStatus.value == null) {
      log("here --- ");
      _profileStatus.value = getProfileStatus();
      log("there --- ");
    }

    return _profileStatus;
  }

  set status(value) => _profileStatus.value = value;

  Future<ProfileData?> getProfileStatus() async {
    if (_profileStatus.value != null) {
      return _profileStatus.value;
    } else {
      return await getProfileStatusFromOnline();
    }
  }

  Future<ProfileData> getProfileStatusFromOnline() async {
    final data = _http.getProfile();

    return data;
  }

  ValueNotifier<Future<TransactionHistory?>?> get transactions {
    if (_transactions.value == null) {
      log("here --- ");
      _transactions.value = getTransactions();
      log("there --- ");
    }

    return _transactions;
  }

  Future<TransactionHistory?> getTransactions() async {
    if (_transactions.value != null) {
      return _transactions.value;
    } else {
      return await getTransactionsFromOnline();
    }
  }

  Future<TransactionHistory> getTransactionsFromOnline() async {
    final data = _paymentHttp.getTransactions();

    return data;
  }

  ValueNotifier<Future<ItemsToPickUpResponse?>?> get toBePicked {
    if (_itemsToBePicked.value == null) {
      log("here --- ");
      _itemsToBePicked.value = getPackagesToBePicked();
      log("there --- ");
    }

    return _itemsToBePicked;
  }

  Future<ItemsToPickUpResponse?> getPackagesToBePicked() async {
    if (_itemsToBePicked.value != null) {
      return _itemsToBePicked.value;
    } else {
      return await getPackagesToBePickedFromOnline();
    }
  }

  Future<ItemsToPickUpResponse> getPackagesToBePickedFromOnline() async {
    final data = _requestHttp.getPickUpRequest();

    return data;
  }
//sent

  ValueNotifier<Future<HistorySentResponse?>?> get sent {
    if (_sentHistory.value == null) {
      log("here --- ");
      _sentHistory.value = geSentHistory();
      log("there --- ");
    }

    return _sentHistory;
  }

  Future<HistorySentResponse?> geSentHistory() async {
    if (_sentHistory.value != null) {
      return _sentHistory.value;
    } else {
      return await geSentHistoryFromOnline();
    }
  }

  Future<HistorySentResponse> geSentHistoryFromOnline() async {
    final data = _requestHttp.getSentRequest();

    return data;
  }
  //to be delievered

  ValueNotifier<Future<HistoryTBDResponse?>?> get toBeDeliveried {
    if (_toBeDeliveredHistory.value == null) {
      log("here --- ");
      _toBeDeliveredHistory.value = getPackagesToBeDelivered();
      log("there --- ");
    }

    return _toBeDeliveredHistory;
  }

  Future<HistoryTBDResponse?> getPackagesToBeDelivered() async {
    if (_toBeDeliveredHistory.value != null) {
      return _toBeDeliveredHistory.value;
    } else {
      return await getPackagesToBeDeliveredFromOnline();
    }
  }

  Future<HistoryTBDResponse> getPackagesToBeDeliveredFromOnline() async {
    final data = _requestHttp.getTBDRequest();

    return data;
  }
// delivered

  ValueNotifier<Future<HistoryDeliveredResponse?>?> get delievered {
    if (_deliveriedHistory.value == null) {
      log("here --- ");
      _deliveriedHistory.value = getPackagesDelievered();
      log("there --- ");
    }

    return _deliveriedHistory;
  }

  Future<HistoryDeliveredResponse?> getPackagesDelievered() async {
    if (_deliveriedHistory.value != null) {
      return _deliveriedHistory.value;
    } else {
      return await getPackagesDelieveredFromOnline();
    }
  }

  Future<HistoryDeliveredResponse> getPackagesDelieveredFromOnline() async {
    final data = _requestHttp.getDeliveredRequest();

    return data;
  }
}
