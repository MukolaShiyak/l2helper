import 'package:dartz/dartz.dart';

import 'package:l2helper/data/failure.dart';
import 'package:l2helper/domain/entities/weapon.dart';

abstract class WeaponsRepository {
  Future<Either<Failure, List<Weapon>>> getWeapons();
}
