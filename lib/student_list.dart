import 'package:flutter/material.dart';
import 'package:student_devider_app/make_group.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<String> students = [];

  TextEditingController studentNameController = TextEditingController();

  void addStudent() {
    String studentName = studentNameController.text;
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
    if (students.length < 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add More than 5 Students!'),
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MakeGroup(students: students),
        ),
      );
    }
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
          width: 340,
          child: TextField(
            controller: studentNameController,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 237, 103, 235),
                ),
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
                backgroundColor: const Color.fromARGB(255, 237, 103, 235),
                foregroundColor: Colors.black,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: addStudent,
              child: const Text('Add Student'),
            ),
            const SizedBox(
              width: 75,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 237, 103, 235),
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
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), 
                  side: const BorderSide(
                      color: Color.fromARGB(
                          255, 237, 103, 235)), 
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
