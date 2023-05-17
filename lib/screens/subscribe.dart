import 'package:app_pesquisa_furb/main.dart';
import 'package:flutter/material.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

void _submit() {
  navigatorKey.currentState!.pushNamed("/question");
}

class _SubscribePageState extends State<SubscribePage> {
  final _formKey = GlobalKey<FormState>();
  final _tName = TextEditingController();
  final _tAddress = TextEditingController();
  final _tInstitution = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _tName,
                decoration: const InputDecoration(
                  labelText: 'Nome completo*',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: _tAddress,
                decoration: const InputDecoration(
                  labelText: 'Endereço*',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _tInstitution,
                decoration: const InputDecoration(
                  labelText: 'Instituição',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              const Center(
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Icon(Icons.arrow_right),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
