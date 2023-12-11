import 'package:flutter/material.dart';

class AccessibleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const AccessibleIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0)
        ),
        child: IconButton(
            onPressed: (){},
            icon: Icon(
              icon,
              color: Colors.black,
              size: 24.0,
            )),
      ),
    );
  }
}
