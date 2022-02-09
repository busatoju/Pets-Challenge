import 'package:flutter/cupertino.dart';
import 'package:pets_challenge/modules/home/repository/home_repository.dart';
import 'package:pets_challenge/shared/models/animal_model.dart';

class HomeController extends ChangeNotifier {
  final IHomeRepository repository = HomeRepository();
  int _currentIndex = 0;
  bool _isFavorite = false;

  set setCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;

  void setIsFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  Future<List<AnimalModel>> getDogs() async {
    return await repository.getDogs();
  }

  Future<List<dynamic>> get() async {
    if (_currentIndex == 0) {
      return await repository.getDogs();
    } else if (_currentIndex == 1) {
      return await repository.getCats();
    } else {
      return await repository.getBirds();
    }
  }
}
//TODO: Fazer apenas uma busca no repository