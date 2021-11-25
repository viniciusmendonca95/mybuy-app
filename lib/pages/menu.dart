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
    padding: const EdgeInsets.only(left: 40, right: 40),
    children: [
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Common", userPermission)
          ? RaisedButton.icon(
              onPressed: () =>
                  Navigator.pushNamed(context, '/historicoCompras'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              label: Text(
                'Histórico de Compras',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.format_list_bulleted,
                color: Colors.white,
              ),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Color(0xFFDc6818),
            )
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Administration", userPermission)
          ? RaisedButton.icon(
              onPressed: () =>
                  Navigator.pushNamed(context, '/cadastrarProduto'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              label: Text(
                'Cadastrar Produto',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.add_box_rounded,
                color: Colors.white,
              ),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.green,
            )
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Administration", userPermission)
          ? RaisedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/alterarProduto'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              label: Text(
                'Alterar Produto',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.green,
            )
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Administration", userPermission)
          ? RaisedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/createCategory'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              label: Text(
                'Cadastrar Categoria',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.add_box_rounded,
                color: Colors.white,
              ),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.blue,
            )
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Administration", userPermission)
          ? RaisedButton.icon(
              onPressed: () =>
                  Navigator.pushNamed(context, '/alterarCategoria'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              label: Text(
                'Alterar Categoria',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.blue,
            )
          : null,
      SizedBox(
        height: 20,
      ),
      _validarPermissao("Administration", userPermission)
          ? RaisedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/listarCategoria'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              label: Text(
                'Listar Categorias',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              textColor: Colors.white,
              splashColor: Colors.red,
              color: Colors.blue,
            )
          : null,
      SizedBox(
        height: 80,
      ),
      SizedBox(
        height: 40,
        child: _validarPermissao("Common", userPermission)
            ? RaisedButton.icon(
                onPressed: () => _logout(context),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                label: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                textColor: Colors.white,
                splashColor: Colors.red,
                color: Colors.red,
              )
            : null,
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
