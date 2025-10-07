import 'package:eisty/features/auth/auth.dart';
import 'package:eisty/features/profile/presentation/providers/providers.dart';
import 'package:eisty/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupportScreen extends ConsumerWidget {
  static const String name = 'support-screen';
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportState = ref.watch(supportProvider);
    final supportNotifier = ref.read(supportProvider.notifier);

    final subjectController = TextEditingController();
    final messageController = TextEditingController();

    final authState = ref.watch(authProvider);
    final userId = authState.user?.id ?? "";

    ref.listen<SupportState>(
      supportProvider,
      (previous, next) {
        if (next.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.successMessage!),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (next.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Soporte'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
                icon: Icons.help_outline,
                title: "Preguntas Frecuentes",
                color: colors.primary),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: FaqSection(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SectionHeader(
                icon: Icons.report_problem,
                title: "Reportar un Problema",
                color: Colors.redAccent),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: subjectController,
              label: 'Asunto',
              prefixicon: Icons.subject,
              keyboardType: TextInputType.text,
              fillColor: Colors.grey[700],
              
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: messageController,
              label: 'Mensaje',
              prefixicon: Icons.message,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 7,
              fillColor: Colors.grey[700],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  onPressed: supportState.isLoading
                      ? null
                      : () {
                          supportNotifier.sendMessage(
                              userId: userId,
                              subject: subjectController.text,
                              message: messageController.text);
                        },
                  child: supportState.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Enviar Mensaje", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const SectionHeader(
      {super.key,
      required this.icon,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
