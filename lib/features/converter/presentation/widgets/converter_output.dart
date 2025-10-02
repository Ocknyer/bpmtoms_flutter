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
    if (mode == ConverterMode.msToBpm && bpmResult != null) {
      return _buildBpmOutput(bpmResult!);
    }
    // BPM → ms 모드일 때는 항상 테이블 표시
    return _buildMsOutput(msResult ?? 0.0);
  }

  Widget _buildMsOutput(double ms) {
    const textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
    const headerStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Normal
        Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(7),
                  ),
                ),
                child: const Text(
                  "Normal",
                  style: headerStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Table(
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(200),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(color: Colors.blue.shade50),
                ),
                children: [
                  _buildTableRow("1/4", ms, textStyle),
                  _buildTableRow(
                    "1/8",
                    ConverterService.getNoteMs(ms, 2),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/16",
                    ConverterService.getNoteMs(ms, 4),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/32",
                    ConverterService.getNoteMs(ms, 8),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/64",
                    ConverterService.getNoteMs(ms, 16),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/128",
                    ConverterService.getNoteMs(ms, 32),
                    textStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Dotted
        Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(7),
                  ),
                ),
                child: const Text(
                  "Dotted (×1.5)",
                  style: headerStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Table(
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(200),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(color: Colors.blue.shade50),
                ),
                children: [
                  _buildTableRow(
                    "1/8D",
                    ConverterService.getDottedNoteMs(ms, 2),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/16D",
                    ConverterService.getDottedNoteMs(ms, 4),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/32D",
                    ConverterService.getDottedNoteMs(ms, 8),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/64D",
                    ConverterService.getDottedNoteMs(ms, 16),
                    textStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Triplet
        Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(7),
                  ),
                ),
                child: const Text(
                  "Triplet (×⅔)",
                  style: headerStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Table(
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(200),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(color: Colors.blue.shade50),
                ),
                children: [
                  _buildTableRow(
                    "1/8T",
                    ConverterService.getTripletNoteMs(ms, 2),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/16T",
                    ConverterService.getTripletNoteMs(ms, 4),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/32T",
                    ConverterService.getTripletNoteMs(ms, 8),
                    textStyle,
                  ),
                  _buildTableRow(
                    "1/64T",
                    ConverterService.getTripletNoteMs(ms, 16),
                    textStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow(String note, double ms, TextStyle style) {
    return TableRow(
      decoration: BoxDecoration(color: ms == 0.0 ? Colors.grey.shade50 : null),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          alignment: Alignment.center,
          child: Text(note, style: style),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          alignment: Alignment.center,
          child: Text(
            ms == 0.0 ? "- - -" : "${ms.toStringAsFixed(3)} ms",
            style: style.copyWith(
              color: ms == 0.0 ? Colors.grey.shade600 : style.color,
              fontFeatures: [
                if (!ms.isNaN && ms != 0.0) const FontFeature.tabularFigures(),
              ],
            ),
          ),
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
