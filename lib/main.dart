import 'package:custom_utils/custom_utils.dart';
import 'package:easy_gpa_calculator/helpers/theme.dart';
import 'package:easy_gpa_calculator/helpers/theme_service.dart';
import 'package:easy_gpa_calculator/view/screens/screen_calculate_easy_cgpa.dart';
import 'package:easy_gpa_calculator/view/screens/screen_home.dart';
import 'package:easy_gpa_calculator/view/screens/screen_result_c_gpa.dart';
import 'package:easy_gpa_calculator/view/screens/screen_sign_up.dart';
import 'package:easy_gpa_calculator/view/screens/sign_up_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'helpers/theme_service.dart';
import 'model/grade.dart';
import 'model/history.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryAdapter());
  Hive.registerAdapter(GradeAdapter());
  await Hive.openBox('History');
  var box= await Hive.openBox('Grade');
  await Future.delayed(Duration(seconds: 2));
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenHome(),
        themeMode: ThemeServices.getThemeMode(),
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        //
        // themeMode: ThemeService.getThemeMode(),
        // theme: Themes().l,
      );
    },);
  }
}

