import 'package:dartz/dartz.dart';

import 'package:l2helper_v2/data/failure.dart';
import 'package:l2helper_v2/domain/entities/weapon.dart';

abstract class WeaponsRepository {
  Future<Either<Failure, List<Weapon>>> getWeapons();
}
