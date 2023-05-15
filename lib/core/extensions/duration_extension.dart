extension DurationExtension on int {
  String get fromSecondsToMinutesString {
    int minutes = (this / 60).floor();

    int seconds = this % 60;

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
