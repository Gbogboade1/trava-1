import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:trava/components/fragments/state/avatar_sheet.dart';
import 'package:trava/models/https/hubs/hubs.dart';
import 'package:trava/models/https/payment/top_up.dart';
import 'package:trava/models/https/payment/top_up_wallet_response.dart';
import 'package:trava/models/https/payment/tranaction_history.dart';
import 'package:trava/models/https/request/availabale_packages.dart';
import 'package:trava/models/https/request/cancel_delivery_response.dart';
import 'package:trava/models/https/request/delivered_response.dart';
import 'package:trava/models/https/request/items_to_pick_up_response.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/models/https/request/pick_package_request.dart';
import 'package:trava/models/https/request/send_package_request.dart';
import 'package:trava/models/https/request/send_package_response.dart';
import 'package:trava/models/https/request/sent_response.dart';
import 'package:trava/models/https/request/tbd_response.dart';
import 'package:trava/models/https/users/notifications.dart';
import 'package:trava/models/https/users/profile_data.dart';
import 'package:trava/models/podos/selection_data.dart';
import 'package:trava/models/podos/send_package_controllers.dart';
import 'package:trava/screens/home_screen/request_to_deliver_screen/components/package_available_for_delivery.dart';
import 'package:trava/screens/splash_screen/splash_screen.dart';
import 'package:trava/services/http/auth/auth_http_service.dart';
import 'package:trava/services/http/hub/hub_http_service.dart';
import 'package:trava/services/http/payment/payment_http_service.dart';
import 'package:trava/services/http/request/request_http_service.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/county_list.dart';
import 'package:trava/utils/image_utils.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/utils/modals.dart';
import 'package:trava/utils/snacks.dart';
import 'package:trava/utils/token_manager.dart';
import 'package:location/location.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class AuthState extends ChangeNotifier {
  static AuthState? _instance;

  String packageId = "";
  static AuthState get instance {
    _instance ??= AuthState();
    return _instance!;
  }

  late Location location;

  IO.Socket? socket;

  final ValueNotifier<File?> _image = ValueNotifier(null);
  final AuthHttpService _http = AuthHttpService();
  final PaymentHttpService _paymentHttp = PaymentHttpService();
  final HubHttpService _hubHttp = HubHttpService();
  final RequestHttpService _requestHttp = RequestHttpService();
  final emailController = TextEditingController();
  final ValueNotifier<Future<ProfileData?>?> _profileStatus =
      ValueNotifier(null);
  final ValueNotifier<LatLng> positions =
      ValueNotifier(LatLng(8.376736, 3.939786));
  final ValueNotifier<Future<Notifications?>?> _notifications =
      ValueNotifier(null);
  final ValueNotifier<Future<AvailablePackages?>?> _availablePackages =
      ValueNotifier(null);
  ValueNotifier<Future<Hubs?>?> _hubs = ValueNotifier(null);
  ValueNotifier<Future<Hubs?>?> _myHubs = ValueNotifier(null);
  ValueNotifier<Future<TransactionHistory?>?> _transactions =
      ValueNotifier(null);
  ValueNotifier<Future<ItemsToPickUpResponse?>?> _itemsToBePicked =
      ValueNotifier(null);
  ValueNotifier<Future<HistorySentResponse?>?> _sentHistory =
      ValueNotifier(null);
  ValueNotifier<Future<HistoryTBDResponse?>?> _toBeDeliveredHistory =
      ValueNotifier(null);
  ValueNotifier<Future<HistorySentResponse?>?> _itemsToBePickedInventory =
      ValueNotifier(null);
  ValueNotifier<Future<HistorySentResponse?>?> _receivedInventory =
      ValueNotifier(null);
  ValueNotifier<Future<HistorySentResponse?>?> _pickedInventory =
      ValueNotifier(null);
  ValueNotifier<Future<HistoryDeliveredResponse?>?> _deliveriedHistory =
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

  ValueNotifier<Future<Hubs?>?> get hubs {
    if (_hubs.value == null) {
      log("here --- ");
      _hubs.value = getHubsStatus();
      log("there --- ");
    }

    return _hubs;
  }

  set hubs(ValueNotifier<Future<Hubs?>?> v) => _hubs = v;
  ValueNotifier<Future<Hubs?>?> get myHubs {
    log("here --- ");
    _myHubs.value = getMyHubsFromOnline();
    log("there --- ");

    return _myHubs;
  }

  set myHubs(ValueNotifier<Future<Hubs?>?> v) => _myHubs = v;
  startTracking() {
    if (socket == null) {
      log("socket ooooo");
      status.value?.then((value) {
        socket = IO.io(
          'https://travaapp.herokuapp.com/',
          OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
              // .disableAutoConnect() // disable auto-connection
              // .setExtraHeaders({'foo': 'bar'}) // optional
              .build(),
        );
        socket!.onConnect((_) {
          log("connected haaaa");
          sendLoc(value!.user!.sId!);
        });
        socket!.onError((data) => log("socket error -- $data"));
        socket!.onConnecting((data) => log("socket onConnecting -- $data"));
        socket!.onReconnectError((data) => log("socket $data"));
        socket!.on(
          "send location",
          (msg) {
            positions.value = LatLng(
              double.parse("${msg["latitude"]}"),
              double.parse("${msg["longitude"]}"),
            );
          },
        );
        socket!.on("new location", (data) {
          log("sending new location $packageId tyi");
          socket!.emit("get location", {"packageId": packageId});
        });
      });
    }
  }

  sendLoc(String userId) async {
    location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted ||
          _permissionGranted == PermissionStatus.grantedLimited) {
        // log("bam bammmm");
        location.onLocationChanged.listen(
          (LocationData currentLocation) {
            // log("sleepy time--- ${currentLocation.latitude} ${currentLocation.longitude}");
            socket!.emit(
              "set location",
              {
                "userId": userId,
                "longitude": currentLocation.longitude,
                "latitude": currentLocation.latitude
              },
            );
          },
        );

        location.enableBackgroundMode(enable: true);
      } else {
        log("not granted...");
      }
    } else if (_permissionGranted == PermissionStatus.granted ||
        _permissionGranted == PermissionStatus.grantedLimited) {
      log("bam bammmm");
      location.onLocationChanged.listen(
        (LocationData currentLocation) {
          // log("sleepy time--- ${currentLocation.latitude} ${currentLocation.longitude}");
          socket!.emit(
            "set location",
            {
              "userId": userId,
              "longitude": currentLocation.longitude,
              "latitude": currentLocation.latitude
            },
          );
        },
      );

      location.enableBackgroundMode(enable: true);
    }
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

  Future<Hubs?> getHubsStatus() async {
    if (_hubs.value != null) {
      return _hubs.value;
    } else {
      return await getHubsFromOnline();
    }
  }

  Future<Hubs> getHubsFromOnline() async {
    final data = _hubHttp.getAllHubs();

    return data;
  }

  Future<Hubs> getMyHubsFromOnline() async {
    final data = _hubHttp.getMyHubs();

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

  set transactions(ValueNotifier<Future<TransactionHistory?>?> v) =>
      _transactions = v;
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

  set toBePicked(ValueNotifier<Future<ItemsToPickUpResponse?>?> v) =>
      _itemsToBePicked = v;

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

  ValueNotifier<Future<HistorySentResponse?>?> get sent {
    if (_sentHistory.value == null) {
      log("here --- ");
      _sentHistory.value = geSentHistory();
      log("there --- ");
    }

    return _sentHistory;
  }

  set sent(ValueNotifier<Future<HistorySentResponse?>?> v) => _sentHistory = v;
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

  ValueNotifier<Future<HistoryTBDResponse?>?> get toBeDeliveried {
    if (_toBeDeliveredHistory.value == null) {
      log("here --- ");
      _toBeDeliveredHistory.value = getPackagesToBeDelivered();
      log("there --- ");
    }

    return _toBeDeliveredHistory;
  }

  set toBeDeliveried(ValueNotifier<Future<HistoryTBDResponse?>?> v) =>
      _toBeDeliveredHistory = v;
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

  ValueNotifier<Future<HistorySentResponse?>?> get toBeReceived {
    if (_receivedInventory.value == null) {
      log("here --- ");
      _receivedInventory.value = getPackagesToBeReceived();
      log("there --- ");
    }

    return _receivedInventory;
  }

  set toBeReceived(ValueNotifier<Future<HistorySentResponse?>?> v) =>
      _receivedInventory = v;
  Future<HistorySentResponse?> getPackagesToBeReceived() async {
    if (_receivedInventory.value != null) {
      return _receivedInventory.value;
    } else {
      return await getPackagesToBeReceivedFromOnline();
    }
  }

  Future<HistorySentResponse?> getPackagesToBeReceivedFromOnline() async {
    ProfileData? user;
    await status.value?.then((value) {
      user = value;
    });
    if (user?.user?.hubs?.isNotEmpty ?? false) {
      final data = _hubHttp.getToBeReceived(user!.user!.hubs!.first);
      return data;
    } else {
      return null;
    }
  }

  ValueNotifier<Future<HistorySentResponse?>?> get toBePickedInventory {
    if (_itemsToBePickedInventory.value == null) {
      log("here --- ");
      _itemsToBePickedInventory.value = getToBePickedInventory();
      log("there --- ");
    }

    return _itemsToBePickedInventory;
  }

  set toBePickedInventory(ValueNotifier<Future<HistorySentResponse?>?> v) =>
      _itemsToBePickedInventory = v;

  Future<HistorySentResponse?> getToBePickedInventory() async {
    if (_itemsToBePickedInventory.value != null) {
      return _itemsToBePickedInventory.value;
    } else {
      return await getToBePickedInventoryFromOnline();
    }
  }

  Future<HistorySentResponse?> getToBePickedInventoryFromOnline() async {
    ProfileData? user;
    await status.value?.then((value) {
      user = value;
    });
    if (user?.user?.hubs?.isNotEmpty ?? false) {
      final data = _hubHttp.getToBePickedUp(user!.user!.hubs!.first);
      return data;
    } else {
      return null;
    }
  }

  ValueNotifier<Future<HistorySentResponse?>?> get pickedUpInventory {
    if (_pickedInventory.value == null) {
      log("here --- ");
      _pickedInventory.value = getPackagesPickedUpInventory();
      log("there --- ");
    }

    return _pickedInventory;
  }

  set pickedUpInventory(ValueNotifier<Future<HistorySentResponse?>?> v) =>
      _pickedInventory = v;

  Future<HistorySentResponse?> getPackagesPickedUpInventory() async {
    if (_pickedInventory.value != null) {
      return _pickedInventory.value;
    } else {
      return await getPackagesPickedUpInventoryFromOnline();
    }
  }

  Future<HistorySentResponse?> getPackagesPickedUpInventoryFromOnline() async {
    ProfileData? user;
    await status.value?.then((value) {
      user = value;
    });
    if (user?.user?.hubs?.isNotEmpty ?? false) {
      final data = _hubHttp.getPickedUp(user!.user!.hubs!.first);
      return data;
    } else {
      return null;
    }
  }

// availablepacaes
  ValueNotifier<Future<AvailablePackages?>?> get availablePackages {
    if (_availablePackages.value != null) {
      return _availablePackages;
    } else {
      _availablePackages.value = getAvailablePackages();
    }

    return _availablePackages;
  }

  set updateAvailablePackages(value) {
    _availablePackages.value = value;
  }

  Future<AvailablePackages?> getAvailablePackages() async {
    return await _requestHttp.availablePackages();
  }

  ValueNotifier<Future<HistoryDeliveredResponse?>?> get delievered {
    if (_deliveriedHistory.value == null) {
      log("here --- ");
      _deliveriedHistory.value = getPackagesDelievered();
      log("there --- ");
    }

    return _deliveriedHistory;
  }

  set delievered(ValueNotifier<Future<HistoryDeliveredResponse?>?> v) =>
      _deliveriedHistory = v;
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

  ValueNotifier<Future<Notifications?>?> get notifications {
    // if (_notifications.value != null) return _notifications;
    _notifications.value = getNotifications();

    return _notifications;
  }

  set updateNotifications(value) => _notifications.value = value;

  Future<Notifications?> getNotifications() async {
    return await _http.notifications();
  }

  logout(BuildContext context) async {
    clearOut();
    await Navigator.pushNamedAndRemoveUntil(
        context, SplashScreen.routeName, (route) => false);
  }

  clearOut() {
    TravaTokenManager _tokenManager = TravaTokenManager.instance;
    _tokenManager.clearTokens();
    _image.value = null;
    _availablePackages.value = null;
    _deliveriedHistory.value = null;
    _itemsToBePicked.value = null;
    _itemsToBePickedInventory.value = null;
    _notifications.value = null;
    _pickedInventory.value = null;
    _profileStatus.value = null;
    _receivedInventory.value = null;
    _sentHistory.value = null;
    _toBeDeliveredHistory.value = null;
    _transactions.value = null;
    current = 0;
  }

  Future deliveryRequest(PickPackageRequest data, BuildContext context) async {
    final doRoute = await formSubmitDialog(
      context: context,
      future: _requestHttp.pick(data),
      prompt: "Requesting to be deliver",
    );

    if (doRoute != null) {
      updateAvailablePackages = null;
      Navigator.pushReplacementNamed(
        context,
        PackagesAvailableForDeliveryScreen.routeName,
      );
    }
  }

  List<SelectionData> get state {
    List<String> a = [];
    List<SelectionData> result = [];

    for (var e in county) {
      if (!a.contains(e['state'])) {
        a.add("${e['state']}");
      }
    }

    a.sort();
    for (var e in a) {
      result.add(SelectionData(e, e));
    }

    return result;
  }

  void selectImage(BuildContext context) async {
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
        return;
      }
      final imgData = await pickImage(isGal: isGal);
      if (imgData != null) {
        final cropImg = await cropImage(imgData);
        if (cropImg == null) {
          return;
        }

        try {
          _image.value = cropImg;
        } catch (e) {}
      }
    } catch (_) {
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

  Future manageHub(
    
    town,
    name,
    description,
    stateDes,
  ) async {
  ProfileData? user;
    await status.value?.then((value) {
      user = value;
    });
    if (user?.user?.hubs?.isNotEmpty ?? false) {
      
  return _hubHttp.manageHub(user!.user!.hubs!.first,
      town,
      name,
      description,
      stateDes,
      image.value!,
    );

    
    }   else {
      return null;
    }

  
  }

  Future withdraw(String bankId, int amt) async {
    return _paymentHttp.withdrawal(
      amt,
      bankId,
    );
  }

  Future<ProfileData> addBankAccount(
      String bankName, String accountNumber, String accountName) {
    return _http.addBank(bankName, accountNumber, accountName);
  }

  Future<TopUpWalletResponse> fundCard(TopUpWallet data) async {
    return _paymentHttp.topUp(data);
  }

  Future<ProfileData> deleteCard(String s) async {
    return _http.removeCard(s);
  }

  Future<ProfileData> deleteBank(String s) async {
    return _http.removeBank(s);
  }

  Future<SendPackageResponse> getPackageCost(SendControllers element) async {
    SendPackageRequest data = SendPackageRequest(
      deliveryDate:
          "${TravaFormatter.formatDateNormalForSend(element.leaveDate.text)}",
      deliveryHub: element.preferredHub.text,
      destState: element.destinationState.text,
      description: element.packageDescription.text,
      quantity: element.capacity.text,
      sendState: element.departureState.text,
      destTown: element.destinationTown.text,
      images: await MultipartFile.fromFile(
        element.image.value!.path,
      ),
      pickupLocation: element.location.text,
      type: element.weightLevel.text,
      sendTown: element.departureTown.text,
      deliveryMode: element.transportMode.text,
      pickupTime:
          "${TravaFormatter.formatDateNormalForSend(element.leaveTime.text)}",
    );


    return await _requestHttp.getPackageCost(data);
  }
  Future<SendPackageResponse> sendPackage(SendControllers element) async {
    SendPackageRequest data = SendPackageRequest(
      deliveryDate:
          "${TravaFormatter.formatDateNormalForSend(element.leaveDate.text)}",
      deliveryHub: element.preferredHub.text,
      destState: element.destinationState.text,
      description: element.packageDescription.text,
      quantity: element.capacity.text,
      sendState: element.departureState.text,
      destTown: element.destinationTown.text,
      images: await MultipartFile.fromFile(
        element.image.value!.path,
      ),
      pickupLocation: element.location.text,
      type: element.weightLevel.text,
      sendTown: element.departureTown.text,
      deliveryMode: element.transportMode.text,
      pickupTime:
          "${TravaFormatter.formatDateNormalForSend(element.leaveTime.text)}",
    );


    return await _requestHttp.sendPackage(data);
  }
  Future<CancelDeliveryResponse> turnOffDeliveryRequest() async {
    return _requestHttp.cancelRequest();
  }

  Future<PickAPackageResponse> acceptPackage(String sId) {
    return _requestHttp.pickAPackage(sId);
  }

  Future<PickAPackageResponse> verifyPickup(Map<String, String?> map) {
    return _hubHttp.verifyPickup(map);
  }

  Future<PickAPackageResponse> verifyReceived(Map<String, String?> map) {
    return _hubHttp.verifyReceived(map);
  }

  Future<PickAPackageResponse> verifyDelivery(Map<String, String?> map) {
    return _hubHttp.verifyDelivery(map);
  }

  Future<PickAPackageResponse> verifyDropOff(Map<String, String?> map) {
    return _hubHttp.verifyDropOff(map);
  }

  void networkToFile(String? s) async {
    if (s != null) {
      final Response res = await Dio().get<List<int>>(
        s,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      /// Get App local storage
      final Directory appDir = await getApplicationDocumentsDirectory();

      /// Generate Image Name
      final String imageName = s.split('/').last;

      /// Create Empty File in app dir & fill with new image
      final File file = File(join(appDir.path, imageName));

      file.writeAsBytesSync(res.data as List<int>);
      image.value = file;
    }
  }
}
