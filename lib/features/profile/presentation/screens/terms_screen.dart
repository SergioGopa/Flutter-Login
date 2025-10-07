import 'package:eisty/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsScreen extends StatefulWidget {
  static const String name = 'terms-screen';
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
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
        body: termsText == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  termsText!, style: AppTextStyles.t2Regular ,
                ),
              ),
              )
              );
  }
}
