import 'package:timemanager/utils/indexes.dart';
import 'package:timemanager/view/auth_views/login_view.dart';

import '../../components/snack_bars.dart';
import '../../model/auth_error.dart';
import '../../services/authService/authService.dart';

class SignUpController extends GetxController{
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var authServices = Get.put(AuthService());
  var isLoading = false.obs;
  RxString firstNameError = "".obs;
  var lastNameError = "".obs;
  var emailError = "".obs;
  var passwordError = "".obs;
  final linkdlnToken = ''.obs;

  clearFirstNameError(val) => firstNameError.value = "";

  clearLastNameError(val) => lastNameError.value = "";

  clearEmailError(val) => emailError.value = "";

  clearPasswordError(val) => passwordError.value = "";

  signUp() async {
    isLoading.value = true;
    var user = {
      "email": emailController.text,
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "password": passwordController.text,
    };
    try {
      var res = await authServices.signUp(user);
      isLoading.value = false;
      if (res.statusCode == 200 || res.statusCode == 201) {
        isLoading.value = false;
        Get.to(() => Login());
        print(res.data);
        // analytics.setUserProperties(userId: res.data.id.toString());
      } else {
        AuthErrorMessage message = AuthErrorMessage.fromJson(res.data);
        emailError.value = message.email![0];
        passwordError.value = message.password![0];
      }
    } catch (e) {
      isLoading.value = false;
      SnackBars.errorSnackBar(message: e.toString());
    }
  }


  validateSignUp() {
    if (!GetUtils.isUsername(firstNameController.text.trim())) {
      return firstNameError.value = "Please enter your First name";
    } else if (!GetUtils.isUsername(lastNameController.text.trim())) {
      return lastNameError.value = "Please enter your Last name";
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      return emailError.value = "Please enter a valid email";
    } else if (GetUtils.isLengthLessThan(passwordController.text, 8)) {
      passwordError.value = "Please enter a valid password";
    } else {
      signUp();
    }
  }







}