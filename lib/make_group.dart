import 'dart:math';

import 'package:flutter/material.dart';

class MakeGroup extends StatefulWidget {
  final List<String> students;

  const MakeGroup({Key? key, required this.students}) : super(key: key);

  @override
  State<MakeGroup> createState() => _MakeGroupState();
}

class _MakeGroupState extends State<MakeGroup> {
  late List<List<String>> groups;

  @override
  void initState() {
    super.initState();
    groups = shuffledStudent();
  }

  List<List<String>> shuffledStudent() {
    List<String> shuffleName = List.from(widget.students)..shuffle();
    List<List<String>> groups = [];

    int cardCount = (widget.students.length / 5).ceil();
    int current = 0;

    for (int i = 0; i < cardCount; i++) {
      int size = min(5, shuffleName.length - current);

      if (size <= 3) {
        int remainingSize = min(5 - size, shuffleName.length - current);

        for (int j = 0; j < remainingSize; j++) {
          while (current < shuffleName.length) {
            int random = Random().nextInt(cardCount - 1);
            groups[random].add(shuffleName[current++]);
            size += remainingSize;
          }
        }
      } else {
        List<String> group = shuffleName.sublist(current, current + size);
        current += size;
        groups.add(group);
      }
    }
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 103, 235),
        title: const Text('Student Devicer App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < groups.length; i++)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 237, 103, 235)),
                  ),
                  child: ListTile(
                    title: Text(
                      'Group ${i + 1}',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      groups[i].join('\n'),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
