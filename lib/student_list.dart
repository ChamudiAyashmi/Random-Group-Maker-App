// import 'package:flutter/material.dart';
// import 'package:student_devider_app/make_group.dart';

// class StudentList extends StatefulWidget {
//   const StudentList({Key? key}) : super(key: key);

//   @override
//   State<StudentList> createState() => _StudentListState();
// }

// class _StudentListState extends State<StudentList> {
//   List<String> students = [];

//   TextEditingController studentNameController = TextEditingController();

//   void addStudent() {
//     String studentName = studentNameController.text.trim();
//     if (studentName.isEmpty || students.contains(studentName)) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(studentName.isEmpty
//                 ? 'Please Enter Name !'
//                 : 'This name is already exists !'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       setState(() {
//         students.add(studentNameController.text);
//         studentNameController.clear();
//       });
//     }
//   }

//   void btnShuffle() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const MakeGroup()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const SizedBox(
//           height: 20,
//         ),
//         SizedBox(
//           width: 320,
//           child: TextField(
//             controller: studentNameController,
//             decoration: const InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white),
//               ),
//               prefixIcon: Icon(Icons.search),
//               labelText: 'Student Name',
//               labelStyle: TextStyle(color: Colors.white),
//               border: OutlineInputBorder(),
//             ),
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             const SizedBox(
//               width: 20,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.black,
//                 textStyle:
//                     const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               onPressed: addStudent,
//               child: const Text('Add Student'),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.black,
//                 textStyle:
//                     const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               onPressed: btnShuffle,
//               child: const Text('Shuffle'),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: students.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 color: const Color.fromARGB(255, 63, 63, 63),
//                 // Set the elevation to create a shadow effect
//                 shape: RoundedRectangleBorder(
//                   borderRadius:
//                       BorderRadius.circular(35.0), // Set the border radius
//                   side: const BorderSide(
//                       color: Colors.white), // Set the border color
//                 ),
//                 child: ListTile(
//                   title: Text(
//                     students[index],
//                     style: const TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:student_devider_app/make_group.dart'; // Import the dart:math library for the shuffle method

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<String> students = [];

  TextEditingController studentNameController = TextEditingController();

  void addStudent() {
    String studentName = studentNameController.text.trim();
    if (studentName.isEmpty || students.contains(studentName)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(studentName.isEmpty
                ? 'Please Enter Name !'
                : 'This name is already exists !'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        students.add(studentNameController.text);
        studentNameController.clear();
      });
    }
  }

  void btnShuffle() {
    students.shuffle(); // Shuffle the list of students

    // Create groups with a maximum of 5 members
    List<List<String>> groups = [];
    int groupSize = 5;

    for (int i = 0; i < students.length; i += groupSize) {
      int endIndex = min(i + groupSize, students.length);
      List<String> group = students.sublist(i, endIndex);
      groups.add(group);
    }

    // If the last group has less than 5 members, add the remaining names to other groups randomly
    int remainingGroupIndex = groups.length - 1;
    while (groups[remainingGroupIndex].length < groupSize &&
        remainingGroupIndex > 0) {
      int randomIndex = Random().nextInt(groups.length - 1);
      if (groups[randomIndex].length < groupSize) {
        groups[randomIndex].addAll(groups[remainingGroupIndex]);
        groups.removeAt(remainingGroupIndex);
        remainingGroupIndex--;
      }
    }

    // Display groups using MakeGroup widget
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MakeGroup(groups: groups)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 320,
          child: TextField(
            controller: studentNameController,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              prefixIcon: Icon(Icons.search),
              labelText: 'Student Name',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: addStudent,
              child: const Text('Add Student'),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: btnShuffle,
              child: const Text('Shuffle'),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              return Card(
                color: const Color.fromARGB(255, 63, 63, 63),
                // Set the elevation to create a shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(35.0), // Set the border radius
                  side: const BorderSide(
                      color: Colors.white), // Set the border color
                ),
                child: ListTile(
                  title: Text(
                    students[index],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
