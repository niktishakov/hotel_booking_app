import 'package:dio/dio.dart';

const _kDefaultConnectTimeout = Duration(seconds: 5);
const _kDefaultReceiveTimeout = Duration(seconds: 120);

BaseOptions dioBaseOptions = BaseOptions(
  connectTimeout: _kDefaultConnectTimeout, //10s
  receiveTimeout: _kDefaultReceiveTimeout,
  contentType: 'application/json',
  headers: <String, String>{'Accept': '*/*'},
  validateStatus: (status) => status != null && status >= 200 && status <= 299,
);

const String doNotAddTokenOption = 'doNotAddTokenOption';
const String testing = 'testing';

const pinLength = 4;
