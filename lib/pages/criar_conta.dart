import 'package:app/services/UserService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({Key key}) : super(key: key);

  @override
  _CriarContaState createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final checkPassword = TextEditingController();
  final phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void criarUsuario(BuildContext context) async {
    String name = this.name.text;
    String email = this.email.text;
    String password = this.password.text;
    String checkPassword = this.checkPassword.text;
    String phone = this.phone.text;
    var resultCreateUser = await UserService.createUser(
        name, email, password, checkPassword, phone);

    if (resultCreateUser == "") {
      alert(
        context,
        "Cadastro",
        "Usuário cadastrado com sucesso!",
      );
      await Future.delayed(Duration(seconds: 4));
      Navigator.pushNamed(context, "/");
    } else {
      alert(context, "Cadastro", resultCreateUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF42847f), Color(0xFF3da8a2)]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/logo-mybuy.png'),
                    )
                  ],
                )),
            Container(
                height: MediaQuery.of(context).size.height / 1.7,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon:
                                Icon(Icons.account_circle, color: Colors.grey),
                            hintText: 'Nome Completo'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.email, color: Colors.grey),
                            hintText: 'E-mail'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: phone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.phone, color: Colors.grey),
                            hintText: 'Telefone'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.vpn_key, color: Colors.grey),
                            hintText: 'Senha'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: checkPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.vpn_key, color: Colors.grey),
                            hintText: 'Confirmar senha'),
                      ),
                    ),
                    Spacer(),
                    Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF42847f), Color(0xFF3da8a2)]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: SizedBox.expand(
                          child: TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Cadastrar",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            onPressed: () => criarUsuario(context),
                          ),
                        )),
                    Container(
                      height: 40,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextButton(
                              child: Text("Voltar a página de login",
                                  textAlign: TextAlign.center),
                              onPressed: () {
                                Navigator.pop(context, false);
                              })),
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
