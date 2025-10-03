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
    const textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
    const headerStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Normal
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 6),
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
                  0: FlexColumnWidth(2), // 음표 열
                  1: FlexColumnWidth(3), // ms 값 열
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
        const SizedBox(height: 8),

        // Dotted & Triplet
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(7),
                  ),
                ),
                child: const Text(
                  "Dotted & Triplet",
                  style: headerStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(2), // Dotted 음표
                  1: FlexColumnWidth(3), // Dotted ms
                  2: FlexColumnWidth(2), // Triplet 음표
                  3: FlexColumnWidth(3), // Triplet ms
                },
                border: TableBorder(
                  horizontalInside: BorderSide(color: Colors.blue.shade50),
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.blue.shade50),
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 4,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Dotted",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 4,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "(×1.5)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 4,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Triplet",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 4,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "(×⅔)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildQuadTableRow(
                    "1/8D",
                    ConverterService.getDottedNoteMs(ms, 2),
                    "1/8T",
                    ConverterService.getTripletNoteMs(ms, 2),
                    textStyle,
                  ),
                  _buildQuadTableRow(
                    "1/16D",
                    ConverterService.getDottedNoteMs(ms, 4),
                    "1/16T",
                    ConverterService.getTripletNoteMs(ms, 4),
                    textStyle,
                  ),
                  _buildQuadTableRow(
                    "1/32D",
                    ConverterService.getDottedNoteMs(ms, 8),
                    "1/32T",
                    ConverterService.getTripletNoteMs(ms, 8),
                    textStyle,
                  ),
                  _buildQuadTableRow(
                    "1/64D",
                    ConverterService.getDottedNoteMs(ms, 16),
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
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          alignment: Alignment.center,
          child: Text(note, style: style),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          alignment: Alignment.center,
          child: Text(
            ms == 0.0 ? "- - -" : "${ms.toStringAsFixed(3)} ms",
            style: style.copyWith(
              color: ms == 0.0 ? Colors.grey.shade600 : style.color,
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildQuadTableRow(
    String dottedNote,
    double dottedMs,
    String tripletNote,
    double tripletMs,
    TextStyle style,
  ) {
    return TableRow(
      decoration: BoxDecoration(
        color: dottedMs == 0.0 ? Colors.grey.shade50 : null,
      ),
      children: [
        // Dotted 음표
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          alignment: Alignment.center,
          child: Text(dottedNote, style: style),
        ),
        // Dotted ms
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          alignment: Alignment.center,
          child: Text(
            dottedMs == 0.0 ? "- - -" : "${dottedMs.toStringAsFixed(3)} ms",
            style: style.copyWith(
              color: dottedMs == 0.0 ? Colors.grey.shade600 : style.color,
            ),
          ),
        ),
        // Triplet 음표
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          alignment: Alignment.center,
          child: Text(tripletNote, style: style),
        ),
        // Triplet ms
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          alignment: Alignment.center,
          child: Text(
            tripletMs == 0.0 ? "- - -" : "${tripletMs.toStringAsFixed(3)} ms",
            style: style.copyWith(
              color: tripletMs == 0.0 ? Colors.grey.shade600 : style.color,
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
