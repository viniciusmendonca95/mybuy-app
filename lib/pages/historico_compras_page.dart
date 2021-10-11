import 'package:app/models/shoppingCart.dart';
import 'package:app/services/ShoppingCartService.dart';
import 'package:flutter/material.dart';

class HistoricoComprasPage extends StatefulWidget {
  @override
  _HistoricoComprasState createState() => _HistoricoComprasState();
}

class _HistoricoComprasState extends State<HistoricoComprasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Histórico de compras"),
          centerTitle: true,
        ),
        body: _body());
  }

  _body() {
    Future<List<ShoppingCart>> shoppingCart = ShoppingCartService.getHistory();
    return FutureBuilder(
        future: shoppingCart,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<ShoppingCart> shoppingCartList = snapshot.data;
          return _listViewShoppingCarts(shoppingCartList);
        });
  }

  _listViewShoppingCarts(shoppingCartList) {
    return ListView.builder(
        itemCount: shoppingCartList.length,
        itemBuilder: (context, index) {
          ShoppingCart p = shoppingCartList[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(p.id, style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          );
        });
  }
}
