import 'package:timemanager/controllers/authController/login_controller.dart';

import '../../components/auth_input.dart';
import '../../components/colors.dart';
import '../../components/custom_button.dart';
import '../../components/scrol_behaviour.dart';
import '../../components/sizes.dart';
import '../../controllers/authController/SignUpController.dart';
import '../../utils/indexes.dart';

class Login extends StatelessWidget {
  var controller = Get.put(LoginController());
  var signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: arrowbackColor, //change your color here
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ScrollConfiguration(
            behavior: RemoveScrollBubbleBehavior(),
            child: ListView(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.ibmPlexSerif(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -.5,
                          color: darkBlue,
                          fontSize: Get.height >= 799 ? 24 : 20,
                        ),
                      ),
                      vSize24,
                      Obx(
                            () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormTextField(
                              headerText: "Email Address",
                              errortxt: controller.emailError.value.isEmpty
                                  ? null
                                  : controller.emailError.value,
                              textCapitalization: TextCapitalization.none,
                              labelText: 'Enter your email address',
                              hintText: 'Enter your email address',
                              textInputAction: TextInputAction.next,
                              onChange: controller.clearEmailError,
                              textInputType: TextInputType.emailAddress,
                              controller: controller.emailController, validator: (String ) {  },
                            ),
                            vSize12,
                            FormTextField(
                              headerText: "Password",
                              onChange: controller.clearPasswordError,
                              errortxt: controller.passwordError.value.isEmpty
                                  ? null
                                  : controller.passwordError.value,
                              labelText: 'Enter your password',
                              hintText: 'Enter your password',
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              isPassWordField: true,
                              controller: controller.passwordController, validator: (String ) {  },
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // Get.to(ResetPassword(),
                                  //     transition: Transition.cupertino);
                                },
                                child: const Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: .2,
                                    fontSize: 14,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            vSize24,
                            CustomButton(
                              text: 'Log In',
                              isLoading: controller.isLoading.value,
                              onTap: () {
                                controller.validateLogin();
                              },
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

