import 'package:dev/appBar/presentation/AppBarWidget.dart';
import 'package:dev/fluttimerMain/presentation/EmptyFluttimerMainWidget.dart';
import 'package:dev/countDownTimer/presentation/EmptyCountDownTimersWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
      runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('fr')
        ],
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        ),
        home: const MyHomePage(),
      );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(), body: EmptyCountDownTimersWidget());
  }
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

    return const Scaffold(
      appBar: AppBarWidget(),
      body:  EmptyFluttimerMainWidget()
    );
  }
}
