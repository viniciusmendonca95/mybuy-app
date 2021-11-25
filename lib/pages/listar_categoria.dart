import 'package:app/models/category.dart';
import 'package:app/services/CategoryService.dart';
import 'package:flutter/material.dart';

class ListarCategoria extends StatefulWidget {
  @override
  _ListarCategoriaState createState() => _ListarCategoriaState();
}

class _ListarCategoriaState extends State<ListarCategoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF3da8a2)),
          backgroundColor: Colors.white,
          title: Image.asset('assets/images/logo-mybuy.png', scale: 3),
          centerTitle: true,
        ),
        body: _body(),
        backgroundColor: Color(0xFF3da8a2));
  }

  _body() {
    Future<List<Category>> category = CategoryService.getCategories();
    return FutureBuilder(
        future: category,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Category> categoryList = snapshot.data;
          return _listViewCategory(categoryList);
        });
  }

  _listViewCategory(categoryList) {
    return ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          Category p = categoryList[index];
          return Card(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                          TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "Nome: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '${p.name}',
                            )
                          ]),
                          style: TextStyle(fontSize: 17)),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text.rich(
                                TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: "Descrição: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: '${p.description}',
                                  )
                                ]),
                                style: TextStyle(fontSize: 17)),
                          ),
                        ]),
                  ]));
        });
  }
}
