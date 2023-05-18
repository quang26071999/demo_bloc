import 'package:dio/dio.dart';

void getHttp() async {
  final dio = Dio();
  final response = await dio.get('https://6437d9f50c58d3b1457b143a.mockapi.io/Moto');
  print(response);
}