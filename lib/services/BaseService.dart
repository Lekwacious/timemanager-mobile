import 'package:dio/dio.dart';

import '../components/snack_bars.dart';
import 'local_storage.dart';
import 'logger.dart';

class BaseService {
  String baseUrlTest = "https://lovely-toothbrush-production.up.railway.app/";
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "https://lovely-toothbrush-production.up.railway.app/",
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      },
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000))
    ..interceptors.add(LoggingInterceptor());

  Future<Response> request(String url, {dynamic body, required String method}) async {
    var token = await LocalStorage.getToken();
    var res = _dio.request(url,
        data: body,
        options: Options(
            method: method,
            headers:
            token != null ? {'authorization': 'Bearer $token'} : null));
    return res;
  }
}

handleError(DioError error) {
  print(error.response.toString());
  if (error.message.contains('SocketException')) {
    return SnackBars.noInternet(
      message:
      'We cannot detect internet connection. Seems like you are offline.',
      message2: 'Please retry.',
    );
  }

  if (error.type == DioErrorType.connectTimeout) {
    return SnackBars.noInternet(
      message: 'Connection timed out. Seems like you are offline.',
      message2: 'Please retry.',
    );
  }

  if (error.response == null || error.response?.data is String) {
    return SnackBars.noInternet(
      message: 'Something went wrong.',
      message2: 'Please try again later',
    );
  }
  return SnackBars.noInternet(
      message: 'Something went wrong.', message2: 'Please try again later');
}
