import 'package:app/models/productShoppingCart.dart';
import 'package:app/models/shoppingCart.dart';
import 'package:app/services/ShoppingCartOpendService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';

class CartOpendPage extends StatefulWidget {
  @override
  _CartOpendState createState() => _CartOpendState();
}

class _CartOpendState extends State<CartOpendPage> {
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
    Future<ShoppingCart> shoppigCartOpend =
        ShoppingCartOpendService.getShoppingCartOpend();
    return FutureBuilder(
        future: shoppigCartOpend,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          ShoppingCart shoppingCartOpend = snapshot.data;
          //if (shoppingCartOpend.k)
          return _listViewProducts(shoppingCartOpend);
        });
  }

  _addItem(productId) async {
    var result = await ShoppingCartOpendService.addItemOnCarOpend(productId);
    if (result != null) alert(context, "Erro", result);
    setState(() {
      _body();
    });
  }

  _removeItem(productId) async {
    var result = await ShoppingCartOpendService.removeOnCarOpend(productId);
    if (result != null) alert(context, "Erro", result);
    setState(() {
      _body();
    });
  }

  _finalizarCompra(shoppingCartId) async {
    var result =
        await ShoppingCartOpendService.closeShoppingCart(shoppingCartId);
    if (result != null) alert(context, "Erro", result);
    setState(() {
      _body();
    });
  }

  _listViewProducts(shoppingCartOpend) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: shoppingCartOpend.productShoppingCarts.length,
            itemBuilder: (context, index) {
              ProductShoppingCarts p =
                  shoppingCartOpend.productShoppingCarts[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text(p.product.name, style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.product.description,
                          style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Quantidade:  ${p.quantity.toString()}",
                          style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Total R\$: ${((p.product.price / 100) * p.quantity).toString()}",
                          style: TextStyle(fontSize: 20)),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => _removeItem(p.productId)),
                        IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => _addItem(p.productId))
                      ],
                    ),
                  ],
                ),
              );
            }),
        shoppingCartOpend.productShoppingCarts.length > 0
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              "SubTotal: R\$ ${(shoppingCartOpend.subTotal / 100).toString()}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: FlatButton(
                            onPressed: () =>
                                _finalizarCompra(shoppingCartOpend.id),
                            color: Colors.red,
                            child: Text("Finalizar",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      )
                    ],
                  ),
                ),
              )
            : null
      ].whereType<Widget>().toList(),
    );
  }
}
