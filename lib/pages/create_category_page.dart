import 'package:app/models/category.dart';
import 'package:app/services/CategoryService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';

class CreateCategoryPage extends StatefulWidget {
  const CreateCategoryPage({Key key}) : super(key: key);

  @override
  _CreateCategoryPageState createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  final name = TextEditingController();
  final description = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void cadastrarCategoria(BuildContext context) async {
    String name = this.name.text;
    String description = this.description.text;
    var resultCreateCategory =
        await CategoryService.createCategory(name, description);
    alert(context, "Categorias", resultCreateCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de categoria"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "nome",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                controller: description,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Descrição",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  color: Colors.blue,
                  child: Text("Criar", style: TextStyle(color: Colors.white)),
                  onPressed: () => cadastrarCategoria(context))
            ],
          ),
        ),
      ),
    );
  }
}
