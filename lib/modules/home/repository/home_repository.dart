import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pets_challenge/shared/models/animal_model.dart';

abstract class IHomeRepository {
  Future<List<AnimalModel>> getDogs();
  Future<List<AnimalModel>> getCats();
  Future<List<AnimalModel>> getBirds();
}

const String _dogDb = 'lib/shared/database/dogs.json';
const String _catDb = 'lib/shared/database/cats.json';
const String _birdDb = 'lib/shared/database/birds.json';

class HomeRepository implements IHomeRepository {
  @override
  Future<List<AnimalModel>> getDogs() async {
    final response = await rootBundle.loadString(_dogDb);
    final json = jsonDecode(response) as List;

    return json.map((e) => AnimalModel.fromMap(e)).toList();
  }

  @override
  Future<List<AnimalModel>> getCats() async {
    final response = await rootBundle.loadString(_catDb);
    final json = jsonDecode(response) as List;
    return json.map((e) => AnimalModel.fromMap(e)).toList();
  }

  @override
  Future<List<AnimalModel>> getBirds() async {
    final response = await rootBundle.loadString(_birdDb);
    final json = jsonDecode(response) as List;
    return json.map((e) => AnimalModel.fromMap(e)).toList();
  }

  //TODO: Implementar Update
}
