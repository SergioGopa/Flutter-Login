import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/auth/auth.dart';
import 'package:eisty/features/profile/presentation/providers/providers.dart';
import 'package:eisty/features/shared/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreen extends ConsumerWidget {
  static const String name = 'account-screen';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountProvider);
    final accountNotifier = ref.read(accountProvider.notifier);
    final authState = ref.watch(authProvider);

    final user = accountState.user ?? authState.user;

    ref.listen<AccountState>(
      accountProvider,
      (previous, next) {
        if (next.successMessage != null && next.successMessage!.isNotEmpty && next.successMessage != previous?.successMessage) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(next.successMessage!),
            backgroundColor: AppColors.verde300,
          ));
          ref.read(accountProvider.notifier).clearMessage();
        }
        if (next.passwordErrorMessage != null &&
            next.passwordErrorMessage!.isNotEmpty && next.passwordErrorMessage != previous?.passwordErrorMessage) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(next.passwordErrorMessage!),
            backgroundColor: AppColors.rojoError,
          ));
          ref.read(accountProvider.notifier).clearMessage();
        }
      },
    );

    if (accountState.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (user == null) {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                final userId = authState.user?.id;
                if (userId != null) {
                  accountNotifier.loadUser(userId);
                }
              },
              child: const Text("Load User")),
        ),
      );
    }

    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Mi Cuenta"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //Avatar + Name:
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: const Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              //User Info Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Information de perfil',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: nameController,
                label: 'Nombre',
                prefixicon: Icons.person,
                keyboardType: TextInputType.text,
                onChanged: (value) => nameController.text = value,
                errorMessage: accountState.errorMessage,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: emailController,
                label: 'Correo Electronico',
                prefixicon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => emailController.text = value,
                errorMessage: accountState.errorMessage,
              ),
              const SizedBox(
                height: 25,
              ),

              ElevatedButton(
                  onPressed: () {
                    _confirmupdate(
                      context,
                      () {
                        final updatedUser = User(
                            id: user.id,
                            email: emailController.text,
                            name: nameController.text,
                            role: user.role,
                            online: user.online);
                        accountNotifier.updateUser(updatedUser);
                      },
                    );
                  },
                  child: const Text("Guardar cambios", style: TextStyle(color: AppColors.blancoSazan), )),
              if (accountState.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    accountState.errorMessage!,
                    style: const TextStyle(color: AppColors.rojoError),
                  ),
                ),

              const Divider(
                color: AppColors.amarilloAcento,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),

              //Password Change Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cambiar Contraseña ',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              CustomTextFormField(
                controller: currentPasswordController,
                label: 'Contraseña actual',
                prefixicon: Icons.lock,
                obscureText: true,
                // onChanged: (value) => currentPasswordController.text = value,
                // errorMessage: accountState.errorMessage,
              ),
              const SizedBox(
                height: 10,
              ),

              CustomTextFormField(
                controller: newPasswordController,
                label: 'Nueva contraseña',
                prefixicon: Icons.lock_outline,
                obscureText: true,
                // onChanged: (value) => newPasswordController.text = value,
                // errorMessage: accountState.errorMessage,
              ),
              const SizedBox(
                height: 10,
              ),

              CustomTextFormField(
                controller: confirmPasswordController,
                label: 'Confirmar nueva contraseña',
                prefixicon: Icons.lock_reset,
                obscureText: true,
                // onChanged: (value) => confirmPasswordController.text = value,
                // errorMessage: accountState.errorMessage,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.rojoError,
                  ),
                  onPressed: () {
                    if (newPasswordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Las contraseñas no coinciden')));
                      return;
                    }
                    _confirmupdate(
                      context,
                      () {
                        accountNotifier.changePassword(
                            user.id,
                            currentPasswordController.text,
                            newPasswordController.text);
                      },
                    );
                  },
                  child: const Text(
                    'Cambiar contraseña',
                    style: TextStyle(color: AppColors.blancoSazan),
                  )),
                  // child: const Text("Guardar cambios", style: TextStyle(color: AppColors.blancoSazan), )),
            ],
          ),
        ));
  }

  Future<void> _confirmupdate(
      BuildContext context, VoidCallback onConfirm) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar cambios'),
        content: const Text('¿Estás seguro que deseas continuar?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar', style: TextStyle(fontSize: 18),)),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirmar', style: TextStyle(color: AppColors.blancoSazan),),
          )
        ],
      ),
    );
    if (result == true) onConfirm();
  }
}
