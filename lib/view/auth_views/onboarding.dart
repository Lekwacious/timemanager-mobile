import 'dart:async';

import 'package:timemanager/view/auth_views/signup_view.dart';

import '../../components/colors.dart';
import '../../components/custom_button.dart';
import '../../components/sizes.dart';
import '../../utils/indexes.dart';
import 'login_view.dart';


class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  late Timer _timer;
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      Duration(seconds: 5),
          (Timer timer) {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        controller.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutQuart,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: Get.height / 3.8,
          color: blueColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0.0, 20, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Sign Up',
                  onTap: () {
                    Get.to(() => Signup(), transition: Transition.fadeIn);
                  },
                  color: Colors.white,
                  textColor: Colors.blueAccent,
                ),
                vSize12,
                CustomButton(
                  text: 'Log In',
                  color: blueColor,
                  onTap: () {
                    Get.to(() => Login(), transition: Transition.fadeIn);
                  },
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // vSize24,
              Container(
                height: Get.height / 2,
                  child: PageView(
                    controller: controller,
                    children: [
                      SizedBox(
                        // width: Get.width * .8,
                        child: Center(
                          child: Image.asset(
                            "assets/images/onb.jpg",
                            // height: 200,
                            // width: 70,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        // width: Get.width * .8,
                        child: Center(
                          child: Image.asset(
                            "assets/images/onb.jpg",
                            // height: 200,
                            // width: 70,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        // width: Get.width * .8,
                        child: Center(
                          child: Image.asset(
                            "assets/images/onb.jpg",
                            // height: 200,
                            // width: 70,
                            fit: BoxFit.contain,
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
    );
  }
}
