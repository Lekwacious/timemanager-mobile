import 'package:timemanager/utils/indexes.dart';

import '../../components/auth_input.dart';
import '../../components/colors.dart';
import '../../components/custom_button.dart';
import '../../components/scrol_behaviour.dart';
import '../../components/sizes.dart';
import '../../controllers/authController/SignUpController.dart';

class Signup extends StatelessWidget {
  final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: arrowbackColor, //change your color here
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: RemoveScrollBubbleBehavior(),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Track your Time\non all activities",
                        style: GoogleFonts.ibmPlexSerif(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -.5,
                          color: darkBlue,
                          fontSize: Get.height >= 799 ? 24 : 20,
                        ),
                      ),
                      vSize32,
                      Obx(
                            () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormTextField(
                              headerText: "First Name",
                              labelText: 'Enter your first name',
                              hintText: 'Enter your first name',
                              onChange: controller.clearFirstNameError,
                              errortxt: controller.firstNameError.value.isEmpty
                                  ? null
                                  : controller.firstNameError.value,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              textInputType: TextInputType.text,
                              controller: controller.firstNameController, validator: (String ) {  },
                            ),
                            vSize12,
                            FormTextField(
                              headerText: "Last Name",
                              errortxt: controller.lastNameError.value.isEmpty
                                  ? null
                                  : controller.lastNameError.value,
                              labelText: 'Enter your last name',
                              hintText: 'Enter your last name',
                              onChange: controller.clearLastNameError,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              textInputType: TextInputType.text,
                              controller: controller.lastNameController, validator: (String ) {  },
                            ),
                            vSize12,
                            FormTextField(
                              headerText: "Email Address",
                              errortxt: controller.emailError.value.isEmpty
                                  ? null
                                  : controller.emailError.value,
                              textCapitalization: TextCapitalization.none,
                              labelText: 'Enter your email address',
                              hintText: 'Enter your email address',
                              onChange: controller.clearEmailError,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              controller: controller.emailController, validator: (String ) {  },
                            ),
                            vSize12,
                            FormTextField(
                              headerText: "Password",
                              errortxt: controller.passwordError.value.isEmpty
                                  ? null
                                  : controller.passwordError.value,
                              textInputAction: TextInputAction.done,
                              labelText: 'Enter your password',
                              hintText: 'Enter your password',
                              onChange: controller.clearPasswordError,
                              textInputType: TextInputType.visiblePassword,
                              isPassWordField: true,
                              controller: controller.passwordController, validator: (String ) {  },
                            ),
                            vSize24,
                            CustomButton(
                              text: 'Sign Up',
                              isLoading: controller.isLoading.value,
                              onTap: () {
                                controller.validateSignUp();
                              },
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                            vSize16,
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 24.0),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: GoogleFonts.dmSans(
                                    color: Color(0XFF9CABB5),
                                    fontSize: 12,
                                    height: 1.6,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text:
                                      'By creating an account you agree to our ',
                                    ),
                                    TextSpan(
                                      text: 'Term of Service ',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'and ',
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}