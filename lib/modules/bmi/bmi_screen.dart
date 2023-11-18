import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bmi_calculator/modules/bmi/bmi_results_screen.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool _isMale = true;
  bool _isMaleSelected = true;
  bool _isFemaleSelected = false;

  double _currentHeight = 165.0;
  int _currentAge = 45;
  int _currentWeight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          title: getTitleText()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              _genderButton("MALE", "assets/images/male.png"),
              _genderButton("FEMALE", "assets/images/female.png"),
            ],
          ),
          _heightSliderArea(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _controlArea(
                    "WEIGHT", _currentWeight, _increaseWeight, _decreaseWeight),
                _controlArea("AGE", _currentAge, _increaseAge, _decreaseAge),
              ],
            ),
          ),
          _calculateButton(),
        ],
      ),
    );
  }

  Widget _genderButton(String gender, String imagePath) {
    bool selected = gender == "MALE" ? _isMaleSelected : _isFemaleSelected;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => setState(() {
            _isMale = gender == "MALE";
            if (_isMale) {
              _isMaleSelected = true;
              _isFemaleSelected = false;
            } else {
              _isMaleSelected = false;
              _isFemaleSelected = true;
            }
            selected = gender == "MALE" ? _isMaleSelected : _isFemaleSelected;
          }),
          child: Container(
            width: 200,
            height: 180,
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: selected ? Colors.blue : Colors.grey[400],
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(imagePath),
                  height: 90,
                  width: 90,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Flexible(
                  child: Text(
                    gender,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _heightSliderArea() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(188, 189, 188, 1),
            borderRadius: BorderRadiusDirectional.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                child: Text(
                  "HEIGHT",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: Text(
                        "${_currentHeight.round()}",
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Flexible(
                      child: Text(
                        "CM",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Slider(
                    value: _currentHeight,
                    min: minSlider,
                    max: maxSlider,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        _currentHeight = value;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _controlArea(String title, int initialValue, Function() increaseValue,
      Function() decreaseValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Center(
        child: Container(
          width: 150,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(188, 189, 188, 1),
            borderRadius: BorderRadiusDirectional.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Flexible(
                child: Text(
                  "$initialValue",
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: decreaseValue,
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      heroTag: "$title-",
                      mini: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: increaseValue,
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      heroTag: "$title+",
                      mini: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _increaseWeight() {
    setState(() {
      _currentWeight++;
    });
  }

  _decreaseWeight() {
    setState(() {
      _currentWeight--;
    });
  }

  _increaseAge() {
    setState(() {
      _currentAge++;
    });
  }

  _decreaseAge() {
    setState(() {
      _currentAge--;
    });
  }

  Widget _calculateButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        color: Colors.blue,
        width: double.infinity,
        height: 42,
        child: MaterialButton(
          onPressed: () {
            double result = _currentWeight / pow(_currentHeight / 100, 2);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BMIResultsScreen(
                    gender: _isMale ? "MALE" : "FEMALE",
                    result: result.toStringAsFixed(2),
                    age: _currentAge),
              ),
            );
          },
          child: const Text(
            "CALCULATE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
