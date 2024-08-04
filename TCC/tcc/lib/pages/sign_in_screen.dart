import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            child: Column(
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
                              GestureDetector(child: Icon(Icons.arrow_back, color: Colors.grey, size: 32), onTap: () {
                                Navigator.pop(context);
                              },),
                              Text("Voltar para o login",
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
                            child: Text("Começe preenchendo os campos abaixo",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey), textAlign: TextAlign.center,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  fillColor: Colors.grey,
                                  labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Senha",
                                  fillColor: Colors.grey,
                                  labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Confirme a senha",
                                  fillColor: Colors.grey,
                                  labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/home');
                                },
                                child: Text(
                                  "Cadastrar",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          const Color.fromARGB(255, 75, 57, 239)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                            child: Text("Ou entre com",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {},

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.g_mobiledata_outlined, color: Colors.grey[800]),
                                    Text(
                                      "Entrar com Google",
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                                
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.facebook, color: Colors.grey[800]),
                                    Text(
                                      "Continuar com Apple",
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.white),
                                ),
                              ),
                            ),
                          ),
                          
                          
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
