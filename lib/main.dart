import 'package:FlutterShopingAppUI/provider/loginState.dart';
import 'package:FlutterShopingAppUI/screen/auth/singInScreen/singInScreen.dart';
import 'package:FlutterShopingAppUI/screen/flitterView/flitterScreen.dart';
import 'package:FlutterShopingAppUI/screen/homeScreen/homemain.dart';
import 'package:FlutterShopingAppUI/screen/profileStack/savedAddress/savedAddress.dart';
import 'package:FlutterShopingAppUI/screen/widgets/sussesssScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     title: 'Shoping',
    //     theme: ThemeData(
    //       primarySwatch: Colors.green,
    //       scaffoldBackgroundColor: Colors.white,
    //       visualDensity: VisualDensity.adaptivePlatformDensity,
    //     ),
    //     home: SingInScreen());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginStateProvider>(
            create: (context) => LoginStateProvider()),
      ],
      child: Consumer<LoginStateProvider>(
        builder: (context, loginStateProvider, child) {
          return MaterialApp(
              title: 'Shoping',
              theme: ThemeData(
                primarySwatch: Colors.green,
                scaffoldBackgroundColor: Colors.white,
              ),
              home: loginStateProvider.logedIn == true
                  ? HomeMainScreen()
                  // ? SavedAddress()
                  : SingInScreen());
          // home: FlitterView());
        },
      ),
    );
  }
}

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:select_dialog/select_dialog.dart';
//
// import 'user_model.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String ex1 = "Simple Example";
//   String ex2 = "Model Example";
//   UserModel ex3 = UserModel(name: "Item Builder Example");
//   UserModel ex4 = UserModel(name: "Online Example");
//   List<String> ex5 = [];

//   final modelItems = List.generate(
//     50,
//     (index) => UserModel(
//       avatar: "https://i.imgur.com/lTy4hiN.jpg",
//       name: "Deivão $index",
//       id: "$index",
//       createdAt: DateTime.now(),
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Select Dialog Example"),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(25),
//         width: double.infinity,
//         child: Column(
//           children: <Widget>[
//             RaisedButton(
//               child: Text(ex1),
//               onPressed: () {
//                 SelectDialog.showModal<String>(
//                   context,
//                   label: "Simple Example",
//                   titleStyle: TextStyle(color: Colors.brown),
//                   showSearchBox: false,
//                   selectedValue: ex1,
//                   backgroundColor: Colors.amber,
//                   items: List.generate(50, (index) => "Item $index"),
//                   onChange: (String selected) {
//                     setState(() {
//                       ex1 = selected;
//                     });
//                   },
//                 );
//               },
//             ),
//             RaisedButton(
//               child: Text(ex2),
//               onPressed: () {
//                 SelectDialog.showModal<UserModel>(
//                   context,
//                   alwaysShowScrollBar: true,
//                   label: "Model Example",
//                   searchHint: "Example Hint",
//                   items: modelItems,
//                   onChange: (UserModel selected) {
//                     setState(() {
//                       ex2 = selected.name;
//                     });
//                   },
//                 );
//               },
//             ),
//             RaisedButton(
//               child: Text(ex3.name),
//               onPressed: () {
//                 SelectDialog.showModal<UserModel>(
//                   context,
//                   label: "Item Builder Example",
//                   items: modelItems,
//                   selectedValue: ex3,
//                   itemBuilder:
//                       (BuildContext context, UserModel item, bool isSelected) {
//                     return Container(
//                       decoration: !isSelected
//                           ? null
//                           : BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               color: Colors.white,
//                               border: Border.all(
//                                 color: Theme.of(context).primaryColor,
//                               ),
//                             ),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(item.avatar),
//                         ),
//                         selected: isSelected,
//                         title: Text(item.name),
//                         subtitle: Text(item.createdAt.toString()),
//                       ),
//                     );
//                   },
//                   onChange: (selected) {
//                     setState(() {
//                       ex3 = selected;
//                     });
//                   },
//                 );
//               },
//             ),
//             // RaisedButton(
//             //   child: Text(ex4.name),
//             //   onPressed: () {
//             //     SelectDialog.showModal<UserModel>(
//             //       context,
//             //       label: "Online Example",
//             //       selectedValue: ex4,
//             //       onFind: (String filter) => getData(filter),
//             //       onChange: (UserModel selected) {
//             //         setState(() {
//             //           ex4 = selected;
//             //         });
//             //       },
//             //     );
//             //   },
//             // ),
//             RaisedButton(
//               child: Text(
//                 ex5.isEmpty ? "Multiple Items Example" : ex5.join(", "),
//               ),
//               onPressed: () {
//                 SelectDialog.showModal<String>(
//                   context,
//                   label: "Multiple Items Example",
//                   multipleSelectedValues: ex5,
//                   items: List.generate(50, (index) => "Item $index"),
//                   itemBuilder: (context, item, isSelected) {
//                     return ListTile(
//                       trailing: isSelected ? Icon(Icons.check) : null,
//                       title: Text(item),
//                       selected: isSelected,
//                     );
//                   },
//                   onMultipleItemsChange: (List<String> selected) {
//                     setState(() {
//                       ex5 = selected;
//                     });
//                   },
//                   okButtonBuilder: (context, onPressed) {
//                     return Align(
//                       alignment: Alignment.centerRight,
//                       child: FloatingActionButton(
//                         onPressed: onPressed,
//                         child: Icon(Icons.check),
//                         mini: true,
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Future<List<UserModel>> getData(filter) async {
//   //   var response = await Dio().get(
//   //     "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
//   //     queryParameters: {"filter": filter},
//   //   );

//   //   var models = UserModel.fromJsonList(response.data);
//   //   return models;
//   // }
// }

// class UserModel {
//   final String id;
//   final DateTime createdAt;
//   final String name;
//   final String avatar;

//   UserModel({this.id, this.createdAt, this.name, this.avatar});

//   @override
//   String toString() => name;

//   @override
//   operator ==(o) => o is UserModel && o.id == id;

//   @override
//   int get hashCode => id.hashCode ^ name.hashCode ^ createdAt.hashCode;
// }
