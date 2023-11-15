import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const BMIScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(50.0),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius:
                  BorderRadiusDirectional.only(topStart: Radius.circular(40))),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              const Image(
                image: NetworkImage(
                    "https://framerusercontent.com/images/50N8lAJC7seBKw3wbBNv2tPJmj0.png"),
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.3),
                width: double.infinity,
                child: const Positioned(
                  bottom: 1,
                  child: Text(
                    "Dogs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
