import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';

class CheckOutProgress extends StatelessWidget {
  final int selectedIndex;

  const CheckOutProgress({Key key, @required this.selectedIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      child: Column(
        children: [
          StepsIndicator(
            selectedStep: selectedIndex + 1,
            nbSteps: 3,
            selectedStepColorOut: Theme.of(context).accentColor,
            selectedStepColorIn: Colors.white,
            doneStepColor: Colors.blue,
            unselectedStepColorOut: Colors.grey,
            doneLineColor: Theme.of(context).accentColor,
            undoneLineColor: Colors.grey,
            isHorizontal: true,
            lineLength: 110,
            doneLineThickness: 2,
            undoneLineThickness: 2,
            doneStepSize: 10,
            doneStepWidget: Container(
              height: 30.00,
              width: 30.00,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(
                  width: 1.00,
                  color: Color(0xffdddddd),
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                margin: EdgeInsets.all(6),
                height: 16.00,
                width: 16.00,
                decoration: BoxDecoration(
                  color: Color(0xff00c569),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            unselectedStepWidget: Container(
              height: 30.00,
              width: 30.00,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(
                  width: 1.00,
                  color: Color(0xffdddddd),
                ),
                shape: BoxShape.circle,
              ),
            ), // Custom Widget
            selectedStepWidget: Container(
              height: 30.00,
              width: 30.00,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(
                  width: 1.00,
                  color: Color(0xffdddddd),
                ),
                shape: BoxShape.circle,
              ),
            ), // Custom Widget
          ),
          Container(
            margin: EdgeInsets.only(top: 11),
            width: 330,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Deliverys",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
                Text(
                  "Payments",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
