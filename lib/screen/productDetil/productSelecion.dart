import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ModalProductSelecation {
  mainBottomSheet(BuildContext context, list, index, Function function) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              height: 300,
              color: Colors.transparent,
              padding: EdgeInsets.only(
                  left: 4,
                  right: 4,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ListView(
                children: [
                  ...List.generate(list.length, (i) {
                    return (ListTile(
                      onTap: () {
                        function(i);
                        Navigator.pop(context);
                      },
                      title: Text(list[i]),
                      trailing: index == i
                          ? Icon(
                              EvaIcons.checkmarkCircle2,
                              color: Theme.of(context).accentColor,
                            )
                          : Text(""),
                    ));
                  })
                ],
              ),
            ),
          );
        });
  }
}
