import 'package:flutter/material.dart';

enum ConverterMode { bpmToMs, msToBpm }

class ConverterInput extends StatelessWidget {
  final TextEditingController controller;
  final ConverterMode mode;
  final VoidCallback onModeChanged;
  final VoidCallback onReset;

  const ConverterInput({
    super.key,
    required this.controller,
    required this.mode,
    required this.onModeChanged,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: mode == ConverterMode.bpmToMs
                      ? "Enter BPM"
                      : "Enter ms",
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: onModeChanged,
              child: Text(
                mode == ConverterMode.bpmToMs ? "BPM → ms" : "ms → BPM",
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              onPressed: onReset,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}
