import 'dart:io';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:l2helper/repositories/sound_effect_repository.dart';

class SoundEffectRepositoryImpl implements SoundEffectRepository {
  File? _sound;
  final FlutterSoundPlayer _player = FlutterSoundPlayer();

  @override
  Future<void> play() async {
    if (!_player.isOpen()) {
      await _player.openPlayer();
    }

    try {
      if (_sound == null) {
        final byteData = await rootBundle.load('sounds/soul_shot.mp3');
        _sound = File('${(await getTemporaryDirectory()).path}/soul_shot.mp3');
        await _sound?.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
      }

      await _player.startPlayer(
          fromURI: _sound!.path,
          codec: Codec.mp3,
          whenFinished: () {
            print("Finished playing");
          });
    } catch (e) {
      print(e);
    }
  }
}
