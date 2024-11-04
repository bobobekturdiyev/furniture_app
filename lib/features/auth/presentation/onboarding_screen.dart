import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/config/resources/app_icons.dart';
import 'package:furniture_app/config/routes/route_path.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              controller: controller,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Choose the".toUpperCase(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: " Furniture".toUpperCase(),
                              style: TextStyle(
                                color: Color(0xFFFF6600),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " of your choice to".toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " decorate home".toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          "assets/png/onboarding_1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Choose the".toUpperCase(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: " Furniture".toUpperCase(),
                              style: TextStyle(
                                color: Color(0xFFFF6600),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " of your choice to".toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " decorate home".toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          "assets/png/onboarding_2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Choose the".toUpperCase(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: " Furniture".toUpperCase(),
                              style: TextStyle(
                                color: Color(0xFFFF6600),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " of your choice to".toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " decorate home".toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          "assets/png/onboarding_3.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              right: 24,
              child: getDots(selectedIndex: currentPage)),
          Positioned(
            bottom: 32,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      if (currentPage > 0) {
                        currentPage--;
                        controller.animateToPage(currentPage,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                        setState(() {});
                      }
                    },
                    child: squareButton(icon: AppIcons.arrowLeft)),
                GestureDetector(
                  onTap: () {
                    if (currentPage < 2) {
                      currentPage++;
                      controller.animateToPage(currentPage,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                      setState(() {});
                    } else {
                      context.router.replaceNamed(RoutePath.login);
                    }
                  },
                  child: squareButton(
                    icon: AppIcons.arrowRight,
                    color: Color(0xFFFF6600),
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget squareButton({
    required String icon,
    Color color = Colors.white,
    Color iconColor = Colors.black,
  }) =>
      Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      );

  Widget getDots({
    int selectedIndex = 0,
    int dotsNumber = 3,
  }) {
    return Row(
      children: List.generate(
        dotsNumber,
        (index) => Container(
          width: selectedIndex == index ? 18 : 7,
          margin: EdgeInsets.only(right: index == dotsNumber - 1 ? 0 : 4),
          height: 7,
          decoration: BoxDecoration(
            shape:
                selectedIndex != index ? BoxShape.circle : BoxShape.rectangle,
            borderRadius:
                selectedIndex == index ? BorderRadius.circular(30) : null,
            color: selectedIndex == index ? null : Colors.white,
            border:
                selectedIndex == index ? Border.all(color: Colors.white) : null,
          ),
        ),
      ),
    );
  }

// Widget getDecoratedText(String text){
//
//   // Logika
//
//   // #hashtag larni ko'k stilda qaytaradigan logika tuzing
//   // Assalomu alaykum, #ProgrammerUz ga xush kelibsiz
//   // WidgetSpan
//   return RichText(text: text);
// }
}
