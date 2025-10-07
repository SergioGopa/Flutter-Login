import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/auth/auth.dart';
import 'package:eisty/features/auth/presentation/providers/auth_provider.dart';
import 'package:eisty/features/auth/presentation/providers/signup_form_provider.dart';
import 'package:eisty/features/auth/presentation/widgets/widgets.dart';
import 'package:eisty/features/profile/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GeometricalBackground(
            child: SingleChildScrollView(
          child: Column(
            children: [
              
              
              Container(
                    height: size.height-300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.rosaPrimario,
                      borderRadius:
                          const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                            ),
                    ),
                    child: const _SignupForm(),
                  ),
              const SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(
                  "assets/brand/Sazan_logo_2.svg",
                  width: 170,
                  height: 170,
                ),
                const SizedBox(
                  height: 60,
                ),
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
          Text('Bienvenid@', style: AppTextStyles.h2SemiBold.copyWith(color: AppColors.blancoSazan),),
          const SizedBox(height: 5,),
          Text(
            'Inicia Sesión',
            style: AppTextStyles.h1Bold.copyWith(color: AppColors.blancoSazan),
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Nombre completo',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => ref.read(signupFormProvider.notifier).onNameChanged(value),
            errorMessage: signupForm.isFormPosted ? signupForm.username.errorMessage:null,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => ref.read(signupFormProvider.notifier).onEmailChanged(value),
            errorMessage: signupForm.isFormPosted ? signupForm.email.errorMessage: null,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Contrasena',
            obscureText: true,
            onChanged: (value) => ref.read(signupFormProvider.notifier).onPasswordChanged(value),
            errorMessage: signupForm.isFormPosted ? signupForm.password.errorMessage: null,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Confirma contrasena',
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.casiNegro,
                foregroundColor: AppColors.blancoSazan,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                  )
              ),
              onPressed: signupForm.isPosting
                  ? null
                  : ref.read(signupFormProvider.notifier).onFormSubmit, 
              child: Text('Regístrate',style: TextStyle(color: AppColors.blancoSazan))
              ),  
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Al unirte aceptas'),
              TextButton(
                  onPressed: () {
                    context.push('/terms-signup');
                  },
                  child: Text('Términos y condiciones', 
                  style: AppTextStyles.t1Bold.copyWith(
                    color: AppColors.blancoSazan, 
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    )))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Ya tienes cuenta?'),
              TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      return context.pop();
                    }
                    context.go('/signin');
                  },
                  child: Text('Inicia sesión', style: AppTextStyles.t1Bold.copyWith(color: AppColors.blancoSazan, fontWeight: FontWeight.bold)))
            ],
          ),
          const SizedBox(height: 5),
          Text('o inicia sesión con:', style: AppTextStyles.t2Regular.copyWith(color: AppColors.blancoSazan),),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  
                }, 
                icon: Icon(Icons.g_mobiledata, size: 40,color: AppColors.casiNegro,)),
              const SizedBox(width: 20,),
              IconButton(onPressed: () {
                
              }, 
              icon: Icon(Icons.apple, size: 40, color: AppColors.casiNegro,))
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
