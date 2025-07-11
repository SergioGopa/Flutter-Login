import 'package:eisty/config/router/app_router_notifier.dart';
import 'package:eisty/features/shared/providers/key_value_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
                onPressed: () async {
                  
                  await ref
                      .read(goRouterNotifierProvider)
                      .setOnboardingCompleted(true);

                  context.go('/signin');
                },
                icon: Icon(Icons.skip_next))
          ],
        ),
      ),
    );
  }
}
