import 'package:flutter/material.dart';

class ItemChip extends StatefulWidget {
  const ItemChip({super.key});

  @override
  State<ItemChip> createState() => _ItemChipState();
}

class _ItemChipState extends State<ItemChip> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0, left: 16.0),
          child: Row(
            children: [
              Text('Read a book for about 1 hour'),
              Icon(Icons.add)
            ],
          ),
        ),
    );
  }
}
