import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/homepage.dart';
import 'package:test/todocard.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Days(day: "Mon"),
              Days(day: "Tue"),
              Days(day: "Wed"),
              Days(day: "Thr"),
              Days(day: "Fri"),
              Days(day: "Sat"),
              Days(day: "Sun"),
            ],
          ),
          SizedBox(height: 10),
          Flexible(
            child: Consumer(
              builder: (context, ref, child) {
                final todo = ref.read(todoChangeProvider);
                var todoData = ref.watch(todoChangeProvider).listOfTasks;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onDoubleTap: () {
                        todo.removeTask(index);
                      },
                      child: TodoCard(
                        deviceSize: deviceSize,
                        color: Colors.white,
                        taskDoerPhoto: "asset/image/profile.jpg",
                        doerName: todoData[index].title,
                        taskName: todoData[index].description,
                        taskTime: todoData[index].taskTime!.format(context),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Days extends StatelessWidget {
  String? day;
  Days({this.day});

  @override
  Widget build(BuildContext context) {
    return Text(
      day!,
      style: TextStyle(color: Colors.white),
    );
  }
}
