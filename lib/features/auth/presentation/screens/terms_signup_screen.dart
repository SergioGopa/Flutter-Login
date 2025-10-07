import 'package:eisty/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
                     
class TermsSignupScreen extends StatefulWidget {
  static const String name = 'terms-signup';
  const TermsSignupScreen({super.key});

  @override
  State<TermsSignupScreen> createState() => _TermsSignupScreenState();
}

class _TermsSignupScreenState extends State<TermsSignupScreen> {
  String? termsText;

   @override
  void initState() {
    super.initState();
    _loadTerms();
  }

  Future<void> _loadTerms() async {
    final text = await rootBundle.loadString('assets/legal/terms_es.txt');
    setState(() {
      termsText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
        appBar: AppBar(
          title: const Text("Términos y Condiciones"),
        ),
        body: SingleChildScrollView(
          padding:  const EdgeInsets.all(16),
          child: termsText == null 
            ? const CircularProgressIndicator()
            : Text(termsText!, style: AppTextStyles.t2Regular ,),
        )
    );
  }
}


  