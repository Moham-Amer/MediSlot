import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medi_slot/core/constants/app_images.dart';
import 'package:medi_slot/core/constants/app_strings.dart';
import 'package:medi_slot/core/generic_widgets/custom_circle_avatar.dart';
import 'package:medi_slot/core/generic_widgets/doctor_card.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:medi_slot/core/theme/app_text_style.dart';
import 'package:medi_slot/features/authentication/bloc/auth_cubit.dart';
import 'package:medi_slot/features/authentication/bloc/auth_state.dart';
import 'package:medi_slot/features/dark_mode/screens/dark_mode_screen.dart';
import 'package:medi_slot/features/language/screens/language_screen.dart';
import 'package:medi_slot/features/profile/screens/profile_screen.dart';
import 'package:medi_slot/features/splash/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<String> specialtiesImages = [
    AppImages.heartGif,
    AppImages.brainGif,
    AppImages.toothGif,
    AppImages.heartGif,
    AppImages.brainGif,
    AppImages.toothGif,
  ];
  List<String> specialties = [
    AppStrings.cardiologist.tr(),
    AppStrings.psychologist.tr(),
    AppStrings.dentist.tr(),
    AppStrings.cardiologist.tr(),
    AppStrings.psychologist.tr(),
    AppStrings.dentist.tr()
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      endDrawer: Drawer(
        width: 187.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        backgroundColor: appColors.lightGreyColor,
        child: Column(
          children: [
            SizedBox(
              height: 64.h,
            ),
            CustomCircleAvatar(
              radius: 44,
              width: 78,
              height: 78,
              image: AppImages.avatar,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              AppStrings.ghaliaAJ.tr(),
              style: AppTextStyle.f20W700NearBlack(context),
            ),
            SizedBox(
              height: 64.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 23.5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Text(
                      AppStrings.settings.tr(),
                      style: AppTextStyle.f16W400NearBlack(context),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  GestureDetector(
                    child: Text(
                      AppStrings.darkMode.tr(),
                      style: AppTextStyle.f16W400NearBlack(context),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DarkModeScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Text(
                    AppStrings.aboutUs.tr(),
                    style: AppTextStyle.f16W400NearBlack(context),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  GestureDetector(
                    child: Text(
                      AppStrings.changeLanguage.tr(),
                      style: AppTextStyle.f16W400NearBlack(context),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LanguageScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 363.h,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    builder: (BuildContext context, AuthState state) {
                      if (state is LogoutLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return GestureDetector(
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            String? token = prefs.getString("accessToken");
                            context.read<AuthCubit>().logout(token!);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(AppImages.logOut,color:appColors.nearBlackColor,),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                AppStrings.logOut.tr(),
                                style: AppTextStyle.f16W400NearBlack(context),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    listener: (BuildContext context, AuthState state) async {
                      if (state is LogoutSuccessState) {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.remove('isLoggedIn');
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SplashScreen(
                              isLoggedIn: false,
                            ),
                          ),
                        );
                      }

                      if (state is LogoutErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMsg),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 59.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                      ),
                      Column(
                        children: [
                          Text(
                            AppStrings.helloGhalia.tr(),
                            style: AppTextStyle.f24W700NearBlack(context),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            AppStrings.howDoYouFeelToday.tr(),
                            style: AppTextStyle.f14W400NearBlack(context),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 115.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: CustomCircleAvatar(
                            radius: 31,
                            width: 55,
                            height: 55,
                            image: AppImages.avatar),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    width: 328.w,
                    height: 48.h,
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        fillColor: appColors.lightGreyColor,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(
                              color: appColors.mediumGreyColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(
                              color: appColors.mediumGreyColor, width: 1),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppImages.search,
                              width: 18.w,
                              height: 18.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                      ),
                      Text(
                        AppStrings.whatAreYouLookingFor.tr(),
                        style: AppTextStyle.f20W700NearBlack(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    width: 327.w,
                    height: 108.h,
                    child: ListView.separated(
                      itemCount: 6,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 8.w,
                        );
                      },
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 102.h,
                          width: 95.w,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 46,
                                backgroundColor: appColors.mediumGreyColor,
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: appColors.lightGreyColor,
                                  child: Image(
                                    image: AssetImage(
                                      specialtiesImages[index],
                                    ),
                                    width: 80.w,
                                    height: 80.h,
                                  ),
                                ),
                              ),
                              Text(
                                specialties[index],
                                style: AppTextStyle.f16W400NearBlack(context),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                      ),
                      Text(
                        AppStrings.dontForget.tr(),
                        style: AppTextStyle.f20W700NearBlack(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 327.w,
                    height: 135.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appColors.primaryColor,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 8.w,
                            ),
                            CustomCircleAvatar(
                              width: 63,
                              height: 63,
                              radius: 36,
                              image: AppImages.assaedHanash,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.drAssaedHanash.tr(),
                                  style: AppTextStyle.f20W700DarkWhite(context),
                                ),
                                Text(
                                  AppStrings.ent.tr(),
                                  style: AppTextStyle.f16W400DarkWhite(context),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          width: 300.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: appColors.lightGreyColor,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              SvgPicture.asset(AppImages.calendar,color:appColors.nearBlackColor,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                AppStrings.date.tr(),
                                style: AppTextStyle.f14W400NearBlack(context),
                              ),
                              SizedBox(
                                width: 17.w,
                              ),
                              SvgPicture.asset(AppImages.clock,color:appColors.nearBlackColor,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                AppStrings.time.tr(),
                                style: AppTextStyle.f14W400NearBlack(context),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                      ),
                      Text(
                        AppStrings.myRecentVisits.tr(),
                        style: AppTextStyle.f20W700NearBlack(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ListView.separated(
                    itemCount: 2,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 8.h,
                      );
                    },
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return DoctorCard(
                        doctorImage: AppImages.nourSrour,
                        doctorName: AppStrings.drNourSrour,
                      );
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                      ),
                      Text(
                        AppStrings.popularDoctor.tr(),
                        style: AppTextStyle.f20W700NearBlack(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ListView.separated(
                      itemCount: 2,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 8.h,
                        );
                      },
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return DoctorCard(
                          doctorImage: AppImages.nourSrour,
                          doctorName: AppStrings.drNourSrour,
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: appColors.snowColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.home,
                width: 24.w,
                height: 24.h,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.calendar,
                width: 24.w,
                height: 24.h,
                color:appColors.nearBlackColor,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.heart,
                width: 24.w,
                height: 24.h,
                color:appColors.nearBlackColor,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.notification,
                width: 24.w,
                height: 24.h,
                color:appColors.nearBlackColor,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
