import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:infinite_list_assesment/src/core/configuration.dart';
import '../../design/common_widget/common_toast.dart';
import '../../model/error_model.dart';
import '../../utils/common_utils.dart';

class ApiManager {
  static Dio dio = Dio();
  static Future<Either<ErrorModel, dynamic>> makeApiCall(String apiUrl,
      {ApiCallType? apiCallType = ApiCallType.GET,
      Map<String, String>? headerData,
      Map<String, dynamic>? queryParameters,
      dynamic body,
      bool headerNeeded = false}) async {
    try {
      bool isConnected = await isConnectedToInternet();
      if (!isConnected) {
        return Left(ErrorModel(message: notConnectedToInternet));
      }
      Map<String, String> headers = {};
      if (headerData != null) {
        headers = headerData;
      }
      Response<dynamic> response;
      switch (apiCallType) {
        case ApiCallType.GET:
          {
            response = await dio.get(
              apiUrl,
              queryParameters: queryParameters,
              options: Options(headers: headers),
            );
          }
          break;
        case ApiCallType.PUT:
          {
            response = await dio.put(
              apiUrl,
              options: Options(headers: headers),
              data: body,
              queryParameters: queryParameters,
            );
          }
          break;
        case ApiCallType.POST:
          {
            response = await dio.post(
              apiUrl,
              options: Options(headers: headers),
              data: body,
              queryParameters: queryParameters,
            );
          }
          break;
        case ApiCallType.PATCH:
          {
            response = await dio.patch(
              apiUrl,
              options: Options(headers: headers),
              data: body,
              queryParameters: queryParameters,
            );
          }
          break;
        case ApiCallType.DELETE:
          {
            response = await dio.patch(
              apiUrl,
              options: Options(headers: headers),
              data: body,
              queryParameters: queryParameters,
            );
          }
          break;
        default:
          {
            return Left(ErrorModel(message: "API method is not defined"));
          }
      }
      log(response.toString());
      if (response.statusCode == successStatusCode) {
        return Right(response.data);
      } else {
        return Left(
            ErrorModel(message: response.statusMessage ?? 'Request not found'));
      }
    } on SocketException {
      showSnackBar(msg: noInternetConnection);
      return Left(ErrorModel(message: noInternetConnection));
    } on DioException catch (e) {
      log("DioError:::$e");
      log("${e.response?.statusCode}");
      if (e.response?.statusCode == validationErrorStatusCode) {
        return Left(ErrorModel(
          message:
              e.response?.data['details'][0] as String? ?? "Bad response 👎",
        ));
      }
      return Left(ErrorModel(message: "Bad response 👎"));
    } on Exception {
      showSnackBar(msg: "Bad response 👎");
      return Left(ErrorModel(message: "Bad response 👎"));
    }
  }
}
