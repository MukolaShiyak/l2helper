import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import 'package:l2helper_v2/data/failure.dart';
import 'package:l2helper_v2/data/exception.dart';
import 'package:l2helper_v2/domain/entities/weapon.dart';
import 'package:l2helper_v2/data/datasource/weapons_api.dart';
import 'package:l2helper_v2/repositories/weapons_repository.dart';

class WeaponsRepositoryImpl implements WeaponsRepository {
  final WeaponsApi weaponsApi;

  WeaponsRepositoryImpl({required this.weaponsApi});

  @override
  Future<Either<Failure, List<Weapon>>> getWeapons() async {
    try {
      final result = await weaponsApi.getWeapons();

      return Right(result.map((weap) => weap.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server error'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (error) {
      final message = error.response?.data['message'] as String;
      return Left(BadRequestFailure(message));
    }
  }
}
