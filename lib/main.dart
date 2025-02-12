import 'package:dd_test/data/data_sources/data_base_helper.dart';
import 'package:dd_test/features/savings/presentation/bloc/savings_bloc.dart';
import 'package:dd_test/features/savings/presentation/bloc/savings_event.dart';
import 'package:dd_test/features/savings/presentation/pages/home_page.dart';
import 'package:dd_test/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Poppins",
        primaryColor: AppColors.teal,
      ),
      home: BlocProvider(
        create: (_) => SavingsBloc(DatabaseHelper())..add(LoadSavingsEvent()),
        child: const HomePage(),
      ),
    );
  }
}
