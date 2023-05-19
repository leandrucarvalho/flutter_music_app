// teste unitário

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music_app/core/erros/exceptions.dart';
import 'package:flutter_music_app/core/services/audio_service/audio_player_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {}

void main() {
  late MockAudioPlayer mockAudioPlayer;
  late AudioPlayerServiceImpl audioPlayerService;

  setUp(
    () {
      mockAudioPlayer = MockAudioPlayer();
      audioPlayerService = AudioPlayerServiceImpl(mockAudioPlayer);
    },
  );

  test(
    'should get current music position',
    () async {
      when(() => mockAudioPlayer.getCurrentPosition()).thenAnswer(
        (_) => Future.value(
          const Duration(seconds: 10),
        ),
      );
      final position = await audioPlayerService.getCurrentPosition;

      verify(() => mockAudioPlayer.getCurrentPosition()).called(1);
      expect(position, equals(10));
    },
  );

  test(
    'should get audio complete stream',
    () {
      final mockStreamCtrl = StreamController<Duration>();

      when(() => mockAudioPlayer.onPositionChanged)
          .thenAnswer((_) => mockStreamCtrl.stream);

      final positionStream = audioPlayerService.getPositionStream();

      verify(() => mockAudioPlayer.onPositionChanged).called(1);

      expect(positionStream, equals(mockStreamCtrl.stream));
    },
  );

  group(
    'Pause Music',
    () {
      test(
        'should successfully pause music',
        () async {
          when(() => mockAudioPlayer.pause()).thenAnswer((_) => Future.value());

          await audioPlayerService.pauseMusic();

          verify(() => mockAudioPlayer.pause()).called(1);
        },
      );

      test(
        'should fail on pause music',
        () {
          when(() => mockAudioPlayer.pause()).thenThrow(Exception());

          final futurePause = audioPlayerService.pauseMusic();

          verify(() => mockAudioPlayer.pause()).called(1);
          expect(futurePause, throwsA(isA<AudioPlayerException>()));
        },
      );
    },
  );
}
