import 'package:eisty/features/profile/profile.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem {
  final String title;
  final String? subtitle;
  final String routeName;
  final IconData icon;

  ProfileMenuItem(
      {required this.title,
      this.subtitle,
      required this.routeName,
      required this.icon});
}

final profileMenuItems = <ProfileMenuItem>[
  ProfileMenuItem(
    title: 'Mi cuenta',
    routeName: AccountScreen.name,
    icon: Icons.settings,
    ),

  ProfileMenuItem(
    title: 'Notificationes',
    routeName: NotificationsScreen.name,
    icon: Icons.notifications_outlined,
    ),

  ProfileMenuItem(
    title: 'Mis promos guardadas',
    routeName: SavedPromosScreen.name,
    icon: Icons.favorite_border,
    ),

  ProfileMenuItem(
    title: 'Soporte',
    routeName: SupportScreen.name,
    icon: Icons.help_outline_outlined,
    ),

  ProfileMenuItem(
    title: 'Terminos y condiciones',
    routeName: TermsScreen.name,
    icon: Icons.description_outlined,
    ),

  ProfileMenuItem(
    title: 'Apariencia',
    routeName: PreferencesScreen.name,
    icon: Icons.color_lens_outlined,
    ),

  ProfileMenuItem(
    title: 'Cerrar sesion',
    routeName: '/logout',
    icon: Icons.logout,
    ),

];
