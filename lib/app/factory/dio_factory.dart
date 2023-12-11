import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:simpsons_character_viewer/app/factory/object_factory.dart';
import 'package:simpsons_character_viewer/app/network/network_config.dart';

class DioFactory implements ObjectFactory<Dio> {
  @override
  Dio create({covariant Map<String, dynamic> args = const {}}) {
    final networkConfig = args['networkConfig'] as NetworkConfig;

    final dio = Dio(
      BaseOptions(
        connectTimeout: Duration(milliseconds: networkConfig.defaultTimeout),
        receiveTimeout: Duration(milliseconds: networkConfig.defaultTimeout),
        sendTimeout: Duration(milliseconds: networkConfig.defaultTimeout),
        baseUrl: networkConfig.baseURL,
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        logPrint: (object) => debugPrint(object.toString()),
      ),
    );

    return dio;
  }
}
