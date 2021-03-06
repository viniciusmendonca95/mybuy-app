import 'package:app/services/ResetPasswordService.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/alert.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({Key key}) : super(key: key);

  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void resetPassword(BuildContext context) async {
    String email = this.email.text;

    var resultResetPassword = await ResetPasswordService.resetPassword(email);
    Navigator.pushNamed(context, "/");
    alert(context, "Alteração de Senha", resultResetPassword);
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
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 22),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 100,
                      padding: EdgeInsets.only(bottom: 22, top: 22),
                      child: Text(
                        "Insira o e-mail cadastrado e enviaremos uma nova senha de acesso para sua conta.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.email, color: Colors.grey),
                            hintText: 'E-mail'),
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
                                  "Enviar E-mail",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            onPressed: () => resetPassword(context),
                          ),
                        )),
                    Container(
                      height: 40,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextButton(
                              child: Text(
                                "Voltar a página de login",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFFDc6818)),
                              ),
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
