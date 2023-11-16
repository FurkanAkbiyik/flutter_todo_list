import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_purple/widgets/mycard.dart';

import '../models/missions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                image: AssetImage('assets/header.png'),
              ),
            ),
          ),
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: Provider.of<Missions>(context).missions.length,
              itemBuilder: (context, index) {
                return MyCard(
                  mission: Provider.of<Missions>(context, listen: false)
                      .missions[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
