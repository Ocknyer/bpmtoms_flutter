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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // BPM-ms 전환 버튼
        ElevatedButton(
          onPressed: onModeChanged,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(70, 45),
          ),
          child: Text(
            mode == ConverterMode.bpmToMs ? "BPM" : "ms",
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(width: 16),
        // 입력 필드
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: mode == ConverterMode.bpmToMs
                  ? "Enter BPM"
                  : "Enter ms",
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(width: 16),
        // Reset 버튼
        TextButton.icon(
          onPressed: onReset,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(100, 45),
          ),
          icon: const Icon(Icons.refresh),
          label: const Text('Reset', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
