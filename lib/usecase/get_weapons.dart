import 'package:dartz/dartz.dart';

import 'package:l2helper_v2/data/failure.dart';
import 'package:l2helper_v2/domain/entities/weapon.dart';
import 'package:l2helper_v2/repositories/weapons_repository.dart';

class GetWeapons {
  final WeaponsRepository repository;

  GetWeapons(this.repository);

  Future<Either<Failure, List<Weapon>>> getWeapons() {
    return repository.getWeapons();
  }
}
