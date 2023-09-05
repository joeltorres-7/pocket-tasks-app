import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';

class GoalBox extends StatefulWidget {
  final String itemName;
  final IconData itemIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const GoalBox({
    required this.itemName,
    required this.itemIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _GoalBoxState createState() => _GoalBoxState();
}

class _GoalBoxState extends State<GoalBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: 140.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.isSelected ? Colors.black : Colors.black12,
              width: 1.0,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: widget.isSelected
                ? [
                    const BoxShadow(
                      color: Color.fromRGBO(149, 157, 165, 0.2),
                      offset: Offset(0, 8),
                      blurRadius: 24.0,
                    ),
                  ]
                : [],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Flexible(
              child: Column(
                children: [
                  Icon(widget.itemIcon, size: 40.0),
                  VerticalSpacing(8.0),
                  SizedBox(
                    width: 100.0,
                    child: Text(
                      widget.itemName,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
