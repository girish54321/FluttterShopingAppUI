import 'package:FlutterShopingAppUI/animasions/rightToLeft.dart';
import 'package:FlutterShopingAppUI/screen/Cart/cartModaleView.dart';
import 'package:FlutterShopingAppUI/screen/widgets/cartView.dart';
import 'package:FlutterShopingAppUI/screen/widgets/chekOutAddtoCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Modal modal = new Modal();
  int number = 1;
  List<int> myList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
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
                return CartViewItem(
                  isCart: null,
                );
              },
              childCount: 8,
            ),
          ),
          SliverToBoxAdapter(
              child: RightToLeft(delay: 200, child: TotalaAmountView()))
        ],
      ),
      // bottomSheet: CheckOutAddToCartView(
      //   buttonText: "CHECKOUT",
      //   function: () {
      //     modal.mainBottomSheet(context);
      //   },
      // ),
    );
  }
}
