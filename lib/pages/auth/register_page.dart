import 'package:firebase_test/core/enums/image_picker_enum.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/core/utils/media_query_values.dart';
import 'package:firebase_test/pages/auth/login_page.dart';
import 'package:firebase_test/providers/auth/register_provider.dart';
import 'package:firebase_test/services/my_app_functions.dart';
import 'package:firebase_test/widgets/auth/image_picker_widget.dart';
import 'package:firebase_test/widgets/custom_shimmer_text_widget.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/RegisterPage";
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
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
                    TitleWidget(text: "Wellcome"),
                    SubtitleTextWidget(
                        fontSize: 15,
                        maxLines: 2,
                        fontWeight: FontWeight.w500,
                        text:
                            "Sign up now to recive special offers and updates from our app"),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: context.width * .3,
                height: context.width * .3,
                child: const ImagePickerWidget(),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: AppKeys.registerKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: registerProvider.usernameController,
                      focusNode: registerProvider.usernameFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: const Text('username'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(IconlyLight.profile),
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(registerProvider.emailFocusNode);
                      },
                      validator: AppValidations.requiredValidation,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: registerProvider.emailController,
                      focusNode: registerProvider.emailFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: const Text('E-mail'),
                        hintText: "email@examble.com",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(IconlyLight.message),
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(registerProvider.passwordFocusNode);
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
                      controller: registerProvider.passwordController,
                      focusNode: registerProvider.passwordFocusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: registerProvider.isPasswordLocked,
                      decoration: InputDecoration(
                        errorMaxLines: 2,
                        suffix: GestureDetector(
                            onTap: () {
                              registerProvider.showPasswordEvent(
                                  registerProvider.isPasswordLocked);
                            },
                            child: Icon(registerProvider.isPasswordLocked
                                ? Icons.visibility_off_rounded
                                : Icons.visibility)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "***********",
                        label: const Text('password'),
                        prefixIcon: const Icon(IconlyLight.lock),
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(
                          registerProvider.passwordConfirmationFocusNode,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      validator: (value) {
                        return AppValidations.passwordConfirmationValidation(
                            value, registerProvider.passwordController.text);
                      },
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      controller:
                          registerProvider.passwrodConfirmatoinController,
                      focusNode: registerProvider.passwordConfirmationFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText:
                          registerProvider.isPasswordConfirmationLocked,
                      decoration: InputDecoration(
                        errorMaxLines: 2,
                        suffix: GestureDetector(
                            onTap: () {
                              print("object");
                              registerProvider.showPasswordConfirmationEvent(
                                  registerProvider
                                      .isPasswordConfirmationLocked);
                            },
                            child: Icon(
                                registerProvider.isPasswordConfirmationLocked
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "***********",
                        label: const Text('password confirmation'),
                        prefixIcon: const Icon(IconlyLight.lock),
                      ),
                      onFieldSubmitted: (value) async {
                        await registerProvider.registerEvent();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: kBottomNavigationBarHeight,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 2,
                    padding: const EdgeInsets.all(12),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    await registerProvider.registerEvent();
                  },
                  child: const SubtitleTextWidget(
                    text: "Sign up",
                    fontSize: 15,
                  ),
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
                      text: "Do you have an account?",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    TextButton(
                      onPressed: () async {
                        await Navigator.pushReplacementNamed(
                            context, LoginPage.routeName);
                      },
                      child: const SubtitleTextWidget(
                        text: "Sign in",
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
