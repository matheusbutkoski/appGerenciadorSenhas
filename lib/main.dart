// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciadorsenhas/Data/Perfil/perfil_sqlite_datasource.dart';
import 'package:gerenciadorsenhas/home.dart';
import 'package:gerenciadorsenhas/perfil.dart';

import 'recuperarsenha.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Login'), backgroundColor: const Color.fromARGB(255, 5, 43, 75),),
        body: _Login(),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  String email = '';
  String pass = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Tela de Login',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 5, 43, 75),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Digite os dados',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'e-mail',
                ),
                onChanged: (text) {
                  email = text;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                onChanged: (text) {
                  pass = text;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return recuperarSenha();
                }));
              },
              child: const Text(
                'Esqueci a senha',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 5, 43, 75)),
                    child: const Text('Login'),
                    onPressed: () async {
                      if (await perfilSQLiteDatasource()
                          .getPerfilLogin(email, pass)) {
                        
                          
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Home(email: email,);
                        }));
                      }
                    })),
            Row(
              children: <Widget>[
                const Text('Não possui conta?'),
                TextButton(
                  child: const Text(
                    'Cadastre aqui',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return cadperfilUsuario();
                    }));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
