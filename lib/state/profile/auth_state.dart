import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/material.dart';
import 'package:trava/components/fragments/state/avatar_sheet.dart';
import 'package:trava/models/https/payment/tranaction_history.dart';
import 'package:trava/models/https/request/delivered_response.dart';
import 'package:trava/models/https/request/items_to_pick_up_response.dart';
import 'package:trava/models/https/request/pick_package_request.dart';
import 'package:trava/models/https/request/sent_response.dart';
import 'package:trava/models/https/request/tbd_response.dart';
import 'package:trava/models/https/users/profile_data.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/screens/splash_screen/splash_screen.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/services/http/hub/hub_http_service.dart';
import 'package:trava/services/http/payment/payment_http_service.dart';
import 'package:trava/services/http/request/request_http_service.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/county_list.dart';
import 'package:trava/utils/image_utils.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/snacks.dart';
import 'package:trava/utils/token_manager.dart';

class AuthState extends ChangeNotifier {
  static AuthState? _instance;
  static AuthState get instance {
    _instance ??= AuthState();
    return _instance!;
  }

  final ValueNotifier<File?> _image = ValueNotifier(null);
  final AuthHttpService _http = AuthHttpService();
  final PaymentHttpService _paymentHttp = PaymentHttpService();
  final HubHttpService _hubHttp = HubHttpService();
  final RequestHttpService _requestHttp = RequestHttpService();

  final ValueNotifier<Future<ProfileData?>?> _profileStatus = ValueNotifier(null);
  final ValueNotifier<Future<TransactionHistory?>?> _transactions =
      ValueNotifier(null);
  final ValueNotifier<Future<ItemsToPickUpResponse?>?> _itemsToBePicked =
      ValueNotifier(null);
  final ValueNotifier<Future<HistorySentResponse?>?> _sentHistory =
      ValueNotifier(null);
  final ValueNotifier<Future<HistoryTBDResponse?>?> _toBeDeliveredHistory =
      ValueNotifier(null);
  final ValueNotifier<Future<HistoryDeliveredResponse?>?> _deliveriedHistory =
      ValueNotifier(null);
  set profile(value) => _profileStatus.value = Future.value(value);
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  set current(value) => currentIndex.value = value;

  ValueNotifier<Future<ProfileData?>?> get status {
    if (_profileStatus.value == null) {
      log("here --- ");
      _profileStatus.value = getProfileStatus();
      log("there --- ");
    }

    return _profileStatus;
  }

  ValueNotifier<File?> get image => _image;

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

  logout(BuildContext context) async {
    clearOut();
    await Navigator.pushNamedAndRemoveUntil(
        context, SplashScreen.routeName, (route) => false);
  }

  clearOut() {
    TravaTokenManager _tokenManager = TravaTokenManager.instance;
    _tokenManager.clearTokens();
    current = 0;
  }

  Future deliveryRequest(PickPackageRequest data, BuildContext context) async {
    final doRoute = await formSubmitDialog(
      context: context,
      future: _requestHttp.pick(data),
      prompt: "Requesting to be deliver",
    );

    if (doRoute != null) {
      Navigator.pop(
        context,
      );
    }
  }

  List<SelectionData> get state {
    List<String> a = [];
    List<SelectionData> result = [];

    for (var e in county) {
      // log('value--- $e');
      if (!a.contains(e['state'])) {
        a.add("${e['state']}");
      }
    }
    // log("a--- ${a.length}");
    a.sort();
    for (var e in a) {
      result.add(SelectionData(e, e));
    }
    // log("rsult --- ${result.length}");
    return result;
  }

  void selectImage(BuildContext context) async {
    // final curPic = avatar.value;
    log("hfdjjhvjkd");
    try {
      final isGal = await showModalBottomSheet<bool>(
        backgroundColor: TravaColors.transparent,
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) {
          return const AvatarBottomSheet();
        },
      );
      if (isGal == null) {
        // showSnack(
        //   context: context,
        //   message: "Please select an image source",
        //   type: SnackType.Info,
        // );
        return;
      }
      final imgData = await pickImage(isGal: isGal);
      if (imgData != null) {
        final cropImg = await cropImage(imgData);
        if (cropImg == null) {
          // isUploading.value = false;
          // showSnack(
          //   context: context,
          //   message: "Profile picture update was cancelled",
          //   type: SnackType.Info,
          // );
          return;
        }
        // avatar.value = cropImg;
        // isUploading.value = true;
        // showSnack(
        //   context: context,
        //   message: "Your profile picture is being uploaded",
        //   type: SnackType.Info,
        // );
        try {
          _image.value = cropImg;
          // await http.addAvatar(cropImg);
          // isUploading.value = false;
          // showSnack(
          //   context: context,
          //   message: "Profile picture update was successful",
          //   type: SnackType.Success,
          // );
          // _cacheAvatar(cropImg);
        } catch (e) {
          // isUploading.value = false;
          // avatar.value = curPic;
          // showSnack(
          //   context: context,
          //   message: "Profile picture update failed, please try again",
          //   type: SnackType.Error,
          // );
        }
      }
    } catch (_) {
      // isUploading.value = false;
      // avatar.value = curPic;
      showSnack(
        context: context,
        message: "Profile picture update failed, please try again",
        type: SnackType.error,
      );
    }
  }

  Future registerHub(
    town,
    name,
    description,
    stateDes,
  ) async {
    return _hubHttp.register(
      town,
      name,
      description,
      stateDes,
      image.value!,
    );
  }

  Future withdraw(String bankId, int amt) async {
    return _paymentHttp.withdrawal(
      amt,
      bankId,
    );
  }

  addBankAccount(String bankName, String accountNumber, String accountName) {
    return _http.addBank(bankName, accountNumber, accountName);
  }
}
