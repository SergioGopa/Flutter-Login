import 'package:eisty/config/router/app_router_notifier.dart';
import 'package:eisty/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        actions: [
          IconButton(
              onPressed: () async {
                // //TODO: Delete below line, just for debugging purposes
                // await Future.delayed(const Duration(milliseconds: 500));

                ref.read(authProvider.notifier).logout();

                // //TODO: Delete below line, just for debugging purposes
                // await ref.read(goRouterNotifierProvider).clearOnboarding();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
