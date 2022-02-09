import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      height: size.height,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.menu,
            color: Colors.black,
          ),
          Text.rich(
            TextSpan(text: 'Location\n', children: [
              TextSpan(
                text: 'Cameron St., Boston',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 16),
              ),
            ]),
            textAlign: TextAlign.center,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/eu.jpg'),
          ),
        ],
      ),
    );
  }
}
