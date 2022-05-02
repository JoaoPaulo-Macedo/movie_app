import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/utils/app_configs.dart';

class CustomLogObject {
  CustomLogObject(this.name, this.value);

  String name;
  dynamic value;
}

class CustomLogInterceptor extends LogInterceptor {
  CustomLogInterceptor()
      : super(requestBody: true, responseBody: true, responseHeader: false, logPrint: _print);

  static _print(Object o) {
    CustomLogObject logObj;

    if (o is CustomLogObject) {
      logObj = o;
    } else {
      logObj = CustomLogObject(' ', o);
    }

    String line = logObj.value.toString();
    int length = line.length;

    log(
      line.substring(
        0,
        length < AppConfigs.debugMaxChars ? length : AppConfigs.debugMaxChars,
      ),
      name: logObj.name,
    );
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint(CustomLogObject('Start', '--- REQUEST ---'));
    logPrint(CustomLogObject('URI', options.uri));

    if (request) {
      Map<String, dynamic> map = {
        'method': options.method,
        'queryParameters': options.queryParameters,
      };

      logPrint(CustomLogObject('Options', map));
    }

    if (requestHeader) {
      Map<String, dynamic> map = {};

      options.headers.forEach((key, v) => map.addAll({key: v}));

      logPrint(CustomLogObject('Headers', map));
    }

    if (requestBody) {
      Map<String, dynamic> map = {};

      options.data?.forEach((key, v) => map.addAll({key: v}));

      logPrint(CustomLogObject('Data', map));
    }

    logPrint(CustomLogObject('End', '--- REQUEST ---'));
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logPrint(CustomLogObject('Start', '--- RESPONSE ---'));
    logPrint(CustomLogObject('URI', response.requestOptions.uri));

    if (responseHeader) {
      Map<String, dynamic> map = {};

      map.addAll({'statusCode': response.statusCode});

      if (response.isRedirect == true) {
        map.addAll({'redirect': response.realUri});
      }

      response.headers.forEach((key, v) => map.addAll({key: v}));

      logPrint(CustomLogObject('Headers', map));
    }

    if (responseBody) {
      logPrint(CustomLogObject('Response Body', response.toString()));
    }

    logPrint(CustomLogObject('End', '--- RESPONSE ---'));
    handler.next(response);
  }
}
