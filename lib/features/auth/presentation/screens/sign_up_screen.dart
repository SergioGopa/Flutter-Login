import 'package:eisty/features/auth/presentation/providers/auth_provider.dart';
import 'package:eisty/features/auth/presentation/providers/signup_form_provider.dart';
import 'package:eisty/features/auth/presentation/widgets/widgets.dart';
import 'package:eisty/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (!context.canPop()) return;
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Create account',
                    style: textStyles.titleLarge?.copyWith(color: Colors.white),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: size.height - 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child: const _SignupForm(),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class _SignupForm extends ConsumerWidget {
  const _SignupForm({super.key});

  void showSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorMessage)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final signupForm = ref.watch(signupFormProvider);

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
          Text(
            'New Account',
            style: textStyles.titleMedium,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextFormField(
            label: 'Full name',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => ref.read(signupFormProvider.notifier).onNameChanged(value),
            errorMessage: signupForm.isFormPosted ? signupForm.username.errorMessage:null,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => ref.read(signupFormProvider.notifier).onEmailChanged(value),
            errorMessage: signupForm.isFormPosted ? signupForm.email.errorMessage: null,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: (value) => ref.read(signupFormProvider.notifier).onPasswordChanged(value),
            errorMessage: signupForm.isFormPosted ? signupForm.password.errorMessage: null,
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            label: 'Repeat Password',
            obscureText: true,
            onChanged: (value) => ref.read(signupFormProvider.notifier).onPasswordChanged(value),
            errorMessage: signupForm.isFormPosted ? signupForm.password.errorMessage: null,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Create',
              buttonColor: Colors.black,
              onPressed: signupForm.isPosting
                  ? null
                  : ref.read(signupFormProvider.notifier).onFormSubmit,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Do you already have an account?'),
              TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      return context.pop();
                    }
                    context.go('/signin');
                  },
                  child: const Text('Sign In here!'))
            ],
          ),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
