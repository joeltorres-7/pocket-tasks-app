import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';

class MethodBox extends StatefulWidget {
  final String itemName;
  final String itemDescription;
  final IconData itemIcon;
  final VoidCallback onTap;
  final bool isSelected;

  const MethodBox({
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
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200), // Adjust the duration as needed
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(widget.itemIcon, size: 24.0),
              HorizontalSpacing(16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemName,
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 270.0,
                    child: Text(
                      widget.itemDescription,
                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
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
