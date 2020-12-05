// import 'package:FlutterShopingAppUI/animasions/FadeAnimation.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:smart_select/smart_select.dart';

// class ProductSelction extends StatefulWidget {
//   final List<String> size;
//   final String titleText;
//   const ProductSelction({Key key, this.size, this.titleText}) : super(key: key);
//   @override
//   _ProductSelctionState createState() => _ProductSelctionState();
// }

// class _ProductSelctionState extends State<ProductSelction> {
//   String _category = '';

//   List<S2Choice<String>> categories = [];

// //   S2Choice<String>(value: 'pho', title: 'Smartphone'),

//   @override
//   void initState() {
//     for (var i = 0; i < widget.size.length; i++) {
//       categories.add(
//           new S2Choice<String>(value: widget.size[i], title: widget.size[i]));
//     }

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeAnimation(
//       0.3,
//       Container(
//         child: SmartSelect<String>.single(
//           title: widget.titleText,
//           value: _category,
//           choiceItems: categories,
//           modalType: S2ModalType.bottomSheet,
//           choiceType: S2ChoiceType.chips,
//           choiceStyle: S2ChoiceStyle(
//               titleStyle: TextStyle(color: Colors.black),
//               activeColor: Theme.of(context).accentColor,
//               showCheckmark: true,
//               color: Colors.grey),
//           onChange: (state) => setState(() => _category = state.value),
//           tileBuilder: (context, state) => S2Tile(
//             // dense: true,
//             title: Text(widget.titleText),
//             value: state.valueDisplay,
//             isTwoLine: true,
//             leading: Container(
//               width: 40,
//               alignment: Alignment.center,
//               child: const Icon(Icons.label_outline),
//             ),
//             onTap: state.showModal,
//             trailing: Container(
//               width: 40,
//               alignment: Alignment.center,
//               child: const Icon(EvaIcons.arrowIosForward),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:FlutterShopingAppUI/animasions/FadeAnimation.dart';
import 'package:FlutterShopingAppUI/screen/productDetil/productSelecion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_dialog/select_dialog.dart';

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
