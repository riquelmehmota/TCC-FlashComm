import 'package:flutter/material.dart';
import 'package:tcc/provider/UserProvider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = '';
  String password = '';
  String confirmpassword = '';

  void _senhaInvalida() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Senha inválida'),
          content: const Text('As senhas não coincidem'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 75, 57, 239),
                  const Color.fromARGB(255, 238, 139, 96)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: ListView(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 64, 0, 32),
                            child: Text("FlashComm",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: Icon(Icons.arrow_back,
                                              color: Colors.grey, size: 32),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Text("Voltar para o login",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 12, 0, 24),
                                      child: Text(
                                        "Comece preenchendo os campos abaixo",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: TextField(
                                        onChanged: (tmp) {
                                          setState(() {
                                            email = tmp;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            labelText: "Email",
                                            fillColor: Colors.grey,
                                            labelStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey))),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: TextField(
                                        onChanged: (tmp) {
                                          setState(() {
                                            password = tmp;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            labelText: "Senha",
                                            fillColor: Colors.grey,
                                            labelStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey))),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: TextField(
                                        onChanged: (tmp) {
                                          setState(() {
                                            confirmpassword = tmp;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            labelText: "Confirme a senha",
                                            fillColor: Colors.grey,
                                            labelStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey))),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 44,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (password == confirmpassword) {
                                                // Cria uma instância do UserProvider
                                                Provider.of<AuthProvider>(context, listen: false).singup(email, password);
                                                Navigator.pushNamed(context, '/homepage');
                                              } else {
                                                return _senhaInvalida();
                                              }
                                            },
                                            child: Text(
                                              "Cadastrar",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty
                                                      .all<Color>(Color.fromARGB(
                                                          255, 75, 57, 239)),
                                            ),
                                          ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
