import 'package:app/models/category.dart';
import 'package:app/services/CategoryService.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: Color(0xFF3da8a2),
      appBar: AppBar(
        backgroundColor: Color(0xFF3da8a2),
        title: Image.asset('assets/images/logo-mybuy.png', scale: 3),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }

  _body() {
    Future<List<Category>> categories = CategoryService.getCategories();
    return FutureBuilder(
        future: categories,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Category> categories = snapshot.data;
          return _listViewCategories(categories);
        });
  }

  _listViewCategories(categories) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category p = categories[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(p.name, style: TextStyle(fontSize: 20))),
                ),
              ],
            ),
          );
        });
  }
}
