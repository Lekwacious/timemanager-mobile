import 'package:timemanager/utils/indexes.dart';
import 'package:timemanager/view/auth_views/Activity.dart';

import '../../components/auth_input.dart';
import '../../components/colors.dart';
import '../../components/custom_button.dart';
import '../../components/scrol_behaviour.dart';
import '../../components/sizes.dart';
import '../../controllers/activityController/activityController.dart';

class NewLog extends StatelessWidget {
  final controller = Get.put(ActivityController());
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
                        "Log in all your activities here",
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
                              headerText: "Name",
                              labelText: 'Enter the title',
                              hintText: 'Enter the title',
                              onChange: controller.clearTitleError,
                              errortxt: controller.titleError.value.isEmpty
                                  ? null
                                  : controller.titleError.value,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              textInputType: TextInputType.text,
                              controller: controller.titleController,
                              validator: (String) {},
                            ),
                            vSize12,
                            FormTextField(
                              headerText: "Description of Activity",
                              errortxt:
                                  controller.descriptionError.value.isEmpty
                                      ? null
                                      : controller.descriptionError.value,
                              labelText: 'Enter the description',
                              hintText: 'Enter the description',
                              onChange: controller.clearDescriptionError,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              textInputType: TextInputType.text,
                              controller: controller.descriptionController,
                              validator: (String) {},
                            ),
                            vSize12,
                            FormTextField(
                              headerText: "Identification Number",
                              errortxt: controller.idNumberError.value.isEmpty
                                  ? null
                                  : controller.idNumberError.value,
                              textCapitalization: TextCapitalization.none,
                              labelText: 'Enter your Identification number',
                              hintText: 'Enter your Identification number',
                              onChange: controller.clearIdNumberError,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              controller: controller.idNumberController,
                              validator: (String) {},
                            ),
                            vSize24,
                            CustomButton(
                              text: 'Log Activity',
                              isLoading: controller.isLoading.value,
                              onTap: () {
                                controller.validateActivity();

                              },
                              color: Colors.blueAccent,
                              textColor: Colors.white,
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
