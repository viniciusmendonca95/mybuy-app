import 'package:app/pages/category_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/menu.dart';
import 'package:flutter/material.dart';

import 'cart_opend.dart';

class BottonNavigation extends StatefulWidget {
  @override
  _BottonNavigationState createState() => _BottonNavigationState();
}

class _BottonNavigationState extends State<BottonNavigation> {
  int _currentIndex = 0;

  final _tabs = [
    HomePage(),
    CategoryPage(),
    CartOpendPage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        selectedItemColor: Color(0xFF3da8a2),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Produtos',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              label: 'Categorias',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Carrinho',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Meu perfil',
              backgroundColor: Colors.white)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
