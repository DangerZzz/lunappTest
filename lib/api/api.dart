import 'package:dio/dio.dart';
import 'package:lunapp_test/models/domain/json_data_list.dart';
import 'package:lunapp_test/models/domain/json_data_list_mapper.dart';
import 'package:lunapp_test/models/dto/json_data_dto.dart';

class Api {
  ///Запрос на получение данных
  static Future<List<JsonData>> getJsonData({required String url}) async {
    final dio = Dio();
    final response;
    try {
      response = await dio.get(url);
      final items = <JsonData>[];
      for (final element in response.data['messages']) {
        items.add(jsonDataMapper(
          JsonDataDTO.fromJson(element as Map<String, dynamic>),
        ));
      }
      return items;
    } catch (e, trace) {
      print(trace);
      print(e);
    }
    return [];
  }
}
