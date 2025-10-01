import 'package:flutter/material.dart';

import 'features/converter/presentation/converter_screen.dart';
import 'features/metronome/presentation/metronome_screen.dart';
import 'features/settings/settings_screen.dart';

class BPMTOMSApp extends StatelessWidget {
  const BPMTOMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BPMTOMS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ConverterScreen(),
        '/metronome': (context) => const MetronomeScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const ConverterScreen(),
            );
          case '/metronome':
            return MaterialPageRoute(
              builder: (context) => const MetronomeScreen(),
            );
          case '/settings':
            return MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            );
        }
      },
    );
  }
}
