import 'package:flutter/material.dart';

class ProductSelcationItem extends StatelessWidget {
  final String sizeName;
  final int index;
  final int selectedSize;
  final Function selectSize;

  const ProductSelcationItem(
      {Key key,
      @required this.sizeName,
      @required this.index,
      @required this.selectedSize,
      @required this.selectSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 33,
        width: 33,
        margin: EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          color: index == selectedSize ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: Theme.of(context).accentColor),
        ),
        child: Tooltip(
          message: sizeName,
          child: InkWell(
            onTap: () {
              selectSize(index);
            },
            child: Center(
              child: Text(sizeName,
                  style: TextStyle(
                    color: index == selectedSize ? Colors.white : Colors.black,
                  )),
            ),
          ),
        ));
  }
}
