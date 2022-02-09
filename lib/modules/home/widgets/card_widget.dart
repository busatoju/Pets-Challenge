import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final bool isFavorite;
  final String name;
  final String age;
  final String image;
  final String gender;
  final String breed;
  final VoidCallback onFavorite;
  const CardWidget({
    Key? key,
    required this.isFavorite,
    required this.name,
    required this.age,
    required this.image,
    required this.gender,
    required this.breed,
    required this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              height: 120,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    breed,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    '$gender, $age',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: const [
                      Icon(
                        Icons.pin_drop,
                        color: Colors.red,
                      ),
                      Text(
                        '2,6 kms away',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 12),
              child: InkWell(
                onTap: onFavorite,
                child: isFavorite
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border),
              ),
            )
          ],
        ));
  }
}
