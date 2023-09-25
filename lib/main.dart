import 'package:bloc_mini_project_hive/controller/details/bloc/details_bloc.dart';
import 'package:bloc_mini_project_hive/controller/studentLIst/bloc/students_bloc.dart';
import 'package:bloc_mini_project_hive/controller/theme/bloc/theme_bloc.dart';
import 'package:bloc_mini_project_hive/utils/constants/app_theme.dart';
import 'package:bloc_mini_project_hive/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider(
        create: (context) => StudentsBloc(),
      ),
      BlocProvider(
        create: (context) => DetailsBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: state,
          home: const HomeScreen(),
        );
      },
    );
  }
}
