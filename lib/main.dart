import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/email_password/login_page.dart.dart';
import 'package:flutter_firebase/auth/email_password/register_page.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:flutter_firebase/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Colors.blue,
        // primarySwatch: Colors.blue,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
        appBarTheme: const AppBarTheme(
          // color: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      initialRoute: '/home_page',
      routes: {
        '/home_page' : (_) => const HomePage(),
        '/auth/email_password/register': (_) => const RegisterPage(),
        '/auth/email_password/login': (_) => const LoginPage(),
      },
      // home: const MyHomePage(title: 'Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/auth/email_password/login');
//               },
//               child: const Text("Login do Usuário"),
//             ),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     Navigator.of(context)
//             //         .pushNamed('/auth/email_password/register');
//             //   },
//             //   child: const Text("Register User E-mail Password"),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
