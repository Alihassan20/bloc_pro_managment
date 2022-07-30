

import 'package:dio/dio.dart';

import '../../const/strings.dart';

class DioHelper{

  late Dio dio;
  DioHelper() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000, // 60 seconds,
      receiveTimeout: 10 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      return [];
    }

  }

  Future<List<dynamic>>getCharacters() async {
    final response =
    await dio.get('https://www.breakingbadapi.com/api/characters');
    if (response.statusCode == 200) {
      final character = response.data;
      return character;
    } else {
      print('error!');
      return [];
    }
  }}