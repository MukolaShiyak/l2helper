import 'package:l2helper/repositories/sound_effect_repository.dart';

class SoundEffect {
  final SoundEffectRepository repository;

  SoundEffect(this.repository);

  Future<void> makeSound() async {
    await repository.play();
  }
}
