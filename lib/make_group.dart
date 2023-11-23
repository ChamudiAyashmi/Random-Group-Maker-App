// import 'package:flutter/material.dart';

// class MakeGroup extends StatelessWidget {
//   const MakeGroup({super.key, required List<List<String>> groups});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('Student Devicer App'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';


class MakeGroup extends StatelessWidget {
  final List<List<String>> groups;

  const MakeGroup({Key? key, required this.groups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Student Divider App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 63, 63, 63),
              // Set the elevation to create a shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Set the border radius
                side: const BorderSide(
                    color: Colors.white), // Set the border color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Group ${index + 1}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: groups[index]
                        .map((student) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                student,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
