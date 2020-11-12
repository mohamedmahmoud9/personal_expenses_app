import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.lable, this.spendingAmount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    print('Build() My Chart Bar');
    return LayoutBuilder(builder: (ctx, constrains) {
      return Column(
        children: <Widget>[
          Container(
              height: constrains.maxHeight * .15,
              child: FittedBox(
                  child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
          SizedBox(
            height: constrains.maxHeight * .05,
          ),
          Container(
            height: constrains.maxHeight * .6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constrains.maxHeight * .05,
          ),
          Container(
            height: constrains.maxHeight * .15,
            child: Text(lable),
          ),
        ],
      );
    });
  }
}
