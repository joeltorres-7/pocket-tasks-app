import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';

class MethodBox extends StatefulWidget {
  final String itemName;
  final String itemDescription;
  final IconData itemIcon;
  final VoidCallback onTap;
  final bool isSelected;

  const MethodBox({
    super.key,
    required this.itemName,
    required this.itemIcon,
    required this.onTap,
    required this.isSelected,
    required this.itemDescription,
  });

  @override
  _MethodBoxState createState() => _MethodBoxState();
}

class _MethodBoxState extends State<MethodBox> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200), // Adjust the duration as needed
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.isSelected ? Theme.of(context).colorScheme.outline : Theme.of(context).colorScheme.outlineVariant,
            width: 1.0,
          ),
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: widget.isSelected
              ? [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              offset: Offset(0, 8),
              blurRadius: 24.0,
            ),
          ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                  widget.itemIcon,
                  size: 24.0,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              HorizontalSpacing(16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemName,
                    style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: screenWidth * 0.64,
                    child: Text(
                      widget.itemDescription,
                      style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
