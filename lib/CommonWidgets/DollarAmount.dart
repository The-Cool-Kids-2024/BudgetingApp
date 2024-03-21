import 'package:flutter/cupertino.dart';
import 'package:test_flutter/CCTheme.dart';

class DollarAmount extends StatefulWidget {
  final double amount;
  final double fontSize;
  final Color textColor;
  const DollarAmount({Key? key, required this.amount, this.fontSize = 24, this.textColor = CCTheme.text}) : super(key: key);
  @override
  State<DollarAmount> createState() => _DollarAmountState(amount, fontSize, textColor);
}

class _DollarAmountState extends State<DollarAmount> {
  double dollarAmount = 0.0;
  double fontSize = 24;
  Color textColor = CCTheme.text;
  String flatDollar = "";
  String flatCents = "";
  _DollarAmountState(this.dollarAmount, this.fontSize, this.textColor);

  @override
  void initState() {
    int justDollar = dollarAmount.floor();
    int justCents = ((dollarAmount - justDollar) * 100).floor();
    flatDollar = justDollar.toString();
    flatCents = justCents.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("\$", style: TextStyle(fontSize: fontSize / 2, color: textColor, fontWeight: FontWeight.bold)),
            Text("", style: TextStyle(fontSize: fontSize / 4),)
          ],
        ),
        Text(flatDollar, style: TextStyle(fontSize: fontSize, color: textColor, fontWeight: FontWeight.bold)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(flatCents, style: TextStyle(fontSize: fontSize / 2, color: textColor, fontWeight: FontWeight.bold )),
            Text("", style: TextStyle(fontSize: fontSize / 4),)
          ],
        ),

      ]
    );
  }
}
