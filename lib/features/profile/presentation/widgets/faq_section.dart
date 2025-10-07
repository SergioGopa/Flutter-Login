import 'package:flutter/material.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  final List<Map<String, String>> faqs = const [
    {
      "q": "¿Cómo guardo una promoción?",
      "a": "Presiona el ícono de corazón en la tarjeta de la promo."
    },
    {
      "q": "¿Necesito cuenta para usar la app?",
      "a": "Puedes explorar promos sin cuenta, pero para guardarlas necesitas iniciar sesión."
    },
    {
      "q": "¿Cómo contacto soporte?",
      "a": "Usa el formulario aquí abajo o escríbenos a soporte@sazan.mx."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      children: faqs.map((faq) => ExpansionPanelRadio(
        value: faq['q']!,
        headerBuilder: (context, isExpanded) => ListTile(
          title: Text(faq['q']!, style: TextStyle(fontWeight: FontWeight.bold),),
        ), 
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(faq['a']!),
          ))
        ,).toList(),
    );
  }
}
