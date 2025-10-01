import 'package:flutter/material.dart';

import '../logic/converter_service.dart';
import 'widgets/converter_input.dart';
import 'widgets/converter_output.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController inputController = TextEditingController();
  ConverterMode mode = ConverterMode.bpmToMs;
  double? bpmResult;
  double? msResult;

  @override
  void initState() {
    super.initState();
    inputController.addListener(_handleInputChange);
  }

  @override
  void dispose() {
    inputController.removeListener(_handleInputChange);
    inputController.dispose();
    super.dispose();
  }

  void _handleInputChange() {
    if (inputController.text.isEmpty) {
      reset();
      return;
    }
    convert();
  }

  void convert() {
    final value = double.tryParse(inputController.text);
    if (value == null || value <= 0) return;

    setState(() {
      if (mode == ConverterMode.bpmToMs) {
        msResult = ConverterService.bpmToMs(value);
        bpmResult = null;
      } else {
        bpmResult = ConverterService.msToBpm(value);
        msResult = null;
      }
    });
  }

  void toggleMode() {
    setState(() {
      mode = (mode == ConverterMode.bpmToMs)
          ? ConverterMode.msToBpm
          : ConverterMode.bpmToMs;
      reset();
    });
  }

  void reset() {
    setState(() {
      inputController.clear();
      bpmResult = null;
      msResult = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BPMTOMS")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConverterInput(
              controller: inputController,
              mode: mode,
              onModeChanged: toggleMode,
              onReset: reset,
            ),
            const SizedBox(height: 24),
            ConverterOutput(
              mode: mode,
              msResult: msResult,
              bpmResult: bpmResult,
            ),
          ],
        ),
      ),
    );
  }
}
