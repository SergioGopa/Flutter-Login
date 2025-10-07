import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/profile/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferencesScreen extends ConsumerWidget {
  static const String name = 'preferences-screen';
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider.notifier);
    final themeData = ref.watch(themeNotifierProvider);

    final isDarkMode = themeData.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apriencia"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //Dark mode Toggle
          Text('Theme', style: AppTextStyles.h2SemiBold),
          SwitchListTile(
            title: Text("Modo oscuro",style: AppTextStyles.t1Regular),
            subtitle: Text("Cambia entre modo obscuro y modo de brillo",style: AppTextStyles.t4Regular),
            value: isDarkMode,
            onChanged: (value) => themeNotifier.toggleDarkMode(),
            secondary: Icon(isDarkMode? Icons.dark_mode:Icons.light_mode),
            ),
          const Divider(),
          const SizedBox(height: 10,),
          Text("Font Size", style: AppTextStyles.h2SemiBold),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChoiceChip(label: const Text("Small"), selected: false),
              ChoiceChip(label: const Text("Medium"), selected: true),
              ChoiceChip(label: const Text("Large"), selected: false),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),
          Text('Preview', style: AppTextStyles.h2SemiBold,),
          const SizedBox(height: 15,),
          Card(
            child: ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text("Promocion del dia"),
              subtitle: const Text('50% de descuento en Sazan'),
              trailing: ElevatedButton(
                onPressed: () {
                  
                }, 
                child: const Text('Visualizar', style: TextStyle(color: AppColors.blancoSazan),)
                ),
            ),
          )

          
          // Wrap(
          //   spacing: 12,
          //   children: [
          //     fon
          //   ],
          // )
        ],
      ),
    );
  }
}
