import 'package:flutter/material.dart';
import 'package:pocket_tasks/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late String? userName;
  late Goal userGoal; // Change data type to Goal enum
  late PreferredMethod preferredMethod; // Change data type to PreferredMethod enum

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
      userGoal = Goal.values[prefs.getInt('userGoal') ?? Goal.productivity.index]; // Use default value if not found
      preferredMethod = PreferredMethod.values[prefs.getInt('preferredMethod') ?? PreferredMethod.traditional.index]; // Use default value if not found
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome, ${userName ?? 'Guest'}!", style: TextStyle(fontSize: 24.0)),
              SizedBox(height: 16.0),
              Text("Your Goal: $userGoal", style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 16.0),
              Text("Preferred Method: $preferredMethod", style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 16.0),
              const Text("This is gonna be the home view."),
            ],
          ),
        ),
      ),
    );
  }
}
