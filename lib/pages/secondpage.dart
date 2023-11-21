import 'package:flutter/material.dart';
import 'package:todo_list_purple/models/tasktype.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  TaskType taskType = TaskType.category;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: deviceWidth,
            height: deviceHeight / 4,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/header2.png'))),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Task title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: deviceWidth / 5,
                child: TextField(
                  controller: taskTitleController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Task title',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(milliseconds: 300),
                                content: Text('Category selected')));
                        setState(() {
                          taskType = TaskType.category;
                        });
                      },
                      child: Image.asset('assets/Category.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(milliseconds: 300),
                                content: Text('Category selected')));
                        setState(() {
                          taskType = TaskType.calendar;
                        });
                      },
                      child: Image.asset('assets/calendar.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(milliseconds: 300),
                                content: Text('Category selected')));
                        setState(() {
                          taskType = TaskType.contest;
                        });
                      },
                      child: Image.asset('assets/contest.png')),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: deviceWidth / 5,
                    child: TextField(
                      controller: dateController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: deviceWidth / 5,
                    child: TextField(
                      controller: timeController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.lock_clock),
                        border: OutlineInputBorder(),
                        labelText: 'Time',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Notes',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              )),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: deviceHeight / 4,
                  width: deviceWidth / 2,
                  child: TextField(
                    controller: notesController,
                    expands: true,
                    maxLines: null,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: 'Notes',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
