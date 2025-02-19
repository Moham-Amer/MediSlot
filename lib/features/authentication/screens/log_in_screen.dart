import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:medi_slot/core/generic_widgets/main_button.dart';
import 'package:medi_slot/core/generic_widgets/social_media_methods.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';
import 'package:medi_slot/features/authentication/bloc/auth_cubit.dart';
import 'package:medi_slot/features/authentication/bloc/auth_state.dart';
import 'package:medi_slot/features/authentication/screens/forgot_password_screen.dart';
import 'package:medi_slot/features/authentication/screens/sign_up_screen.dart';
import 'package:medi_slot/features/home/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 78.h),
              Row(
                children: [
                  SizedBox(
                    width: 130.w,
                  ),
                  Text(
                    AppStrings.logIn.tr(),
                    style: AppTextStyle.f40W700NearBlack(context),
                  ),
                ],
              ),
              SizedBox(height: 80.h),
              CustomTextFormField(
                nameController: emailAddressController,
                text: AppStrings.emailAddress,
                keyboardType: TextInputType.emailAddress,
                validatorType: "email",
              ),
              SizedBox(height: 27.h),
              CustomTextFormField(
                nameController: passwordController,
                text: AppStrings.password,
                isPassword: true,
                validatorType: "password",
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ));
                    },
                    child: Text(
                      AppStrings.forgotPassword.tr(),
                      style: AppTextStyle.f12W400NearBlack(context),
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  )
                ],
              ),
              SizedBox(
                height: 178.h,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                builder: (BuildContext context, AuthState state) {
                  if (state is LoginLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return MainButton(
                        text: AppStrings.logIn.tr(),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                                emailAddressController.text,
                                passwordController.text);
                          }
                        },
                        buttonColor: appColors.primaryColor,
                        textColor: appColors.lightGreyColor);
                  }
                },
                listener: (BuildContext context, AuthState state) {
                  if (state is LoginSuccessState) {
                    state.model.cacheLoginToken();
                    cacheLogin();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  }
                  if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMsg),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 38.h,
              ),
              SocialMediaMethods(),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAnAccount.tr(),
                    style: AppTextStyle.f12W400NearBlack(context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      AppStrings.signUp.tr(),
                      style: AppTextStyle.f12W400PrimaryColor(context),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> cacheLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }
}
