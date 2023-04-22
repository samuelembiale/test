import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String? taskDoerPhoto;
  final String? doerName;
  final String? taskName;
  final String? taskTime;
  final Size? deviceSize;
  bool isTask;
  Color? color;
  TodoCard({
    this.taskDoerPhoto,
    this.doerName,
    this.taskName,
    this.taskTime,
    required this.deviceSize,
    this.color,
    this.isTask = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, left: 10, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isTask
                    ? CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("$taskDoerPhoto"),
                      )
                    : Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Action to perform when the button is tapped
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white38,
                              radius: 25,
                              child: Icon(
                                Icons.done,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("$taskDoerPhoto"),
                          )
                        ],
                      ),
                isTask
                    ? Row(
                        children: [
                          Text("$taskTime"),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Action to perform when the button is tapped
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white12,
                              radius: 25,
                              child: Icon(
                                Icons.done,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                      )
              ],
            ),
            SizedBox(height: 20),
            Text("$doerName"),
            Text(
              "$taskName",
              style: TextStyle(fontSize: deviceSize!.width * 0.05),
            )
          ],
        ),
      ),
    );
  }
}
