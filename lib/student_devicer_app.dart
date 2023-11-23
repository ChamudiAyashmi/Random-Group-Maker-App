import 'package:flutter/material.dart';
import 'package:student_devider_app/home.dart';

class StudentDevicerApp extends StatelessWidget {
  const StudentDevicerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgroundImage1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Column(
            children: [
              Center(
                child: Home(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
