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
import 'package:medi_slot/features/authentication/screens/log_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                    width: 114.w,
                  ),
                  Text(
                    AppStrings.signUp.tr(),
                    style: AppTextStyle.f40W700NearBlack(context),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              CustomTextFormField(
                nameController: nameController,
                text: AppStrings.name,
                validatorType: "name",
              ),
              SizedBox(height: 30.h),
              CustomTextFormField(
                nameController: emailAddressController,
                text: AppStrings.emailAddress,
                keyboardType: TextInputType.emailAddress,
                validatorType: "email",
              ),
              SizedBox(height: 30.h),
              CustomTextFormField(
                nameController: passwordController,
                text: AppStrings.password,
                isPassword: true,
                validatorType: "password",
              ),
              SizedBox(height: 30.h),
              CustomTextFormField(
                nameController: confirmPasswordController,
                text: AppStrings.confirmPassword,
                isConfirmPassword: true,
                validatorType: "password",
              ),
              SizedBox(
                height: 36.h,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                builder: (BuildContext context, AuthState state) {
                  if (state is RegisterLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return MainButton(
                        text: AppStrings.signUp.tr(),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().register(
                                emailAddressController.text,
                                nameController.text,
                                passwordController.text,
                                confirmPasswordController.text);
                          }
                        },
                        buttonColor: appColors.primaryColor,
                        textColor: appColors.lightGreyColor);
                  }
                },
                listener: (BuildContext context, AuthState state) {
                  if (state is RegisterSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.model.message!),
                      ),
                    );

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => LogInScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  }

                  if (state is RegisterErrorState) {
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
                    AppStrings.haveAnAccount.tr(),
                    style: AppTextStyle.f12W400BrighterNearBlack(context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LogInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      AppStrings.logIn.tr(),
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
}
