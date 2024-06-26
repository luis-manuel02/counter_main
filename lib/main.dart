import 'package:weartest/counter/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:weartest/counter/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (context, mode, child) {
        return MaterialApp(
          title: 'Counter wear',
          theme: ThemeData(
            visualDensity: VisualDensity.compact,
            colorScheme: mode == WearMode.active
                ? const ColorScheme.dark(
                    primary: Color(0xFF00B5FF),
                  )
                : const ColorScheme.dark(
                    primary: Colors.white24,
                    onSurface: Colors.white10,
                  ),
          ),
          home: CounterPage(mode),
        );
      },
      child: Container(),
    );
  }

  /*
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SmartWatch Counter",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.compact,
      ),
      home: const WatchScreen(),
    );
  }
  */
}


class Counter extends StatefulWidget {
  final WearMode mode;
  const Counter(this.mode, {super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.mode == WearMode.active ? Colors.white : Colors.black,
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Hola mundo wear'),
            ),
          ],
        ),
      ),
    );
  }
}