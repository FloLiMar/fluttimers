import 'package:dev/common/widget/NumberListWheelWidget.dart';
import 'package:flutter/material.dart';
import 'common/constants.dart' as constants;
void main() {
      runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const MyHomePage(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int value = 0;
  void updateValue(int newValue) {
    setState(() {
      value = newValue;
    });
    print(value);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Fluttimers'),
      ),
      body:  Center(
        child: Column(
          children: [NumberListWheelWidget(onSelectedItemChangedCallback: updateValue, maxValue: constants.maxMinutes)],
        ),
      ),
    );
  }
}
