import 'package:flutter/material.dart';

class BMIResultsScreen extends StatelessWidget {
  final String gender;
  final String result;
  final int age;

  const BMIResultsScreen(
      {super.key,
      required this.gender,
      required this.result,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "BMI Result",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText("Gender", gender),
              const SizedBox(
                height: 10,
              ),
              _buildText("Age", age.toString()),
              const SizedBox(
                height: 10,
              ),
              _buildText("Result", result.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String title, String value) {
    return Text(
      "$title: $value",
      style: const TextStyle(
          color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}
