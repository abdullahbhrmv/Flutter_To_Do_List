import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> todo = ["Study Lesson", "Run 5k", "Go to Party"];
  // List<String> complated = ["Game meetup", "Take out trash"];

  List<Task> todo = [
    Task(
      type: Tasktype.notes,
      title: "Study Lesson",
      description: "Study COMP117",
      isCompleted: false,
    ),
    Task(
      type: Tasktype.contest,
      title: "Run 5k",
      description: "Run 5 kilometres",
      isCompleted: false,
    ),
    Task(
      type: Tasktype.calendar,
      title: "Go to Party",
      description: "Attend to party",
      isCompleted: false,
    ),
  ];

  List<Task> complated = [
    Task(
      type: Tasktype.contest,
      title: "Run 5k",
      description: "Run 5 kilometres",
      isCompleted: false,
    ),
    Task(
      type: Tasktype.calendar,
      title: "Go to Party",
      description: "Attend to party",
      isCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double doubleHight = MediaQuery.of(context).size.height;
    double doubleWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              // Header
              Container(
                width: doubleWidth,
                height: doubleHight / 3,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/header.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "October 22, 2022",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My Todo List",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return TodoItem(
                          task: todo[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Complated Text
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Complated",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Bottom Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: complated.length,
                    itemBuilder: (context, index) {
                      return TodoItem(
                        task: complated[index],
                      );
                    },
                  )),
                ),
              ),
              // Add New Task Button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddNewTaskScreen(),
                    ),
                  );
                },
                child: const Text("Add New Task"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
