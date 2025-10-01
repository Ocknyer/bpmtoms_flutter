class ConverterService {
  /// BPM을 밀리초(ms)로 변환
  static double bpmToMs(double bpm) {
    return 60000 / bpm;
  }

  /// 밀리초(ms)를 BPM으로 변환
  static double msToBpm(double ms) {
    return 60000 / ms;
  }

  /// 기본 음표 길이에서 특정 분할 값의 ms 계산
  static double getNoteMs(double baseMs, int division) {
    return baseMs / division;
  }

  /// 점음표 ms 계산 (기본 음표 길이의 1.5배)
  static double getDottedNoteMs(double baseMs, int division) {
    return (baseMs / division) * 1.5;
  }
}
