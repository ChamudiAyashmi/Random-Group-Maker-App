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
        builder: (context) => const GradientContainer(
          colors: [
            Color.fromARGB(255, 175, 217, 251),
            Color.fromARGB(255, 246, 168, 194)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 150,
        ),
        const Text(
          'WELCOME !',
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 300,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
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
