import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class HttpService {
  static Dio? _dio;

  HttpService._();

  static HttpService? _instance;

  static HttpService? get instance {
    _dio = Dio();

    _instance ??= HttpService._();
    return _instance;
  }

  Future<dynamic> get(
      {required String url, Map<String, dynamic>? prams}) async {
    _dio!.options.headers["Content-Type"] = "application/json";
    _dio!.options.headers["Accept"] = "application/json";
    _dio!.options.connectTimeout = 30000;
    debugPrint("Api => $url");

    try {
      Response response = await _dio!.get(url, queryParameters: prams ?? {});
      log("Response => ${response.data}");
      return response.data;
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          {
            throw Exception("Connection Time Out.");
          }
        case DioErrorType.sendTimeout:
          {
            throw Exception("Send Time Out.");
          }
        case DioErrorType.receiveTimeout:
          {

            throw Exception("Receive Time Out.");
          }
        case DioErrorType.response:
          {
            log("Response => ${e.response}");

            throw Exception(e.response!.data['message']);
          }
        case DioErrorType.cancel:
          {
            throw Exception("Cancel");}
        case DioErrorType.other:
          {
            throw Exception("No internet connection available");
          }
      }
    }
  }

  Future<dynamic> post(
      {required String url, required Map<String, dynamic> body}) async {
    var formData = FormData.fromMap(body);
    debugPrint("Api => $url");
    debugPrint("Request => $body");

    _dio!.options.headers["Content-Type"] = "application/json";
    _dio!.options.headers["Accept"] = "application/json";
    _dio!.options.connectTimeout = 30000;

    try {
      Response response = await _dio!.post(url, data: formData);
      log("Response => ${response.data.toString()}");
      return response.data;
    }on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          {
            throw Exception("Connection Time Out.");
          }
        case DioErrorType.sendTimeout:
          {
            throw Exception("Send Time Out.");
          }
        case DioErrorType.receiveTimeout:
          {

            throw Exception("Receive Time Out.");
          }
        case DioErrorType.response:
          {
            log("Response => ${e.response}");

            throw Exception(e.response!.data['message']);
          }
        case DioErrorType.cancel:
          {
            throw Exception("Cancel");}
        case DioErrorType.other:
          {
            throw Exception("No internet connection available");
          }
      }
    }
  }
}
