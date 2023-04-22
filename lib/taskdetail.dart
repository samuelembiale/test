import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:test/boards.dart';
import 'package:test/homepage.dart';

class TaskDetail extends StatefulWidget {
  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.yellowAccent,
                leading: GestureDetector(
                  onTap: () {
                    // Action to perform when the button is tapped
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    child: Icon(
                      Icons.expand_more,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      // Action to perform when the button is tapped
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 25,
                      child: Icon(
                        Icons.more_horiz,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Sweet Home",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    side: BorderSide(color: Colors.black))),
            Text(
              "Good",
              style: TextStyle(
                  color: Color(0xff152D60),
                  fontSize: deviceSize.width * 0.2,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Morning",
              style: TextStyle(
                  color: Color(0xff152D60),
                  fontSize: deviceSize.width * 0.2,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time left",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Assigne",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2h 45m",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Dec 12,2022",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("asset/image/profile.jpg"),
                    radius: 30,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Addtional Description",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              "We have to buy some fresh bread,fruit and vegitable. supply of water is running out.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            Text(
              "Created",
              style: TextStyle(),
            ),
            SizedBox(height: 30),
            Text(
              "Dec 10, by Matt",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SwipeableButtonView(
          buttonText: 'Set as Done',
          buttonWidget: Icon(
            Icons.done,
            color: Colors.black,
          ),
          activeColor: Colors.black,
          isFinished: isFinished,
          onWaitingProcess: () {
            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                isFinished = true;
              });
            });
          },
          onFinish: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetail(),
                ));

            //TODO: For reverse ripple effect animation
            setState(() {
              isFinished = false;
            });
          },
        ),
      ),
    );
  }
}
