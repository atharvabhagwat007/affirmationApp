import 'dart:io';
import 'package:dailyAffirmationss/core/constants/string_constants.dart';
import 'package:dailyAffirmationss/core/extensions/extensions.dart';
import 'package:dailyAffirmationss/core/networking/failure.dart';
import 'package:dailyAffirmationss/core/networking/http_method.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class NetworkService {
  Dio? _dio;
  late Logger _logger;

  Future<NetworkService> init() async {
    _dio = Dio(
      BaseOptions(
          // baseUrl: ApiEndPointsRemoteConfig.baseUrl,
          // headers: header,
          ),
    );
    _logger = Logger();
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: onRequest,
      onResponse: onResponse,
      onError: onError,
    ));
  }

  dynamic onRequest(RequestOptions requestOptions, handler) {
    _logger.i(
      '======> REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}\n'
      '- REQUEST VALUES: ${requestOptions.queryParameters}\n'
      '- HEADERS: ${requestOptions.headers} \n'
      '- DATA: ${requestOptions.data.toString()}',
    );
    return handler.next(requestOptions);
  }

  dynamic onResponse(Response response, handler) {
    _logger.i(
      '<====== RESPONSE[${response.requestOptions.method}] PATH: ${response.requestOptions.path}\n'
      '- Status Code: [${response.statusCode}]\n'
      '- DATA: ${response.data}',
    );
    return handler.next(response);
  }

  dynamic onError(err, handler) {
    _logger.e(
      '<====== Error[${err.response?.requestOptions.method}] PATH: ${err.response?.requestOptions.path}\n'
      '- Status Code: [${err.response?.statusCode}]\n'
      '- MESSAGE: ${err.response?.statusMessage}',
    );
    return handler.next(err);
  }

  Future<Either<Failure, dynamic>> request({
    required String url,
    String? baseUrl,
    required Method method,
    Map<String, dynamic>? params,
    Option? options,
  }) async {
    Response response;

    try {
      switch (method) {
        case Method.post:
          response = await _dio!.post(url, data: params);
          break;
        case Method.delete:
          response = await _dio!.delete(url);
          break;
        case Method.patch:
          response = await _dio!.patch(url, data: params);
          break;
        case Method.get:
          response = await _dio!.get(url, queryParameters: params);
          break;
        case Method.put:
          response = await _dio!.put(url, data: params);
          break;
      }

      if (response.statusCode != null) {
        if (response.statusCode!.inRange(200, 299)) {
          return Right(response);
        }
        if (response.statusCode!.inRange(400, 499)) {
          return Left(
            ClientFailure(
              response.statusCode!,
              response.statusMessage.orEmpty(),
            ),
          );
        }
        if (response.statusCode!.inRange(500, 599)) {
          return Left(
            ServerFailure(
              response.statusCode!,
              response.statusMessage.orEmpty(),
            ),
          );
        }
        return const Left(Failure(-1, StringConstants.defaultErrorMessage));
      } else {
        return const Left(Failure(-1, StringConstants.defaultErrorMessage));
      }
    } on SocketException catch (e) {
      _logger.e(e);
      return const Left(
        SocketFailure(-1, StringConstants.noInternetErrorMessage),
      );
    } on FormatException catch (e) {
      _logger.e(e);
      return const Left(FormatFailure(-1, StringConstants.formatErrorMessage));
    } on DioError catch (e) {
      _logger.e(e);
      return Left(Failure(e.response?.statusCode ?? -1, e.message));
    } on PlatformException catch (e) {
      _logger.e(e);
      return Left(Failure(-1, e.message!));
    } catch (e) {
      _logger.e(e);
      return Left(Failure(-1, e.toString()));
    }
  }
}
