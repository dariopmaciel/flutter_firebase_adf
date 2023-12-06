import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//
//Escuta as aterações DE ESTADO dentro do firebase
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      print("Usuário logado? ${user != null}");
    });
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/auth/email_password/login');
                },
                child: const Text("Login do Usuário")),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/auth/show_user");
              },
              child: const Text("Mostre usuário logado"),
            ),
          ],
        ),
      ),
    );
  }
}
