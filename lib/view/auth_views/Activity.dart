import 'package:timemanager/controllers/activityController/activityController.dart';
import 'package:timemanager/view/auth_views/add_log.dart';

import '../../components/colors.dart';
import '../../components/scrol_behaviour.dart';
import '../../components/sizes.dart';
import '../../controllers/authController/login_controller.dart';
import '../../model/activityModel.dart';
import '../../model/activity_list.dart';
import '../../utils/indexes.dart';
import 'ActivityDetails.dart';

class ActivityView extends StatefulWidget {
  final controller = Get.put(LoginController());

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  final controller = Get.put(LoginController());
  late ActivityList activities;

  @override
  Widget build(BuildContext context) {
    String firstname = GetStorage().read("firstName");
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ScrollConfiguration(
            behavior: RemoveScrollBubbleBehavior(),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey $firstname",
                        style: GoogleFonts.ibmPlexSerif(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -.5,
                          color: darkBlue,
                          fontSize: Get.height >= 799 ? 24 : 20,
                        ),
                      ),
                      vSize8,
                      Text(
                        "Your Activity logs are here",
                        style: GoogleFonts.ibmPlexSerif(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -.5,
                          color: darkBlue,
                          fontSize: 16,
                        ),
                      ),
                      vSize36,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.ibmPlexSerif(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -.5,
                              color: primaryColor,
                              fontSize: 11,
                            ),
                          ),
                          // const SizedBox(width: 35,),
                          Text(
                            "description",
                            style: GoogleFonts.ibmPlexSerif(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -.5,
                              color: primaryColor,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            "ID",
                            style: GoogleFonts.ibmPlexSerif(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -.5,
                              color: primaryColor,
                              fontSize: 11,
                            ),
                          ),
                          // SizedBox(width: 35,),
                          Text(
                            "  ",
                            style: GoogleFonts.ibmPlexSerif(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -.5,
                              color: primaryColor,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder<ActivityList>(
                          future: controller.getAUserActivities(),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                              case ConnectionState.active:
                                {
                                  return const Center(
                                    child: CircularProgressIndicator.adaptive(
                                      valueColor:
                                          AlwaysStoppedAnimation(primaryColor),
                                      strokeWidth: 1,
                                    ),
                                  );
                                }

                              case ConnectionState.done:
                                if (snapshot.hasError) {
                                  return const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text("No Activity Logged yet"),
                                    ),
                                  );
                                }
                                return RefreshIndicator(
                                  onRefresh: _refreshActivity,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.separated(
                                        itemBuilder: (contx, index) {
                                          return Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() =>
                                                      ActivityDetailsPage(
                                                          snapshot
                                                              .data!
                                                              .response[index].id,
                                                          snapshot
                                                              .data!
                                                              .response[index]
                                                              .title,
                                                          snapshot
                                                              .data!
                                                              .response[index]
                                                              .description,
                                                          snapshot
                                                              .data!
                                                              .response[index]
                                                              .idNumber,
                                                          snapshot
                                                              .data!
                                                              .response[index]
                                                              .date,
                                                          snapshot
                                                              .data!
                                                              .response[index]
                                                              .timeStarted,
                                                          snapshot
                                                              .data!
                                                              .response[index]
                                                              .timeEnded));
                                                },
                                                child: Container(
                                                  height: 40,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      snapshot
                                                                  .data!
                                                                  .response[
                                                                      index]
                                                                  .title !=
                                                              null
                                                          ? Text(
                                                              snapshot
                                                                  .data!
                                                                  .response[
                                                                      index]
                                                                  .title,
                                                              style: GoogleFonts
                                                                  .ibmPlexSerif(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    -.5,
                                                                color: darkBlue,
                                                                fontSize: 11,
                                                              ),
                                                            )
                                                          : Container(),
                                                      snapshot
                                                                  .data!
                                                                  .response[
                                                                      index]
                                                                  .description !=
                                                              null
                                                          ? Text(
                                                              snapshot
                                                                  .data!
                                                                  .response[
                                                                      index]
                                                                  .description,
                                                              style: GoogleFonts
                                                                  .ibmPlexSerif(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    -.5,
                                                                color: darkBlue,
                                                                fontSize: 11,
                                                              ),
                                                            )
                                                          : Container(),
                                                      Text(
                                                        snapshot
                                                            .data!
                                                            .response[index]
                                                            .idNumber,
                                                        style: GoogleFonts
                                                            .ibmPlexSerif(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: -.5,
                                                          color: darkBlue,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   snapshot
                                                      //       .data!
                                                      //       .response[index]
                                                      //       .date
                                                      //       .toString(),
                                                      //   style: GoogleFonts
                                                      //       .ibmPlexSerif(
                                                      //     fontWeight:
                                                      //         FontWeight.w600,
                                                      //     letterSpacing: -.5,
                                                      //     color: darkBlue,
                                                      //     fontSize: 11,
                                                      //   ),
                                                      // ),
                                                      TextButton(
                                                        style: TextButton.styleFrom(
                                                          backgroundColor: Colors.blue,
                                                        primary: Colors.white,
                                                      ),
                                                          onPressed: () {  Get.to(() =>
                                                          ActivityDetailsPage(
                                                              snapshot
                                                                  .data!
                                                                  .response[index].id,
                                                              snapshot
                                                                  .data!
                                                                  .response[index].title,
                                                              snapshot
                                                                  .data!
                                                                  .response[index]
                                                                  .description,
                                                              snapshot
                                                                  .data!
                                                                  .response[index]
                                                                  .idNumber,
                                                              snapshot
                                                                  .data!
                                                                  .response[index]
                                                                  .date,
                                                              snapshot
                                                                  .data!
                                                                  .response[index]
                                                                  .timeStarted,
                                                              snapshot
                                                                  .data!
                                                                  .response[index]
                                                                  .timeEnded)); },
                                                      child: const Text("View")),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        separatorBuilder: (cont, index) {
                                          return const Divider();
                                        },
                                        itemCount:
                                            snapshot.data!.response.length),
                                  ),
                                );
                            }
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => NewLog());
        },
      ),
    );
  }

  Future<void> _refreshActivity() async {
    final activity = await controller.getAUserActivities();
    setState(() {
      activities = activity;
    });
  }
}
