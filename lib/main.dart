import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instacare/repositories/doctor_repository.dart';
import 'package:instacare/screens/home_screen.dart';
import 'package:instacare/shared/theme/app_theme.dart';
import 'package:instacare/state/home/home_bloc.dart';

void main() {
  const doctorRepository = DoctorRepository();
  runApp(const AppScreen(
    doctorRepository: doctorRepository,
  ));
}

class AppScreen extends StatelessWidget {
  const AppScreen({super.key, required this.doctorRepository});

  final DoctorRepository doctorRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: doctorRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
              value: HomeBloc(doctorRepository: doctorRepository)
                ..add(LoadHomeEvent())),
        ],
        child: MaterialApp(
          title: 'InstaCare',
          theme: const AppTheme().themeData,
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
