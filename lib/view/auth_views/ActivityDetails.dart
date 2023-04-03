import 'package:timemanager/controllers/activityController/activityController.dart';

import '../../components/colors.dart';
import '../../components/custom_button.dart';
import '../../components/sizes.dart';

import '../../utils/indexes.dart';
import 'Activity.dart';

class ActivityDetailsPage extends StatelessWidget {
  var controller = Get.put(ActivityController());

  int activityId;
  String title;
  String description;
  String id;
  String date;
  String startTime;
  String? endTime;
  @override
  Widget build(BuildContext context) {
    String firstname = GetStorage().read("firstName");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: arrowbackColor, //change your color here
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Container(
            color: Colors.white,
           child: Column(
             children: [
              Row(
                children: [
                  Icon(Icons.cake,
                    color: primaryColor,
                  ),
                  hSize32,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Name",
                        style: GoogleFonts.ibmPlexSerif(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -.5,
                          color: darkBlue,
                          fontSize: 14,
                        ),),
                      vSize4,
                      Text(title),
                    ],
                  ),
                ],
              ),

               vSize38,

               Row(
                 children: [
                   const Icon(Icons.note,
                     color: primaryColor,
                   ),
                   hSize32,
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: [
                       Text("Description",
                         style: GoogleFonts.ibmPlexSerif(
                           fontWeight: FontWeight.w600,
                           letterSpacing: -.5,
                           color: darkBlue,
                           fontSize: 14,
                         ),
                       ),
                       vSize4,
                       Text(description),
                     ],
                   ),
                 ],
               ),
            vSize38,
               Row(
                 children: [
                   const Icon(Icons.perm_identity,
                     color: primaryColor,
                   ),
                   hSize32,
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: [
                       Text("Identity Number",
                         style: GoogleFonts.ibmPlexSerif(
                           fontWeight: FontWeight.w600,
                           letterSpacing: -.5,
                           color: darkBlue,
                           fontSize: 14,
                         ),),
                       vSize4,
                       Text(id),
                     ],
                   ),
                 ],
               ),
               vSize38,

               Row(
                 children: [
                   const Icon(Icons.date_range_rounded,
                     color: primaryColor,
                   ),
                   hSize32,
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: [
                       Text("Date",
                           style: GoogleFonts.ibmPlexSerif(
                             fontWeight: FontWeight.w600,
                             letterSpacing: -.5,
                             color: darkBlue,
                             fontSize: 14,
                           ),
                       ),
                       vSize4,
                       Text(date),
                     ],
                   ),
                 ],
               ),
               vSize38,

               Row(

                 children: [
                   const Icon(Icons.access_time_outlined,
                     color: primaryColor,
                   ),
                   hSize32,
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Time Started",
                           style: GoogleFonts.ibmPlexSerif(
                             fontWeight: FontWeight.w600,
                             letterSpacing: -.5,
                             color: darkBlue,
                             fontSize: 14,
                           )),
                       vSize4,
                       Text(startTime),
                     ],
                   ),
                 ],
               ),

               vSize38,

               Row(
                 children: [
                   const Icon(Icons.access_time_outlined,
                     color: primaryColor,
                   ),
                   hSize32,
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Time Ended",
                           style: GoogleFonts.ibmPlexSerif(
                             fontWeight: FontWeight.w600,
                             letterSpacing: -.5,
                             color: darkBlue,
                             fontSize: 14,
                           ),
                       ),
                       vSize4,
                       endTime != null?Text(endTime!): Container(),
                     ],
                   ),
                   const SizedBox(width: 83,),
                   endTime == null?TextButton(onPressed: ()async {
                     await controller.updateActivity(activityId);
                     await controller.getAUserActivities();
                     Get.to(ActivityView());
                   },
                     child: const Text("Update End Time"),
                   ): const SizedBox(),
                 ],
               ),
               vSize79,
               CustomButton(
                 text: 'Close ',
                 // isLoading: controller.isLoading.value,
                 onTap: () {
                   Get.to(ActivityView());
                 },
                 color: Colors.blueAccent,
                 textColor: Colors.white,
               ),
             ],
           ),
          ),
        ),
      ),
    );
  }

  ActivityDetailsPage(this.activityId, this.title, this.description, this.id, this.date,
      this.startTime, this.endTime);
}
