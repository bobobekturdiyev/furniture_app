import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/config/resources/app_icons.dart';
import 'package:furniture_app/config/widgets/w_button.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailVerified = false;
  bool isPasswordVerified = false;

  String? emailError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: 720,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/png/login.png",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: emailController,
                        decoration: _getInputDecoration(
                            label: "Email",
                            errorText: emailError,
                            isVerified: isEmailVerified),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: _getInputDecoration(
                            label: "Password",
                            errorText: passwordError,
                            isVerified: isPasswordVerified),
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: 32),
                      WButton(
                        text: "Login",
                        onTap: () {
                          emailError = null;
                          passwordError = null;

                          if (emailController.text.isNotEmpty &&
                              emailController.text.contains("@")) {
                            isEmailVerified = true;
                          } else {
                            emailError = "Noto'g'ri email kiritildi";
                          }

                          if (passwordController.text.isNotEmpty &&
                              passwordController.text.length >= 6) {
                            isPasswordVerified = true;
                          } else {
                            passwordError =
                                "Parol kamida 6 ta belgidan iborat bo'lsin";
                          }

                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Color(0xFFFF6600),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getInputDecoration({
    required String label,
    bool isVerified = false,
    String? errorText,
  }) =>
      InputDecoration(
        label: Text(label),
        errorText: errorText,
        suffixIcon: isVerified
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppIcons.check),
              )
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEEEEEE),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF6600),
          ),
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xFFAAAAAA),
        ),
      );
}
