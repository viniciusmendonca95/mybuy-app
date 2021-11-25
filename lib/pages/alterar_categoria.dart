import 'package:app/services/CategoryService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';

class AlterarCategoria extends StatefulWidget {
  const AlterarCategoria({Key key}) : super(key: key);

  @override
  _AlterarCategoriaState createState() => _AlterarCategoriaState();
}

class _AlterarCategoriaState extends State<AlterarCategoria> {
  final categoryId = TextEditingController();
  final name = TextEditingController();
  final description = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void alterarCategoria(BuildContext context) async {
    String categoryId = this.categoryId.text;
    String name = this.name.text;
    String description = this.description.text;

    var resultUpdateCategory =
        await CategoryService.updateCategory(categoryId, name, description);
    Navigator.pushNamed(context, "/bottomNavigation");
    alert(context, "Alteração de Produto", resultUpdateCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF3da8a2)),
          backgroundColor: Colors.white,
          title: Image.asset('assets/images/logo-mybuy.png', scale: 3),
          centerTitle: true,
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Container(
              decoration: new BoxDecoration(color: Color(0xFF3da8a2)),
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: 30,
                left: 40,
                right: 40,
              ),
              child: Form(
                  key: _formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        Text("Alteração de Categoria",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: categoryId,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.info_outline,
                                    color: Colors.grey),
                                hintText: 'Código da categoria'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: name,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.sell, color: Colors.grey),
                                hintText: 'Nome'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: description,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon:
                                    Icon(Icons.description, color: Colors.grey),
                                hintText: 'Descrição'),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFFDc6818),
                                  Color(0xFFDc6818)
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: SizedBox.expand(
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Alterar Categoria",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                                onPressed: () => alterarCategoria(context),
                              ),
                            )),
                      ],
                    ),
                  )))
        ]))));
  }
}
