import 'package:arnimo_test/Domin/fetching_data.dart';
import 'package:arnimo_test/Ui/Home_page.dart';
import 'package:arnimo_test/bloc/bloc_structure_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(WeatherRepository('5d89423b6d701f45ff34c365d14d3b87')),
      child:
           MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
