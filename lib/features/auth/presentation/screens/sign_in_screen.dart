import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/auth/presentation/providers/providers.dart';
import 'package:eisty/features/auth/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    

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
                  height: 100,
                ),
                SvgPicture.asset(
                  "assets/brand/Sazan_logo_2.svg",
                  width: 170,
                  height: 170,
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  // color: AppColors.amarillo4,
                  height: size.height - 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.blancoSazan,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          )),
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
    final signinForm = ref.watch(signinFormProvider);
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text('Bienvenid@', style: AppTextStyles.h2SemiBold.copyWith(color: AppColors.casiNegro),),
          const SizedBox(height: 5,),
          Text(
            'Inicia Sesión',
            style: AppTextStyles.h1Bold.copyWith(color: AppColors.rosaPrimario),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixicon: Icons.email_rounded,
            // fillColor: Colors.white,
            onChanged: (value) =>
                ref.read(signinFormProvider.notifier).onEmailChanged(value),
            errorMessage:
                signinForm.isFormPosted ? signinForm.email.errorMessage : null,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Password',
            prefixicon: Icons.lock,
            obscureText: true,
            // fillColor: AppColors.blancoSazan,
            onChanged: (value) =>
                ref.read(signinFormProvider.notifier).onPasswordChanged(value),
            errorMessage: signinForm.isFormPosted
                ? signinForm.password.errorMessage
                : null,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.casiNegro,
                foregroundColor: AppColors.blancoSazan,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                  )
              ),
              onPressed: signinForm.isPosting
                  ? null
                  : ref.read(signinFormProvider.notifier).onFormSubmit, 
              child: Text('Iniciar Sesión',style: TextStyle(color: AppColors.blancoSazan))
              )
            
          ),
          const SizedBox(height: 40),
          Text('o inicia sesión con:', style: AppTextStyles.t2Regular.copyWith(color: AppColors.rosaPrimario),),
          const SizedBox(height: 10),
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
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("¿No tienes cuenta?", style: AppTextStyles.t2Regular.copyWith(color: AppColors.rosaPrimario),),
              TextButton(
                  onPressed: () {
                    context.push('/signup');
                  },
                  child: Text("Regístrate", style: AppTextStyles.t2Regular.copyWith(
                    color: AppColors.rosaPrimario, 
                    fontWeight: FontWeight.bold, 
                    decoration: TextDecoration.underline,
                    fontSize: 16
                    ),))
            ],
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
