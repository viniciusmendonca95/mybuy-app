import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

_logout(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  prefs.remove('userId');
  prefs.remove('permission');
  return Navigator.popUntil(
    context,
    ModalRoute.withName('/'),
  );
}

_body() {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  return FutureBuilder(
      future: prefs,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        String userPermission = snapshot.data.getString('permission');
        return _listViewButtons(context, userPermission);
      });
}

_validarPermissao(permission, userPermission) {
  if (permission.toLowerCase() != 'common') {
    if (permission.toLowerCase() == userPermission.toLowerCase()) {
      return true;
    }
    return false;
  }
  return true;
}

_listViewButtons(context, userPermission) {
  return ListView(
    children: [
      _validarPermissao("Common", userPermission)
          ? FlatButton(
              color: Colors.red,
              child: Text("Histórico de compras",
                  style: TextStyle(color: Colors.white)),
              onPressed: () =>
                  Navigator.pushNamed(context, '/historicoCompras'))
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Administration", userPermission)
          ? FlatButton(
              color: Colors.blue,
              child: Text("Cadastrar produto",
                  style: TextStyle(color: Colors.white)),
              onPressed: () =>
                  Navigator.pushNamed(context, '/cadastrarProduto'))
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Administration", userPermission)
          ? FlatButton(
              color: Colors.red,
              child: Text("Atualizar produto",
                  style: TextStyle(color: Colors.white)),
              onPressed: () => Navigator.pushNamed(context, '/criarConta'))
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Administration", userPermission)
          ? FlatButton(
              color: Colors.green,
              child: Text("Cadastrar categoria",
                  style: TextStyle(color: Colors.white)),
              onPressed: () => Navigator.pushNamed(context, '/createCategory'))
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Administration", userPermission)
          ? FlatButton(
              color: Colors.brown,
              child: Text("Atualizar categoria",
                  style: TextStyle(color: Colors.white)),
              onPressed: () => Navigator.pushNamed(context, '/criarConta'))
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Common", userPermission)
          ? FlatButton(
              color: Colors.red,
              child: Text("Logout", style: TextStyle(color: Colors.white)),
              onPressed: () => _logout(context))
          : null,
      SizedBox(
        height: 20,
      )
    ].whereType<Widget>().toList(),
  );
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: Color(0xFF3da8a2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo-mybuy.png', scale: 3),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
