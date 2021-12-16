// import 'dart:developer';
// import 'package:clink/models/http/response/chat_conversation_response.dart';
// import 'package:clink/models/http/response/clink_response.dart';
// import 'package:clink/models/http/response/search_reponse.dart';
// import 'package:clink/models/http/response/search_result_response.dart';
// import 'package:clink/services/http/chat/chat_http_service.dart';
// import 'package:clink/services/http/clink/clink_http_service.dart';
// import 'package:clink/services/http/clink/library_http_service.dart';
// import 'package:clink/services/http/search/search_http_service.dart';
// import 'package:clink/services/navigation/nav.dart';
// import 'package:clink/utils/locator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart' show ChangeNotifier;
// import 'package:flutter/material.dart';

// class SearchState extends ChangeNotifier {
//   static SearchState _instance;
//   final SearchHttpService _http = SearchHttpService();
//   final LibraryHttpService _libraryHttp = LibraryHttpService();

//   String searchText = "";

//   ValueNotifier<int> _tabIndex = ValueNotifier(0);

//   set tab(int value) {
//     _tabIndex.value = value;
//   }

//   ValueNotifier<int> get tabIndex => _tabIndex;

//   NavigationService navServices = locator<NavigationService>();

//   ValueNotifier<Future<SearchResponse>> _trends = ValueNotifier(null);
//   ValueNotifier<Future<ClinkResponse>> _clinks = ValueNotifier(null);
//   ValueNotifier<Future<SearchResultRequest>> _result = ValueNotifier(null);
//   final TextEditingController search = TextEditingController();

//   String userId;

//   static SearchState get instance {
//     if (_instance == null) {
//       _instance = SearchState();
//     }
//     return _instance;
//   }

//   ValueNotifier<Future<SearchResponse>> get trends {
//     if (_trends.value == null) {
//       log("here --- ");
//       _trends.value = getTrends();
//       log("there --- ");
//     }

//     return _trends;
//   }

//   Future<SearchResponse> getTrends() async {
//     if (_trends.value != null) {
//       return _trends.value;
//     } else {
//       return await getTrendsFromOnline();
//     }
//   }

//   getResult() {
//     searchText = search.text;
//     _result.value = null;
//     _result.value = getResultsFromOnline();

//     return _result;
//   }

//   Future<SearchResponse> getTrendsFromOnline() async {
//     final data = _http.getTrends();

//     return data;
//   }

//   ValueNotifier<Future<SearchResultRequest>> get results {
//     if (_result != null && _result.value != null) {
//       return _result;
//     } else {
//       _result.value = getResultsFromOnline();
//     }
//     return _result;
//   }

//   Future<SearchResultRequest> getResultsFromOnline() async {
//     return _http.result(searchText);
//   }

//   ValueNotifier<Future<ClinkResponse>> get clinks {
//     if (_clinks.value == null) {
//       log("here --- ");
//       _clinks.value = getClinks();
//       log("there --- ");
//     }

//     return _clinks;
//   }

//   Future<ClinkResponse> getClinks() async {
//     if (_clinks.value != null) {
//       return _clinks.value;
//     } else {
//       return await getClinksFromOnline(userId);
//     }
//   }

//   Future<ClinkResponse> getClinksFromOnline(String userId) async {
//     final data = _libraryHttp.getClinks(userId);
//     return data;
//   }
// }
