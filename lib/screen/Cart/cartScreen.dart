import 'dart:convert';

import 'package:FlutterShopingAppUI/animasions/rightToLeft.dart';
import 'package:FlutterShopingAppUI/modal/cartModal.dart';
import 'package:FlutterShopingAppUI/screen/Cart/cartModaleView.dart';
import 'package:FlutterShopingAppUI/screen/widgets/cartView.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Modal modal = new Modal();
  int number = 1;
  List<int> myList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<CartItems> cartItemsList = [];
  bool selected = false;
  addItem() {
    setState(() {
      number++;
      selected = !selected;
    });
  }

  removeItem() {
    setState(() {
      number--;
      selected = !selected;
    });
  }

  getCartItmes() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/cart.json");
    final jsonResult = json.decode(data);
    print(jsonResult.length);
    for (var i = 0; i < jsonResult.length; i++) {
      CartItems cartItems = new CartItems.fromJson(jsonResult[i]);
      cartItemsList.add(cartItems);
    }

    setState(() {});
  }

  @override
  void initState() {
    getCartItmes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 33),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                CartItems cartItems = cartItemsList[index];
                return CartViewItem(
                  imageUrl: cartItems.image,
                  prise: cartItems.price.toString(),
                  isCart: null,
                );
              },
              childCount: cartItemsList.length,
            ),
          ),
          SliverToBoxAdapter(
              child: RightToLeft(delay: 200, child: TotalaAmountView()))
        ],
      ),
    );
  }
}
