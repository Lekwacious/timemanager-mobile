import 'package:timemanager/controllers/activityController/activityController.dart';
import 'package:timemanager/controllers/authController/login_controller.dart';

import '../../components/auth_input.dart';
import '../../components/colors.dart';
import '../../components/custom_button.dart';
import '../../components/scrol_behaviour.dart';
import '../../components/sizes.dart';
import '../../utils/indexes.dart';

class UpdateActivity extends StatelessWidget {
  var controller = Get.put(ActivityController());

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
                        "Update Time Ended",
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
                              headerText: "Time Ended",
                              errortxt: controller.timeEndedError.value.isEmpty
                                  ? null
                                  : controller.timeEndedError.value,
                              textCapitalization: TextCapitalization.none,
                              labelText: 'Enter time Ended',
                              hintText: 'Enter the time your activity ended',
                              textInputAction: TextInputAction.next,
                              onChange: controller.clearTimeEndedError,
                              textInputType: TextInputType.emailAddress,
                              controller: controller.timeEndedController, validator: (String ) {  },
                            ),
                            vSize12,

                            const Text(
                              "Forgot password?",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                letterSpacing: .2,
                                fontSize: 14,
                                color: primaryColor,
                              ),
                            ),
                            vSize24,
                            CustomButton(
                              text: 'Log In',
                              isLoading: controller.isLoading.value,
                              onTap: () {
                                //controller.validateUpdate();
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

