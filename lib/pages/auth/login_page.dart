import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/pages/auth/register_page.dart';
import 'package:firebase_test/providers/auth/login_provider.dart';
import 'package:firebase_test/services/my_app_functions.dart';
import 'package:firebase_test/widgets/auth/google_btn.dart';
import 'package:firebase_test/widgets/custom_shimmer_text_widget.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/LoginPage";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const CustomShimmerTextWidget(
                text: "ShopSmart",
                fontSize: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(text: "Wellcome back"),
                    SubtitleTextWidget(
                        fontSize: 15,
                        maxLines: 2,
                        fontWeight: FontWeight.w500,
                        text:
                            "Let's get you logged in so you can start shopping"),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: AppKeys.loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: loginProvider.emailController,
                      focusNode: loginProvider.emailFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: const Text("E-mail"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "examble@email.com",
                        prefixIcon: const Icon(IconlyLight.message),
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(loginProvider.passwordFocusNode);
                      },
                      validator: AppValidations.emailValidation,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      validator: AppValidations.passwordValidation,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: loginProvider.passwordController,
                      focusNode: loginProvider.passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: loginProvider.isPasswordLocked,
                      decoration: InputDecoration(
                        label: const Text("Password"),
                        suffix: GestureDetector(
                            onTap: () {
                              print("object");
                              loginProvider.showPasswordEvent(
                                  loginProvider.isPasswordLocked);
                            },
                            child: Icon(loginProvider.isPasswordLocked
                                ? Icons.visibility_off_rounded
                                : Icons.visibility)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "***********",
                        prefixIcon: const Icon(IconlyLight.lock),
                      ),
                      onFieldSubmitted: (value) async {
                        await loginProvider.loginEvent();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const SubtitleTextWidget(
                    text: "Forgot password?",
                    fontStyle: FontStyle.italic,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: kBottomNavigationBarHeight,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    padding: const EdgeInsets.all(12),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    await loginProvider.loginEvent();
                  },
                  child: const SubtitleTextWidget(
                    text: "Sign in",
                    fontSize: 16.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "OR CONNECT USING",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.grey.withOpacity(.9),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: kBottomNavigationBarHeight,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: kBottomNavigationBarHeight - 10,
                        child: GoogleBtn(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: kBottomNavigationBarHeight - 10,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const SubtitleTextWidget(
                            text: "Guest?",
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SubtitleTextWidget(
                      text: "Don't have an account?",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    TextButton(
                      onPressed: () async {
                        await Navigator.pushReplacementNamed(
                            context, RegisterPage.routeName);
                      },
                      child: const SubtitleTextWidget(
                        text: "Sign up",
                        fontSize: 16,
                        textDecoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
