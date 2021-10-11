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
        backgroundColor: Colors.white,
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
            return Center(
                child: CircularProgressIndicator(color: Colors.white));
          }
          ShoppingCart shoppingCartOpend = snapshot.data;
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
    if (result != null) {
      alert(context, "Erro", result);
    } else {
      alert(context, "Pedido finalizado", "Obrigado por comprar com a MyBuy!");
    }
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
                margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, top: 8, bottom: 8, right: 8),
                            child: Text(p.product.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          IconButton(
                              padding: const EdgeInsets.only(right: 35),
                              icon: Icon(Icons.add),
                              color: Color(0xFF3da8a2),
                              onPressed: () => _addItem(p.productId))
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, top: 8, bottom: 8, right: 8),
                            child: Text("${(p.product.description)}",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Text(
                              "${(p.quantity)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, top: 8, bottom: 8, right: 8),
                            child: Text.rich(
                                TextSpan(text: "Total: ", children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'R\$ ${((p.product.price / 100) * p.quantity).toStringAsPrecision(4)}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFDc6818)))
                                ]),
                                style: TextStyle(fontSize: 20)),
                          ),
                          IconButton(
                              padding: const EdgeInsets.only(right: 35),
                              icon: Icon(Icons.remove),
                              color: Color(0xFFDc6818),
                              onPressed: () => _removeItem(p.productId)),
                        ]),
                  ],
                ),
              );
            }),
        shoppingCartOpend.productShoppingCarts.length == 0
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  "O seu carrinho está vazio.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ))
            : null,
        shoppingCartOpend.productShoppingCarts.length > 0
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              "SubTotal: R\$ ${(shoppingCartOpend.subTotal / 100).toStringAsPrecision(4)}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: TextButton(
                            onPressed: () =>
                                _finalizarCompra(shoppingCartOpend.id),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFDc6818))),
                            child: Text("Finalizar Pedido",
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
