import 'package:flutter/material.dart';

import '../../logic/converter_service.dart';
import 'converter_input.dart';

class ConverterOutput extends StatelessWidget {
  final ConverterMode mode;
  final double? msResult;
  final double? bpmResult;

  const ConverterOutput({
    super.key,
    required this.mode,
    required this.msResult,
    required this.bpmResult,
  });

  @override
  Widget build(BuildContext context) {
    if (mode == ConverterMode.bpmToMs && msResult != null) {
      return _buildMsOutput(msResult!);
    } else if (mode == ConverterMode.msToBpm && bpmResult != null) {
      return _buildBpmOutput(bpmResult!);
    }
    return const SizedBox.shrink();
  }

  Widget _buildMsOutput(double ms) {
    const textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 기본 음표
        Text("1/4 note: ${ms.toStringAsFixed(3)} ms", style: textStyle),
        Text(
          "1/8 note: ${ConverterService.getNoteMs(ms, 2).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/16 note: ${ConverterService.getNoteMs(ms, 4).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/32 note: ${ConverterService.getNoteMs(ms, 8).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/64 note: ${ConverterService.getNoteMs(ms, 16).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/128 note: ${ConverterService.getNoteMs(ms, 32).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        const SizedBox(height: 16),
        // 점음표
        const Text(
          "Dotted Notes:",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(
          "Dotted 1/8: ${ConverterService.getDottedNoteMs(ms, 2).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "Dotted 1/16: ${ConverterService.getDottedNoteMs(ms, 4).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "Dotted 1/32: ${ConverterService.getDottedNoteMs(ms, 8).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "Dotted 1/64: ${ConverterService.getDottedNoteMs(ms, 16).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
      ],
    );
  }

  Widget _buildBpmOutput(double bpm) {
    return Text(
      "BPM: ${bpm.toStringAsFixed(3)}",
      style: const TextStyle(fontSize: 20),
    );
  }
}
