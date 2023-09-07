import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/colors.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class EmptyQueue extends StatefulWidget {
  const EmptyQueue({super.key});

  @override
  State<EmptyQueue> createState() => _EmptyQueueState();
}

class _EmptyQueueState extends State<EmptyQueue> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth - (screenWidth * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.task_alt_rounded, size: 40.0, color: AppColors.primaryGray),
          VerticalSpacing(16.0),
          Text('No hay tareas para mostrar',
              style: AppTextStyles.heading1,
              textAlign: TextAlign.center
          ),
          Text(
            'Presiona el botón con el icono de más para agregar una tarea',
            style: AppTextStyles.subheading1,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
