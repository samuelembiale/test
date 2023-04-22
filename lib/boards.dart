import 'package:flutter/material.dart';
import 'package:test/taskdetail.dart';
import 'package:test/todocard.dart';

class Boards extends StatelessWidget {
  const Boards({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => TaskDetail())));
          },
          child: TodoCard(
            color: Colors.yellowAccent,
            isTask: false,
            deviceSize: deviceSize,
            taskDoerPhoto: "asset/image/profile.jpg",
            doerName: "Myslef",
            taskName: "Walk My Dog",
            taskTime: "1h 30m",
          ),
        ),
        TodoCard(
          color: Colors.white,
          isTask: false,
          deviceSize: deviceSize,
          taskDoerPhoto: "asset/image/profile.jpg",
          doerName: "Sweet Home",
          taskName: "Grocery shoping",
          taskTime: "2h 45m",
        ),
        TodoCard(
          color: Colors.lightBlue,
          isTask: false,
          deviceSize: deviceSize,
          taskDoerPhoto: "asset/image/profile.jpg",
          doerName: "Work",
          taskName: "Bussiness Model",
          taskTime: "2h 59m",
        ),
      ],
    );
  }
}
