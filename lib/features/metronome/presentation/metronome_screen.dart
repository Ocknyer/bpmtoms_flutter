import 'dart:async';

import 'package:flutter/material.dart';

class MetronomeScreen extends StatefulWidget {
  const MetronomeScreen({super.key});

  @override
  State<MetronomeScreen> createState() => _MetronomeScreenState();
}

class _MetronomeScreenState extends State<MetronomeScreen> {
  final TextEditingController bpmController = TextEditingController(
    text: "120",
  );
  Timer? _timer;
  int _tick = 0;

  void startMetronome() {
    final bpm = double.tryParse(bpmController.text);
    if (bpm == null || bpm <= 0) return;

    final interval = Duration(milliseconds: (60000 / bpm).round());

    _timer?.cancel();
    _timer = Timer.periodic(interval, (timer) {
      setState(() {
        _tick++;
      });
    });
  }

  void stopMetronome() {
    _timer?.cancel();
    setState(() {
      _tick = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    bpmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Metronome")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: bpmController,
              decoration: const InputDecoration(labelText: "Enter BPM"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: startMetronome,
              child: const Text("Start"),
            ),
            ElevatedButton(onPressed: stopMetronome, child: const Text("Stop")),
            const SizedBox(height: 40),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _tick % 2 == 0 ? Colors.blue : Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Tick: $_tick",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
