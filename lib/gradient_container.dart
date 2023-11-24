import 'package:flutter/material.dart';
import 'package:student_devider_app/student_list.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 103, 235),
        title: const Text('Student Devicer App'),
      ),
      body: Container(
        color: Colors.black,
        child: const Center(child: StudentList()),
      ),
    );
  }
}
