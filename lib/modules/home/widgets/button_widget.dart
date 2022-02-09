import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String icon;
  final bool isSelected;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: isSelected ? const Color(0xFFD44932) : Colors.white,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
