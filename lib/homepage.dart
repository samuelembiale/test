import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/boards.dart';
import 'package:test/task.dart';
import 'package:test/tasktodo.dart';

final todoChangeProvider = ChangeNotifierProvider<TaskElements>((ref) {
  return TaskElements();
});


class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  //late TabController _tabController;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(vsync: this, length: myTabs.length);
  // }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final todo = ref.watch(todoChangeProvider);
    // TabController tabController;
    Size deviceSize = MediaQuery.of(context).size;

    String title = "";
    String description = "";
    TimeOfDay _selectedTime = TimeOfDay.now();

    Future<void> _pickTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
      );
      if (pickedTime != null) {
        setState(() {
          _selectedTime = pickedTime;
        });
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: CircleAvatar(
          backgroundImage: AssetImage("asset/image/profile.jpg"),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Column(
                  children: [
                    Text("Add Task"),
                    TextField(
                      decoration: InputDecoration(hintText: "Enter the Title"),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Enter the task description"),
                      onChanged: ((value) {
                        description = value;
                      }),
                    ),
                    TextButton(
                        onPressed: () {
                          _pickTime(context);
                        },
                        child: Text("Pick Time")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              // listOfTasks.add(TaskElements(title: title,description: description,taskTime: _selectedTime));
                              todo.addTask(title, description, _selectedTime);
                            
                              Navigator.pop(context);
                            },
                            child: Text("Add"))
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Monday",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "75% Done",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dec 12, 2022",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Completed Tasks",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        "12",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Text(
                      "Tasks",
                      style: TextStyle(
                          color: Color(0xff152D60),
                          fontSize: deviceSize.width * 0.1,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        OutlinedButton(
                            onPressed: () {},
                            child: Text("Active"),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                side: BorderSide(color: Colors.white))),
                        SizedBox(width: 10),
                        OutlinedButton(
                            onPressed: () {},
                            child: Text("Done"),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                side: BorderSide(color: Colors.white))),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Tasks()
          ],
        ),
      ),
    );
  }
}
