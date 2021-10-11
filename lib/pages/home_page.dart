import 'package:app/models/product.dart';
import 'package:app/services/ProductService.dart';
import 'package:app/services/ShoppingCartOpendService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: Color(0xFF3da8a2),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.filter_alt,
                size: 35,
                color: Color(0xFF3da8a2),
              ),
              onPressed: () {
                // Send info to child
              })
        ],
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo-mybuy.png', scale: 3),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }

  _addItem(productId) async {
    var result = await ShoppingCartOpendService.addItemOnCarOpend(productId);
    if (result != null) {
      alert(context, "Erro", result);
    } else {
      alert(context, "Item adicionado",
          "Item adicionado ao carrinho de compras!");
    }
    setState(() {
      _body();
    });
  }

  _body() {
    Future<List<Product>> products = ProductService.getProducts();
    return FutureBuilder(
        future: products,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(color: Colors.white));
          }
          List<Product> products = snapshot.data;
          print(products.length);
          return _listViewProducts(products);
        });
  }

  _listViewProducts(products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product p = products[index];
          return Card(
            margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(p.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "R\$ ${(p.price / 100).toStringAsPrecision(4)}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFDc6818))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 8, right: 10, bottom: 8),
                        child: Text.rich(
                            TextSpan(text: "Estoque: ", children: <TextSpan>[
                              TextSpan(
                                  text: '${p.quantity}',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                            style: TextStyle(fontSize: 15)),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                        onPressed: () => alert(
                            context, "Descrição do produto", p.description),
                        child: Text("Descrição",
                            style: TextStyle(
                                color: Color(0xFF3da8a2), fontSize: 15))),
                    SizedBox(width: 180),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFDc6818))),
                      icon: Icon(Icons.add_shopping_cart, size: 25),
                      label: Text('Comprar'),
                      onPressed: () => _addItem(p.id),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
