import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gerenciadorsenhas/listaCartao.dart';
import 'package:gerenciadorsenhas/listaSenhas.dart';
import 'package:gerenciadorsenhas/menuprincipal.dart';

class Home extends StatefulWidget {
  final String email;
 const Home({Key? key, required this.email}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int paginaAtual = 1;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina){
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: PageView(
              controller: pc,
              children: [
                listaSenhas(),
                menuprincipal(email: widget.email),
                listaCartao(),
              ],
    onPageChanged: setPaginaAtual
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: paginaAtual,
          items: [
            
            BottomNavigationBarItem(icon: Icon(Icons.key), label: "Senhas"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Menu Principal"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Cartões"),
          ],
            onTap: (pagina) {
              pc.animateToPage(pagina, duration: Duration(milliseconds: 400), curve: Curves.ease);
            },
          backgroundColor: Colors.teal,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.black,
            
        ),
    );
  }
}