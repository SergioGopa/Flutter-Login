import 'package:dio/io.dart';
import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: send message to backend or email service
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Mensaje enviado. ¡Gracias por tu feedback!"),
        backgroundColor: Colors.green,
      ));
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Describe tu problema",
                border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor escribe tu mensaje";
                }
                return null;
              },
            ),
            const SizedBox(height: 15,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm, 
                child: const Text('Enviar')
                ),
            )
          ],
        ));
  }
}
