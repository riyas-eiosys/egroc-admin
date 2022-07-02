import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'api.dart';
import 'custom_log_interceptor.dart';
import 'log_utils.dart';

ApiUtils apiUtils = ApiUtils();

class ApiUtils {
  static final ApiUtils _apiUtils = ApiUtils._i();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Api.baseUrl,
      sendTimeout: 60000,
      connectTimeout: 60000,
      validateStatus: (status) => true,
    ),
  );

  ApiUtils._i() {
    _dio.interceptors
      ..add(AppInterceptor())
      ..add(CustomLogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
      ));
  }

  factory ApiUtils() {
    return _apiUtils;
  }

  Map<String, String> header = {"Content-Type": "application/json"};

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "api-version": "1"
  };

  Map<String, String> secureHeaders = {
    "Content-Type": "application/json",
    "api-version": "1",
    "Authorization": ""
  };

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> post({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Sending FormData:
    //FormData formData = FormData.fromMap({"name": ""});

    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> patch({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    // ProgressCallback? onSendProgress,
  }) async {
    //
    var result = await _dio.patch(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      // onSendProgress: onSendProgress,
    );
    return result;
  }

  Future<Response> put({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> delete({
    required String api,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Options options = Options(headers: secureHeaders);

    //var result = await _dio.delete(api, options: options);
    var result = await _dio.delete(
      api,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  String handleError(dynamic error) {
    String errorDescription = "";

    Log.loga("title", "handleError:: error >> $error");

    if (error is DioError) {
      Log.loga("title",
          '************************ DioError ************************');

      DioError dioError = error;
      Log.loga("title", 'dioError:: $dioError');
      if (dioError.response != null) {
        Log.loga("title", "dioError:: response >> ${dioError.response}");
      }

      switch (dioError.type) {
        case DioErrorType.other:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
              "Received invalid status code: ${dioError.response?.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    Log.loga("title", "handleError:: errorDescription >> $errorDescription");
    return errorDescription;
  }

  getFormattedError() {
    return {'error': 'Error'};
  }

  getNetworkError() {
    return "No Internet Connection.";
  }
}

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("No Network");
    } else {
      try {
        // options.headers[HttpHeaders.acceptHeader] = "application/json";
        // options.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
        handler.next(options);
      } catch (e) {
        //print('AppInterceptor Error : ${e.toString()}');
      }
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    switch (response.statusCode) {
      case 401:
        {
          // EventEmitter.publish('unauthorize', {
          //   'message': errorMessage,
          // });
        }
        break;
      // check forbidden access
      case 403:
        {
          // EventEmitter.publish('unauthorize', {
          //   'message': errorMessage,
          // });
        }
        break;
      case 500:
        {
          print("~~500 ");
          print(response.data["message"]);
        }
        break;
    }
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(err);
    if (connectivityResult == ConnectivityResult.none) {
      // I am not connected to a network.
      print('Check your internet Connection! Try again later');
    } else {
      switch (err.response?.statusCode) {
        // check unauthorize access
        case 401:
          {
            // EventEmitter.publish('unauthorize', {
            //   'message': errorMessage,
            // });
          }
          break;
        // check forbidden access
        case 403:
          {
            // EventEmitter.publish('unauthorize', {
            //   'message': errorMessage,
            // });
          }
          break;
        case 500:
          {
            print("~~500 ");
          }
          break;
      }
    }

    handler.next(err);
  }
}
