import 'package:dartz/dartz.dart';

import 'package:l2helper/data/failure.dart';
import 'package:l2helper/domain/entities/weapon.dart';
import 'package:l2helper/repositories/weapons_repository.dart';

class GetWeapons {
  final WeaponsRepository repository;

  GetWeapons(this.repository);

  Future<Either<Failure, List<Weapon>>> getWeapons() {
    return repository.getWeapons();
  }
}
