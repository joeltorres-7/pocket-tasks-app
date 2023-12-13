import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/components/checkbox_item.dart';
import 'package:pocket_tasks/views/components/option_item.dart';
import 'package:pocket_tasks/views/styles/spaces.dart';
import 'package:pocket_tasks/views/styles/text_styles.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true, // This will make the app bar fixed at the top
            centerTitle: true,
            elevation: 4, // Set the elevation to control the shadow
            shadowColor: Colors.grey[100]!,
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0.4,
            title: Text(
              "Settings",
              style: AppTextStyles.headingNav,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // Items
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text("Notificaciones", textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              CheckboxItem(
                label: 'Recordatorio de tareas',
                description: 'Avisarme cuando tenga tareas pendientes.',
                onSelection: () {},
                preferenceKey: 'enableTaskReminders', // Unique key for SharedPreferences
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text("Experiencia", textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              CheckboxItem(
                label: 'Efectos de sonido',
                description: 'Habilita efectos de sonido en ocasiones especiales.',
                onSelection: (){},
                preferenceKey: 'enableSounds',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text("Temas", textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              OptionItem(label: 'Color de tema', description: 'Selecciona un color de preferencia para tu interfaz.', isClickable: true, onTap: (){}),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text("Acerca de PocketTasks", textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              OptionItem(label: 'Versión', description: '1.0.0 - Amanecer', isClickable: false, onTap: (){}),
              OptionItem(label: 'Términos y Condiciones', description: 'Las reglas del juego. ¡Dales un vistazo!', isClickable: true, onTap: (){}),
              OptionItem(label: 'Política de Privacidad', description: 'Cómo cuidamos tus datos.', isClickable: true, onTap: (){}),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 24.0, bottom: 4.0, left: 24.0),
                child: Text("Otros", textAlign: TextAlign.start, style: AppTextStyles.smallLabel),
              ),
              OptionItem(label: 'Eliminar mi cuenta', description: 'Fue un lindo viaje :)', isClickable: true, onTap: (){}),
              VerticalSpacing(16.0)
            ]),
          ),
        ],
      ),
    );
  }
}
