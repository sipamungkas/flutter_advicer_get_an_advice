// Model is like an entity but just a data parser
import 'dart:convert';
import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  /// request random advice from api
  /// return [AdviceModal] if success
  /// throws server-exception if status code is not 200, 201||
  /// exception is eror that we dont have in our application (not a failure from our apps)
  Future<AdviceModel> getRandomAdviceFromApi(int adviceId);
}

class AdviceRemoteDatasourceImplementation implements AdviceRemoteDatasource {
  final client = http.Client();

  @override
  Future<AdviceModel> getRandomAdviceFromApi(adviceId) async {
    final response = await client.get(
      Uri.parse(
          'https://my-json-server.typicode.com/sipamungkas/advice-json-db/advice/$adviceId'),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
