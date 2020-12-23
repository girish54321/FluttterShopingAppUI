import 'dart:convert';

import 'package:FlutterShopingAppUI/animasions/FadeAnimation.dart';
import 'package:FlutterShopingAppUI/modal/flitterModal.dart';
import 'package:FlutterShopingAppUI/screen/widgets/appToolbar.dart';
import 'package:FlutterShopingAppUI/screen/widgets/applyFitter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class FlitterView extends StatefulWidget {
  @override
  _FlitterViewState createState() => _FlitterViewState();
}

class _FlitterViewState extends State<FlitterView> {
  var _category;
  FiltterModle filtterModle;
  List<S2Choice<String>> categories = [
    S2Choice<String>(value: 'ele', title: 'Electronics'),
    S2Choice<String>(value: 'aud', title: 'Audio & Video'),
    S2Choice<String>(value: 'acc', title: 'Accessories'),
    S2Choice<String>(value: 'ind', title: 'Industrial'),
    S2Choice<String>(value: 'wat', title: 'Smartwatch'),
    S2Choice<String>(value: 'sci', title: 'Scientific'),
    S2Choice<String>(value: 'mea', title: 'Measurement'),
    S2Choice<String>(value: 'pho', title: 'Smartphone'),
  ];

  @override
  void initState() {
    getHomeBrands();
    super.initState();
  }

  getHomeBrands() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/filtter.json");
    final jsonResult = json.decode(data);
    filtterModle = new FiltterModle.fromJson(jsonResult);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "Filter"),
      body: ListView.builder(
        itemCount: filtterModle.filtter.length,
        itemBuilder: (context, index) {
          Filtter filtter = filtterModle.filtter[index];
          return FadeAnimation(
            0.3,
            Container(
                child: filtter.type == "radio"
                    ? SmartSelect<String>.single(
                        title: filtter.filtterName,
                        value: _category,
                        choiceItems: filtter.itmes.map((Itme itme) {
                          return S2Choice<String>(
                              value: itme.id, title: itme.title);
                        }).toList(),
                        modalType: S2ModalType.bottomSheet,
                        choiceType: S2ChoiceType.radios,
                        choiceStyle: S2ChoiceStyle(
                            titleStyle: TextStyle(color: Colors.black),
                            activeColor: Theme.of(context).accentColor,
                            showCheckmark: true,
                            color: Colors.grey),
                        onChange: (state) =>
                            setState(() => _category = state.value),
                        tileBuilder: (context, state) => S2Tile(
                          title: Text(filtter.filtterName),
                          value: state.valueDisplay,
                          isTwoLine: true,
                          leading: Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(filtter.filtterName[0]),
                                ),
                              ),
                            ),
                          ),
                          onTap: state.showModal,
                          trailing: Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: const Icon(EvaIcons.arrowIosForward),
                          ),
                        ),
                      )
                    : SmartSelect<String>.multiple(
                        title: filtter.filtterName,
                        value: [],
                        choiceItems: filtter.itmes.map((Itme itme) {
                          return S2Choice<String>(
                              value: itme.id, title: itme.title);
                        }).toList(),
                        modalType: S2ModalType.bottomSheet,
                        choiceType: S2ChoiceType.checkboxes,
                        choiceStyle: S2ChoiceStyle(
                            titleStyle: TextStyle(color: Colors.black),
                            activeColor: Theme.of(context).accentColor,
                            showCheckmark: true,
                            color: Colors.grey),
                        // onChange: (state) =>
                        //     setState(() => _category = state.value),
                        tileBuilder: (context, state) => S2Tile(
                          title: Text(filtter.filtterName),
                          value: state.valueDisplay,
                          isTwoLine: true,
                          leading: Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(filtter.filtterName[0]),
                                ),
                              ),
                            ),
                          ),
                          onTap: state.showModal,
                          trailing: Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: const Icon(EvaIcons.arrowIosForward),
                          ),
                        ),
                        onChange: (S2MultiState<String> value) {},
                      )),
          );
        },
      ),
      bottomSheet: ApplayFilterView(),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: header(context, "Filter"),
//         body: Column(
//           children: [
//             FadeAnimation(
//               0.3,
//               Container(
//                 child: SmartSelect<String>.single(
//                   title: "widget.titleTex",
//                   value: _category,
//                   choiceItems: categories,
//                   modalType: S2ModalType.bottomSheet,
//                   choiceType: S2ChoiceType.radios,
//                   choiceStyle: S2ChoiceStyle(
//                       titleStyle: TextStyle(color: Colors.black),
//                       activeColor: Theme.of(context).accentColor,
//                       showCheckmark: true,
//                       color: Colors.grey),
//                   onChange: (state) => setState(() => _category = state.value),
//                   tileBuilder: (context, state) => S2Tile(
//                     // dense: true,
//                     title: Text("widget.titleText"),
//                     value: state.valueDisplay,
//                     isTwoLine: true,
//                     leading: Container(
//                       width: 40,
//                       alignment: Alignment.center,
//                       child: const Icon(Icons.label_outline),
//                     ),
//                     onTap: state.showModal,
//                     trailing: Container(
//                       width: 40,
//                       alignment: Alignment.center,
//                       child: const Icon(EvaIcons.arrowIosForward),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             FadeAnimation(
//               0.3,
//               Container(
//                 child: SmartSelect<String>.multiple(
//                   title: "widget.titleTex",
//                   value: _categoryList,
//                   choiceItems: categories,
//                   modalType: S2ModalType.popupDialog,
//                   choiceType: S2ChoiceType.checkboxes,
//                   choiceStyle: S2ChoiceStyle(
//                       titleStyle: TextStyle(color: Colors.black),
//                       activeColor: Theme.of(context).accentColor,
//                       showCheckmark: true,
//                       color: Colors.grey),
//                   onChange: (state) =>
//                       setState(() => _categoryList = state.value),
//                   tileBuilder: (context, state) => S2Tile(
//                     // dense: true,
//                     title: Text("widget.titleText"),
//                     value: state.valueDisplay,
//                     isTwoLine: true,
//                     leading: Container(
//                       width: 40,
//                       alignment: Alignment.center,
//                       child: const Icon(Icons.label_outline),
//                     ),
//                     onTap: state.showModal,
//                     trailing: Container(
//                       width: 40,
//                       alignment: Alignment.center,
//                       child: const Icon(EvaIcons.arrowIosForward),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
