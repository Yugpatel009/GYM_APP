import 'package:flutter/material.dart';
import 'Exercises.dart';

class GymScreen extends StatelessWidget {
  GymScreen({super.key});

  final List<String> _dayofWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Gym Exercises"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
            childAspectRatio: 5,
            children: List.generate(_dayofWeek.length, (index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Exercises(day: _dayofWeek[index]),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      _dayofWeek[index],
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
