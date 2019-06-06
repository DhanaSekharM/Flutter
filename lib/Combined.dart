import 'package:flutter/material.dart';

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);
typedef void ItemAddedCallback(Product product);

class ShoppingListItem extends StatelessWidget {

  ShoppingListItem({this.product, this.inCart, this.onCartChanged, this.onItemAdded});
  final bool inCart;
  final Product product;
  final CartChangedCallback onCartChanged;
  final ItemAddedCallback onItemAdded;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts of the tree
    // can have different themes.  The BuildContext indicates where the build is
    // taking place and therefore which theme to use.
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {

    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if(inCart == null) {
          onCartChanged(product, false);
        } else {
          onCartChanged(product, !inCart);
        }
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({this.products});

  final List<Product> products;

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();
  final _textController  = TextEditingController();
  String newItem;

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need to change
      //_shoppingCart inside a setState call to trigger a rebuild.
      // The framework then calls // build, below,
      // which updates the visual appearance of the app.

      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  void _handleAddItem(Product product) {
    setState(() {
      widget.products.add(product);
    });
  }

  void _handleClearThemAll() {
    setState(() {
      widget.products.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
            onItemAdded: _handleAddItem,
          );
        }).toList(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
//          _handleAddItem(Product(name: 'item'));
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Enter a new item'),
                    content: TextField(
                      controller: _textController,
                      onSubmitted: (String input){
                        newItem = input;
//                _handleAddItem(Product(name: input));
                      },
                    ),

                    actions: <Widget>[
                      FlatButton(
                        onPressed:() {
                          _handleAddItem(Product(name: newItem));
                          Navigator.of(context).pop();
                        },
                        child: Text('Add'),
                      )
                    ],
                  )
              );
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.clear),
            onPressed: () {
              _handleClearThemAll();
            },
          )
        ],
      )
    );
  }
}


