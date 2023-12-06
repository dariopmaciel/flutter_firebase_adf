import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: const Text("Login do Usuário"),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context)
            //         .pushNamed('/auth/email_password/register');
            //   },
            //   child: const Text("Register User E-mail Password"),
            // ),
          ],
        ),
      ),
    );
  }
}