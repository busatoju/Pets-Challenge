import 'dart:convert';

class AnimalModel {
  final String name;
  final String breed;
  final String age;
  final String gender;
  final bool isFavorite;
  final String image;
  final int id;

  AnimalModel({
    required this.name,
    required this.breed,
    required this.age,
    required this.gender,
    required this.isFavorite,
    required this.image,
    required this.id,
  });

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      name: map['name'] ?? '',
      breed: map['breed'] ?? '',
      age: map['age'] ?? '',
      gender: map['gender'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      image: map['image'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'breed': breed,
      'age': age,
      'gender': gender,
      'isFavorite': isFavorite,
      'image': image,
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) => AnimalModel.fromMap(json.decode(source));
}
