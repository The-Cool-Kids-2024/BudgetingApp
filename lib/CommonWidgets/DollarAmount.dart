import 'package:flutter/cupertino.dart';
import 'package:test_flutter/CCTheme.dart';

class DollarAmount extends StatelessWidget {
  final double amount;
  final double fontSize;
  final Color textColor;
  final bool bold;
  const DollarAmount({Key? key, required this.amount, this.fontSize = 24, this.textColor = CCTheme.text, this.bold = true}) : super(key: key);

  String getDollars(double amount) => amount.floor().toString();
  String getCents(double amount) {
    var justCents = ((amount - amount.floor()) * 100).floor().toString();
    if (justCents.characters.length == 1) {
      return "0$justCents";
    }
    return justCents;
  }

  @override
  Widget build(BuildContext context) {

    // Copy stuff from widget.
    double dollarAmount = amount;
    String flatDollar = getDollars(dollarAmount);
    String flatCents = getCents(dollarAmount);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("\$", style: TextStyle(fontSize: fontSize / 2, color: textColor, fontWeight: bold? FontWeight.bold : FontWeight.normal)),
            Text("", style: TextStyle(fontSize: fontSize / 4),)
          ],
        ),
        Text(flatDollar, style: TextStyle(fontSize: fontSize, color: textColor, fontWeight: bold? FontWeight.bold : FontWeight.normal)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(flatCents, style: TextStyle(fontSize: fontSize / 2, color: textColor, fontWeight: bold? FontWeight.bold : FontWeight.normal)),
            Text("", style: TextStyle(fontSize: fontSize / 4),)
          ],
        ),

      ]
    );
  }
}
