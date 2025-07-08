import 'package:flutter/material.dart';

// Exercise model
class Exercise {
  final String name;
  final String imageUrl;

  Exercise(this.name, this.imageUrl);
}

// Main screen that receives a day and shows related exercises
class Exercises extends StatelessWidget {
  final String day;

  const Exercises({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final exercises = _getExercisesForDay(day);

    return Scaffold(
      appBar: AppBar(title: Text("$day Exercises")),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final ex = exercises[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 220,
              width: 250,// ✅ Set desired height
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  _buildImage(ex.imageUrl),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      ex.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          );

        },
      ),
    );
  }

  // Load either asset or network image
  Widget _buildImage(String path) {
    try {
      if (path.startsWith('http')) {
        return Image.network(
          path,
          width: 100,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
        );
      } else {
        return Image.asset(
          path,
          width: 250,
          height:250,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
        );
      }
    } catch (e) {
      return Icon(Icons.error);
    }
  }


  // Return exercises based on selected day
  List<Exercise> _getExercisesForDay(String day) {
    switch (day) {
      case 'Monday':
        return [
          Exercise('Pec deck fly 3×15', "assets/img/Pecdeckfly.png"),
          Exercise('Chest Press Machine 3×10', "assets/img/Chest-PressMachine.jpg"),
          Exercise('Push up 4×20', "assets/img/pushup.jpg"),
          Exercise('Shoulder press 3×10', "assets/img/shoulderpress.jpg"),
          Exercise('Lateral raises 4×12', "assets/img/Lateral.jpg"),
          Exercise('Dumbbell skull-crushers 3×10', "assets/img/Dumbbell.jpeg"),
          Exercise('Rope triceps extension 4×15', "assets/img/Rope.jpg"),
        ];
      case 'Tuesday':
        return [
          Exercise("Lat pull-down 3 x 12", "assets/img/Latpull-down.png"),
          Exercise("Chest supported dumbbell row 3 x 8", "assets/img/Chestsupporteddumbbell.png"),
          Exercise("Close grip cable row 4 x 10", "assets/img/Close.png"),
          Exercise("Pec deck reverse fly 3 x 12", "assets/img/reverse.webp"),
          Exercise("Dumbbell incline curls 3 x 12", "assets/img/curls.jpg"),
          Exercise("Dumbbell hammer Curls 3*15", "assets/img/hammer.webp"),
        ];
      case 'Wednesday':
        return [
          Exercise("Laying hamstring curls 3 x 12", "assets/img/curls.jpg"),
          Exercise("Leg extensions 3 x 12", "assets/img/Legextensions.webp"),
          Exercise("Leg press 3 x8", "assets/img/LegPress.webp"),
          Exercise("Hack squats 4 x 12", "assets/img/Hacksquats.jpg"),
          Exercise("Bulgarian split squats 3 x 10", "assets/img/Bulgarian.webp"),
          Exercise("Calf raises 4 x 20", "assets/img/Calfraises.webp"),
          Exercise("Leg raises 3 x 12", "assets/img/Legraises.jpeg"),
          Exercise("Plank 3 x 20 seconds", "assets/img/Plank.webp"),

        ];
      case 'Thursday':
        return [
          Exercise("Dumbbell incline press 3 x 8", "assets/img/Dumbbellinclinepress.jpg"),
          Exercise("Incline smith machine press 3 x 10", "assets/img/Incline smith machine press.webp"),
          Exercise("Cable high to lows 4 x 15", "assets/img/Cable high to lows.webp"),
          Exercise("Bent over rows 3 x 10", "assets/img/Bent over rows.webp"),
          Exercise("Cable wide grip rows 3 x 12", "assets/img/Cable wide grip rows.webp"),
          Exercise("Single arm cable rows  4x15", "assets/img/Single arm cable rows.jpg"),

        ];
      case 'Friday':
        return [
          Exercise("Lateral raises 3 x 12", "assets/img/Lateral.jpg"),
          Exercise("Shoulder press 3 x 8", "assets/img/Dumbbellinclinepress.jpg"),
          Exercise("Dumbbell front raises 3 x 15", "assets/img/dumbbell_front_raises.webp"),
          Exercise("Tricep pushdowns 3 x 10", "assets/img/Rope.jpg"),
          Exercise("Tricep extensions 4 x 20", "assets/img/tricep_extensions.webp"),
          Exercise("Preacher curls 3 x 12", "assets/img/preacher_curls.webp"),
          Exercise("Dumbbell incline curls 4 x 15", "assets/img/curls.jpg"),

        ];

      default:
        return [];
    }
  }
}
