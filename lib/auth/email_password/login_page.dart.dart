import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        title: const Text('Login de Usuário'),
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
                onPressed: loginUser,
                child: const Text(
                  'Login',
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/auth/email_password/register');
                },
                child: const Text("Não tem cadastro?"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailnEC.text, password: _senhaEC.text);

    final user = credential.user;
    String message = '';
    //se email não verificado email não verificado
    if (user != null && !user.emailVerified) {
      message = "Valide seu e-mail de acesso";
    } else {
      message = "Email validado com sucesso";
    }

    //UPDATE de usuário e senha
    await user?.updateDisplayName("CACO");
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

    // print("Mais METADATA: ${credential.user}");
    print("Nome cadastrado: ${credential.user?.displayName}");
    print("E-mail: ${credential.user?.email}");
    print("verificação de e-mail:  ${credential.user?.emailVerified}");
    // print("Data de criação da conta e Data do último acesso: ${credential.user?.metadata}");
  }
}
