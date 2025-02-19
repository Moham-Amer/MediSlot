import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_slot/core/generic_widgets/custom_text_form_field/bloc/text_form_field_cubit.dart';
import 'package:medi_slot/core/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants/app_const.dart';
import 'features/authentication/bloc/auth_cubit.dart';
import 'features/splash/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  await GetStorage.init();
  runApp(
    ScreenUtilInit(
      enableScaleText: () => true,
      enableScaleWH: () => true,
      designSize: Size(375, 812),
      builder: (context, child) => EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp(isLoggedIn: isLoggedIn),
      ),
    ),
  );
}

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.isLoggedIn});

  ThemeMode themeMode = ThemeMode.system;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return TextFormFieldCubit();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return AuthCubit();
          },
        ),
      ],
      child: ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (context, ThemeMode currentTheme, _) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: AppConst.nunito,
                scaffoldBackgroundColor: AppColors.lightGreyColor,
                useMaterial3: true,
                extensions: [CustomColors.lightCustomColors],
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.dark,
              extensions: [CustomColors.darkCustomColors],),
              themeMode: currentTheme,
              home: SplashScreen(
                isLoggedIn: isLoggedIn,
              ),
            );
          }),
    );
  }
}
