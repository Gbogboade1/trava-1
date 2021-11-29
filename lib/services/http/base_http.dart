import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:trava/utils/helpers.dart';

class Transformer extends DefaultTransformer {
  Transformer() : super(jsonDecodeCallback: parseJson);
}

const baseUrl = "https://travaapp.herokuapp.com"; 

class HttpService {
  // final NavigationService _navigationService = locator<NavigationService>();
  final String collectionUrl;
  late Dio http;
  late CancelToken cancelToken;
  final tokenHandler = Dio(
    BaseOptions(
      baseUrl: "$baseUrl/api/v1/agent",
      connectTimeout: 1000 * 360,
      receiveTimeout: 1000 * 360,
    ),
  );

  HttpService({required this.collectionUrl}) {
    cancelToken = CancelToken();
    http = Dio(
      BaseOptions(
        baseUrl: "$baseUrl$collectionUrl",
        connectTimeout: 1000 * 60,
        receiveTimeout: 1000 * 60,
      ),
    )
      ..interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions opts, handler) async {
          print({
            "url": "${opts.baseUrl}${opts.path}",
            "body": opts.data,
            "params": opts.queryParameters,
          });
          //uncomment this two lines as well.
          // TravaTokenManager _tokenManager = TravaTokenManager.instance;

          
          // var tokens = await _tokenManager.tokens;
          // if (tokens.accessToken != null &&
          //     DateTime.now().difference(tokens.createdAt!).inMinutes >= 5) {
          //   http.interceptors.requestLock.lock();
          //   try {
          //     // // // final _nuToken = await tokenHandler.post(
          //     // // //   "/refreshtoken",
          //     // // //   data: {
          //     // // //     "mobileNumber": tokens.mobileNumber,
          //     // // //     "MobileNumber": tokens.mobileNumber,
          //     // // //     "refreshToken": tokens.refreshToken,
          //     // // //   },
          //     // //   options: Options(
          //     // //     headers: {
          //     // //       "Authorization": "Bearer ${tokens.accessToken}",
          //     // //     },
          //     // //   ),
          //     // // );
          //     // _tokenManager.setToken(
          //     //   accessToken: _nuToken.data["message"],
          //     //   refreshToken: tokens.refreshToken,
          //     //   mobileNumber: tokens.mobileNumber,
          //     // );
          //     // tokens = await _tokenManager.tokens;
          //     http.interceptors.requestLock.unlock();
          //   } catch (error) {
          //     print({
          //       "err": error,
          //       //     "data": e?.response.data ?? {"message": e.error ?? e}
          //     });
          //     http.interceptors.requestLock.unlock();
          //   }
          // }
          //uncomment
          // opts.headers["Authorization"] = "Bearer ${tokens.accessToken}";
          // log("auth :${tokens.accessToken}");
          return handler.next(opts);
        }, onError: (DioError e, handler) async {
          print({
            "statusCode": e.response?.statusCode,
            "statusMessage": e.response?.statusMessage,
            "data": e.response?.data ?? {"message": e.error ?? e}
          });
          if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
            log("godndjdnd");
            // return _navigationService.navigateTo(
            //   TravaRoutes.login,
            // );
          }
          if (e.response?.statusCode == 404) {
            // todo: return service not found
            DioError response = e;
            response.response?.statusMessage =
                "Service is presntly unavailable at the moment";
            return handler.next(response);
          }
          if (e.response?.statusCode == 400) {
            // todo: return bad request.
            DioError response = e;
            response.response?.statusMessage =
                "Request sent is bad formmatted, please try again.";
            return handler.next(response);
          }

          DioError response = e;
          response.response?.statusMessage =
              "Service is temporary unavailable, please try again.";
          return handler.next(response);
        }, onResponse: (Response res, handler) {
          print({
            "data": res.data,
            "statusCode": res.statusCode,
            "statusMessage": res.statusMessage,
          });

          return handler.next(res);

          // Response response = res;
          // response.statusMessage =
          //     "Service is temporary unavailable, please try again.";
          // return response;
        }),
      )
      ..transformer = Transformer();
  }

  void cancelReqs() {
    cancelToken.cancel("Request has been cancelled");
  }
}
