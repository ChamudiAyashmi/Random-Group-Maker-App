import 'package:flutter/material.dart';
import 'package:student_devider_app/gradient_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void btnGetStarted() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GradientContainer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 450,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 237, 103, 235),
              foregroundColor: Colors.black,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8)),
          onPressed: btnGetStarted,
          child: const Text('Get Started'),
        ),
      ],
    );
  }
}
