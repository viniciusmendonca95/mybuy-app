import 'package:app/models/category.dart';
import 'package:app/services/CategoryService.dart';
import 'package:app/services/ProductService.dart';
import 'package:app/services/UserService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';

class CadastrarProduto extends StatefulWidget {
  const CadastrarProduto({Key key}) : super(key: key);

  @override
  _CadastrarProdutoState createState() => _CadastrarProdutoState();
}

class _CadastrarProdutoState extends State<CadastrarProduto> {
  final name = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();
  final quantity = TextEditingController();
  final warrantyTime = TextEditingController();
  final weight = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void cadastrarProduto(BuildContext context) async {
    String name = this.name.text;
    String description = this.description.text;
    String price = this.price.text;
    String quantity = this.quantity.text;
    String warrantyTime = this.warrantyTime.text;
    String weight = this.weight.text;
    var resultCreateProduct = await ProductService.createProduct(
        name,
        description,
        "",
        int.parse(price),
        int.parse(quantity),
        int.parse(warrantyTime),
        int.parse(weight));
    alert(context, "Cadastro", resultCreateProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produto"),
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
              TextFormField(
                controller: price,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "preço",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                controller: quantity,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "quantidade",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                controller: warrantyTime,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "tempo de garantia",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                controller: weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "peso",
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
                  onPressed: () => cadastrarProduto(context))
            ],
          ),
        ),
      ),
    );
  }
}
