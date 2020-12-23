import 'package:FlutterShopingAppUI/animasions/FadeAnimation.dart';
import 'package:FlutterShopingAppUI/screen/productDetil/productSelecion.dart';
import 'package:flutter/material.dart';

class ProductSelction extends StatefulWidget {
  final List<String> size;
  final String titleText;
  final Function changeSelectedSize;

  const ProductSelction(
      {Key key, this.size, this.titleText, this.changeSelectedSize})
      : super(key: key);
  @override
  _ProductSelctionState createState() => _ProductSelctionState();
}

class _ProductSelctionState extends State<ProductSelction> {
  String _category = '';
  ModalProductSelecation modal = new ModalProductSelecation();
  int slectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.3,
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Container(
              height: 40.00,
              width: 160.00,
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.00,
                  color: Color(0xffebebeb),
                ),
                borderRadius: BorderRadius.circular(25.00),
              ),
              child: InkWell(
                onTap: () {
                  modal.mainBottomSheet(context, widget.size, slectedItem,
                      (index) {
                    widget.changeSelectedSize(index);
                    setState(() {
                      _category = widget.size[index];
                      slectedItem = index;
                    });
                  });
                  // SelectDialog.showModal<String>(
                  //   context,
                  //   label: widget.titleText,
                  //   titleStyle: TextStyle(color: Colors.black),
                  //   showSearchBox: false,
                  //   selectedValue: _category,
                  //   backgroundColor: Colors.white,
                  //   items: List.generate(
                  //       widget.size.length, (index) => widget.size[index]),
                  //   onChange: (String selected) {
                  //     setState(() {
                  //       _category = selected;
                  //     });
                  //   },
                  // );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Size",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      _category,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 40.00,
              width: 160.00,
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.00,
                  color: Color(0xffebebeb),
                ),
                borderRadius: BorderRadius.circular(25.00),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                  ),
                  Container(
                    height: 22.00,
                    width: 22.00,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.00),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
