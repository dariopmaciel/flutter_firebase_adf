import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailnEC = TextEditingController();
  final _senhaEC = TextEditingController();

  @override
  void dispose() {
    _emailnEC.dispose();
    _senhaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _emailnEC,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
              ),
              TextField(
                controller: _senhaEC,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: registerUser,
                child: const Text(
                  'Cadastrar Usuário',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailnEC.text, password: _senhaEC.text);

    credential.user?.sendEmailVerification();
  }
}
