import 'package:eisty/features/auth/presentation/providers/auth_provider.dart';
import 'package:eisty/features/auth/presentation/providers/providers.dart';
import 'package:eisty/features/auth/presentation/widgets/widgets.dart';
import 'package:eisty/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final textStyles = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GeometricalBackground(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Icon(
                  Icons.production_quantity_limits_rounded,
                  color: Colors.white,
                  size: 100,
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  height: size.height - 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100))),
                  child: _SigninForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SigninForm extends ConsumerWidget {
  const _SigninForm({
    super.key,
  });

  void showSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage))
    );

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final signinForm = ref.watch(SigninFormProvider);
    ref.listen(
      authProvider,
      (previous, next) {
        if (next.errorMessage.isEmpty) return;
        showSnackBar(context, next.errorMessage);
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Sign In',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email_rounded,
            onChanged: (value) =>
                ref.read(SigninFormProvider.notifier).onEmailChanged(value),
            errorMessage:
                signinForm.isFormPosted ? signinForm.email.errorMessage : null,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Password',
            icon: Icons.lock,
            obscureText: true,
            onChanged: (value) =>
                ref.read(SigninFormProvider.notifier).onPasswordChanged(value),
            errorMessage: signinForm.isFormPosted
                ? signinForm.password.errorMessage
                : null,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Sign In',
              buttonColor: Colors.black,
              onPressed: signinForm.isPosting
                  ? null
                  : ref.read(SigninFormProvider.notifier).onFormSubmit
              ,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Text("don't have account?"),
              TextButton(
                  onPressed: () {
                    context.push('/signup');
                  },
                  child: const Text('Create here!'))
            ],
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
