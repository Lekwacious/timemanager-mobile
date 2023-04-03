import 'package:dio/dio.dart';

import 'BaseService.dart';



class ActivityService {
  BaseService service = BaseService();

  Future<Response> createActivity(dynamic body) async {
    try {
      Response response = await service.request("api/v1/timeManager/log",
          body: body, method: "Post");
      print('this is response status ==>${response.statusCode}');
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }



  Future<Response> getUsersActivity(dynamic userId) async {
    print("I got called");
    try {
      Response response =
      await service.request("api/v1/timeManager/log/user/$userId",  method: "Get");
      print(response.data);
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }

  Future<dynamic> updateActivity(dynamic userId) async {
    try {
      // print("This is my type${id.runtimeType}");
      var response = await service.request('api/v1/timeManager/log/$userId', method: 'Put');
      if (response.statusCode == 200) {
        return response;
      } else {
        return response;
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

