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
    const headerStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Normal
        const Text("Normal:", style: headerStyle),
        Text("1/4: ${ms.toStringAsFixed(3)} ms", style: textStyle),
        Text(
          "1/8: ${ConverterService.getNoteMs(ms, 2).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/16: ${ConverterService.getNoteMs(ms, 4).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/32: ${ConverterService.getNoteMs(ms, 8).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/64: ${ConverterService.getNoteMs(ms, 16).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/128: ${ConverterService.getNoteMs(ms, 32).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        const SizedBox(height: 16),

        // Dotted
        const Text("Dotted (×1.5):", style: headerStyle),
        Text(
          "1/8D: ${ConverterService.getDottedNoteMs(ms, 2).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/16D: ${ConverterService.getDottedNoteMs(ms, 4).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/32D: ${ConverterService.getDottedNoteMs(ms, 8).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/64D: ${ConverterService.getDottedNoteMs(ms, 16).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        const SizedBox(height: 16),

        // Triplet
        const Text("Triplet (×⅔):", style: headerStyle),
        Text(
          "1/8T: ${ConverterService.getTripletNoteMs(ms, 2).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/16T: ${ConverterService.getTripletNoteMs(ms, 4).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/32T: ${ConverterService.getTripletNoteMs(ms, 8).toStringAsFixed(3)} ms",
          style: textStyle,
        ),
        Text(
          "1/64T: ${ConverterService.getTripletNoteMs(ms, 16).toStringAsFixed(3)} ms",
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
