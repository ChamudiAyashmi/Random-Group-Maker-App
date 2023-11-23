import 'package:flutter/material.dart';
import 'package:student_devider_app/student_list.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key, required this.colors}) : super(key: key);

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Student Devicer App'),
      ),
     
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundImage.jpg'),
                fit: BoxFit.cover)),
        child: const Center(child: StudentList()),
      ),
    );
  }
}
