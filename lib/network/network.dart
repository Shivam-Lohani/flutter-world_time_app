import 'package:dio/dio.dart';
import 'package:world_time_app/pojo/TimeData.dart';

class Network {
  late final Dio dio;

  Network() {
    configureDio();
  }

  void configureDio() {
    dio = Dio();
    dio.options.baseUrl = 'https://worldtimeapi.org/api/timezone/';
  }

  Future<TimeData> getCurrentTimeDetails(String region) async {
    Response response = await dio.get(region);

    Map<String, dynamic> data = response.data;
    TimeData timeData = TimeData.fromJson(data);

    return timeData;
  }
}
