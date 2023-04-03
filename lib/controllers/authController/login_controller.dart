import 'package:flutter/foundation.dart';
import 'package:timemanager/services/ActivityService.dart';
import 'package:timemanager/utils/indexes.dart';
import 'package:timemanager/view/auth_views/Activity.dart';

import '../../components/snack_bars.dart';
import '../../model/activity_list.dart';
import '../../model/auth_error.dart';
import '../../model/login_response.dart';
import '../../services/authService/authService.dart';
import '../../services/local_storage.dart';

class LoginController extends GetxController {
  final authServices = Get.put(AuthService());
  final activityServices = Get.put(ActivityService());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var emailError = "".obs;
  var passwordError = "".obs;
  var isLoading = false.obs;

  clearEmailError(val) => emailError.value = "";

  clearPasswordError(val) => passwordError.value = "";

  validateLogin() {
    if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = "Please add a valid email address";
    } else if (GetUtils.isLengthLessThan(passwordController.text.trim(), 8)) {
      passwordError.value = "Please enter a valid password";
    } else {
      loginUser();
    }
  }

  loginUser() async {
    isLoading.value = true;
    var formData = {
      'usernameOrEmail': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };

    try {
      isLoading.value = true;
      var res = await authServices.login(formData);
      if (res.statusCode == 200 || res.statusCode == 201) {
        LoginResponse response = LoginResponse.fromJson(res.data);
        LocalStorage.saveToken(response.access.toString());
        GetStorage().write('email', emailController.text.trim());
        var isFirstLogin = await authServices.isFirstLogin(emailController.text.trim());
        GetStorage().write('userId', isFirstLogin.data['response']['id']);
        GetStorage().write('firstName', isFirstLogin.data['response']['firstName']);
        print(GetStorage().read("userId"));
        getAUserActivities();

        Get.offAll(
                () => ActivityView());
      } else {
        AuthErrorMessage message = AuthErrorMessage.fromJson(res.data);
        SnackBars.errorSnackBar(message: res.data["message"]);
        emailError.value = message.email![0];
        passwordError.value = message.password![0];
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      SnackBars.errorSnackBar(message: e.toString());
    }
  }
  Future<ActivityList> getAUserActivities() async {
    int userId = GetStorage().read("userId");
    var res = await activityServices.getUsersActivity(userId);
    if (kDebugMode) {
      print(res.data);
    }
    if(res.data == null){
      SnackBars.successSnackBar(message: "No activity Logged yet");

    }
    ActivityList response = ActivityList.fromJson(res.data);
    return response;
  }




  @override
  void onInit() async {
    print("call onInit");  // this line not printing
   // getAUserActivities();
    super.onInit();
  }
}