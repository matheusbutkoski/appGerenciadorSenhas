// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'Data/Perfil/perfil_sqlite_datasource.dart';
import 'geradorsenha.dart';
import 'perfil.dart';


class menuprincipal extends StatefulWidget {
  final String email;
    const menuprincipal({Key? key, required this.email}) : super(key: key);

  @override
  _menuprincipalState createState() {
    return _menuprincipalState();
  }
}

class _menuprincipalState extends State<menuprincipal> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(      
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Usuario'),
                accountEmail: Text(widget.email),
                currentAccountPicture: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Favoritos"),
                  subtitle: Text("meus favoritos..."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    debugPrint('toquei no drawer');
                  }),
              ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Perfil"),
                  subtitle: Text("Perfil do usuário..."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return cadperfilUsuario();
                    }));
                  }),
              ListTile(
                  leading: Icon(Icons.password_sharp),
                  title: Text("Gerador de senhas"),
                  subtitle: Text("Obtenha suas senhas..."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return geradorSenha();
                    }));
                  }),
            ],
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.teal, title: const Text('Menu Principal')),

            body: Container(
              alignment: Alignment.center,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text("Deslize para cadastrar ou listar", 
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        
                        children: [
                      Icon(Icons.arrow_back),
                      Text("Senhas", 
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),                      
                        ],
                      ),
                      Row(
                       
                        children: [
                       Text("Cartões", 
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Icon(Icons.arrow_forward),
                       
                       
                        ],
                      )
                    ],
                  ),
              
                ],
              )
              )
              
            ),
      );
  }

  Future<String> getNome(email) async {
    return Future.value(perfilSQLiteDatasource().getPerfilLogado(email));
  }
}
