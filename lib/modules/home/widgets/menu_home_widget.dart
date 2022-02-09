import 'package:flutter/material.dart';
import 'button_widget.dart';

class MenuHomeWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const MenuHomeWidget({
    Key? key,
    required this.currentIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          //TODO: Criar lista modelo e usar futureBuilder
          Container(
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.reorder,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 16),
          ButtonWidget(
            isSelected: 0 == currentIndex,
            onPressed: () => onChanged(0),
            title: 'Dogs',
            icon: 'assets/icons/dog.svg',
          ),
          const SizedBox(width: 16),
          ButtonWidget(
            isSelected: 1 == currentIndex,
            onPressed: () => onChanged(1),
            title: 'Cats',
            icon: 'assets/icons/cat.svg',
          ),
          const SizedBox(width: 16),
          ButtonWidget(
            isSelected: 2 == currentIndex,
            onPressed: () => onChanged(2),
            title: 'Birds',
            icon: 'assets/icons/bird.svg',
          ),
        ],
      ),
    );
  }
}
