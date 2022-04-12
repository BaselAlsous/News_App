// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Buisness/cubit/cubit/app_cubit.dart';
import 'package:test/Constents/Theme/light_theme.dart';
import 'package:test/Data/Api/dio_helper.dart';
import 'package:test/Data/Helper/helper_function.dart';
import 'package:test/Presintation/home.dart';

// Test

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await HelperFunaction.init();

  bool? isDark = HelperFunaction.get(key: 'isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..convertTheme(shaerdTheme: isDark),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsHomeScreens(),
          );
        },
      ),
    );
  }
}
