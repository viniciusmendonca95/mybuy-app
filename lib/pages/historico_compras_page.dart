import 'package:app/models/product.dart';
import 'package:app/models/productShoppingCart.dart';
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
          iconTheme: IconThemeData(color: Color(0xFF3da8a2)),
          backgroundColor: Colors.white,
          title: Image.asset('assets/images/logo-mybuy.png', scale: 3),
          centerTitle: true,
        ),
        body: _body(),
        backgroundColor: Color(0xFF3da8a2));
  }

  _body() {
    Future<List<ShoppingCart>> shoppingCart = ShoppingCartService.getHistory();
    return FutureBuilder(
        future: shoppingCart,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(color: Colors.white));
          }
          List<ShoppingCart> shoppingCartList = snapshot.data;
          return _listViewShoppingCarts(shoppingCartList);
        });
  }

  _listViewShoppingCarts(shoppingCartList) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: shoppingCartList.length,
            itemBuilder: (context, index) {
              ShoppingCart p = shoppingCartList[index];
              List<ProductShoppingCarts> pd = p.productShoppingCarts;
              return Card(
                  margin:
                      EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("\COMPRA Nº ${(index) + 1}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Total: R\$ ${(p.subTotal / 100).toStringAsPrecision(3)}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFDc6818))),
                              ),
                            ]),
                      ]));
            }),
        shoppingCartList.length == 0
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  "Você não possui histórico de compras.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ))
            : null,
      ].whereType<Widget>().toList(),
    );
  }
}
