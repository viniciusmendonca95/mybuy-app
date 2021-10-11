import 'package:app/services/AuthService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void validarAcesso(BuildContext context) async {
    String email = this.email.text;
    String password = this.password.text;

    var authentication = await AuthService.login(email, password);
    if (authentication != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', authentication.token);
      prefs.setString('userId', authentication.user.id);
      prefs.setString('permission', authentication.permission);
      Navigator.pushNamed(context, "/splashScreen");
    } else {
      alert(context, "Login", "Email ou senha invalidos.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
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
                key: _formKey,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 42),
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
                        controller: email,
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(50),
                        ],
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.email, color: Colors.grey),
                            hintText: 'Email'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 32),
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
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(30),
                        ],
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.vpn_key, color: Colors.grey),
                            hintText: 'Senha'),
                      ),
                    ),
                    Container(
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 10, right: 32),
                            child: TextButton(
                              child: Text(
                                "Recuperar Senha",
                                style: TextStyle(color: Color(0xFF3da8a2)),
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, '/recuperarSenha'),
                            ))),
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
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              onPressed: () => validarAcesso(context)),
                        )),
                    Container(
                        height: 40,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextButton(
                                child: Text("Não possui uma conta? Cadastre-se",
                                    textAlign: TextAlign.center),
                                onPressed: () => Navigator.pushNamed(
                                    context, '/criarConta')))),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
