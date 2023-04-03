import 'package:dio/dio.dart';

import '../BaseService.dart';



class AuthService {
  BaseService service = BaseService();

  Future<Response> signUp(dynamic body) async {
    try {
      Response response = await service.request("api/v1/timeManager/create",
          body: body, method: "Post");
      print('this is response status ==>${response.statusCode}');
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }



  Future<Response> login(dynamic body) async {
    try {
      Response response =
      await service.request("api/v1/timeManager/signin", body: body, method: "Post");
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<dynamic> sendResetPasswordLink(body) async {
    try {
      var response = await service.request(
          '/auth/accounts/send-reset-password-link/',
          body: {"login": body},
          method: 'post');
      if (response.statusCode == 200)
        return response.statusCode;
      else {
        return response.statusCode;
      }
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> isFirstLogin(String email) async {
    try {
      Response response = await service.request(
          "api/v1/timeManager/user/$email",
          method: "Get");
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
