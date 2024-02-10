import 'dart:convert' as cv;

import 'package:dio/dio.dart';

import 'package:l2helper/data/constants.dart';
import 'package:l2helper/data/exception.dart';
import 'package:l2helper/data/models/weapon_model.dart';

abstract class WeaponsApi {
  Future<List<WeaponModel>> getWeapons();
}

class WeaponsApiImpl implements WeaponsApi {
  final Dio dio;
  WeaponsApiImpl({required this.dio});

  @override
  Future<List<WeaponModel>> getWeapons() async {
    final response = await dio.get(Urls.weaponsApi);

    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      final listData = cv.jsonDecode(response.data) as List?;
      List<WeaponModel> data =
          listData?.map((weapon) => WeaponModel.fromJson(weapon)).toList() ??
              [];

      return data;
    } else {
      throw ServerException();
    }
  }
}
