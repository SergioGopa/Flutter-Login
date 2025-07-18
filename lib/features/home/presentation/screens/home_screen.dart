import 'package:eisty/features/auth/presentation/providers/auth_provider.dart';
import 'package:eisty/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  final Widget child;
  const HomeScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('data'),
      //   actions: [
      //     IconButton(
      //         onPressed: () async {
      //           ref.read(authProvider.notifier).logout();
      //         },
      //         icon: Icon(Icons.exit_to_app))
      //   ],
      // ),
      body: child,
      bottomNavigationBar: CustomBottomNavbar(),
    );
  }
}
