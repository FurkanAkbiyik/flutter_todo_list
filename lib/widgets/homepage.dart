import 'package:flutter/material.dart';
import 'package:todo_list_purple/constants/colors.dart';
import 'package:todo_list_purple/pages/secondpage.dart';
import 'package:todo_list_purple/service/todoservice.dart';
import 'package:todo_list_purple/widgets/mycard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
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
                image: AssetImage('assets/header.png'),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: FutureBuilder(
              future: todoService.getUncompletedTodos(),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return MyCard(
                        mission: snapshot.data![index],
                      );
                    },
                  );
                }
              },
            )),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Completed',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(
            child: SingleChildScrollView(
                child: FutureBuilder(
              future: todoService.getCompletedTodos(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return MyCard(
                        mission: snapshot.data![index],
                      );
                    },
                  );
                }
              },
            )),
          ),
          SizedBox(height: deviceHeight / 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  minimumSize: Size(deviceWidth / 2, deviceHeight / 10)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SecondPage();
                  },
                ));
              },
              child: const Text(
                'Add a new task',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
