import 'package:flutter/foundation.dart';
import 'package:timemanager/services/ActivityService.dart';
import 'package:timemanager/utils/indexes.dart';
import 'package:timemanager/view/auth_views/login_view.dart';

import '../../components/snack_bars.dart';
import '../../model/activityModel.dart';
import '../../model/activity_list.dart';
import '../../model/auth_error.dart';
import '../../services/authService/authService.dart';
import '../../view/auth_views/Activity.dart';

class ActivityController extends GetxController{
  final idNumberController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeEndedController = TextEditingController();

  var activityServices = Get.put(ActivityService());
  var isLoading = false.obs;
  RxString idNumberError = "".obs;
  var titleError = "".obs;
  var descriptionError = "".obs;
  var timeEndedError = "".obs;

  clearTitleError(val) => idNumberError.value = "";

  clearDescriptionError(val) => titleError.value = "";


  clearIdNumberError(val) => descriptionError.value = "";
  clearTimeEndedError(val) => descriptionError.value = "";

  updateActivity(int activityId) async {
    isLoading.value = true;

    try {
      var res = await activityServices.updateActivity(activityId);
      isLoading.value = false;
      if (res.statusCode == 200 || res.statusCode == 201) {
        isLoading.value = false;
        Activity  response = Activity.fromJson(res.data);


      } else {
        AuthErrorMessage message = AuthErrorMessage.fromJson(res.data);
        idNumberError.value = message.email![0];
        titleError.value = message.password![0];
        descriptionError.value = message.password![0];
      }
    } catch (e) {
      isLoading.value = false;
      SnackBars.errorSnackBar(message: e.toString());
    }
  }

  createActivity() async {
    isLoading.value = true;
    var activity = {
      "userId": GetStorage().read('userId'),
      "idNumber": idNumberController.text.trim(),
      "title": titleController.text.trim(),
      "description": descriptionController.text.trim(),
    };
    try {
      var res = await activityServices.createActivity(activity);
      isLoading.value = false;
      if (res.statusCode == 200 || res.statusCode == 201) {
        isLoading.value = false;
        Activity  response = Activity.fromJson(res.data);


      } else {
        AuthErrorMessage message = AuthErrorMessage.fromJson(res.data);
        idNumberError.value = message.email![0];
        titleError.value = message.password![0];
        descriptionError.value = message.password![0];
      }
    } catch (e) {
      isLoading.value = false;
      SnackBars.errorSnackBar(message: e.toString());
    }
  }



  late List<Activity> appliedJobs;

  Future<ActivityList> getAUserActivities() async {
    int userId = GetStorage().read("userId");
    var res = await activityServices.getUsersActivity(userId);
    if (kDebugMode) {
      print(res.data);
    }
    ActivityList response = ActivityList.fromJson(res.data);
    return response;
  }




  // @override
  // void onInit() async {
  //   print("call onInit");  // this line not printing
  //   getAUserActivities();
  //   super.onInit();
  // }

  validateActivity() async {
    if (GetUtils.isLengthLessThan(titleController.text.trim(), 1)) {
      titleError.value = "Please enter a title";
    }
    else if(GetUtils.isLengthLessThan(descriptionController.text.trim(), 1)){
      descriptionError.value = "Please enter a description";

    }
    else if(GetUtils.isLengthLessThan(idNumberController.text.trim(), 1)){
      idNumberError.value = "Enter your Identity number";

    }

    else {
       await createActivity();
      await getAUserActivities();
      Get.to(() => ActivityView());
    }
  }


}