// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:app_pesquisa_furb/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  var load = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            //heigth: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset('assets/imagens/idososLogin.png',
                fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 0,
            left: 2,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Color.fromRGBO(48, 103, 184, 1),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    const Text(
                      'DIAGNÓSTICO PARA IDOSO',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Futura',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _tLogin,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 210, 210, 210),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            controller: _tSenha,
                            decoration: const InputDecoration(
                                //icon: Icon(
                                //Icons.lock,
                                //color: Colors.grey,
                                filled: true,
                                fillColor: Color.fromARGB(255, 210, 210, 210),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                ),
                                labelText: 'Senha',
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                )),
                          ),
                          load
                              ? const Text("Carregando...")
                              : ElevatedButton(
                                  onPressed: _submit,
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: Colors.amber,
                                  ),
                                  child: const Text('Entrar',
                                      style: TextStyle(fontSize: 18)), //style
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(height: 20),
          // Container(
          //   child: Image.asset('assets/imagens/logo-furb.png',
          //       width: 20, height: 20, alignment: Alignment.center),
          // )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    this.load = true;
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: login, password: senha);
      print(credential);
      navigatorKey.currentState!.pushNamed("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
