import 'package:flutter/material.dart';
import 'package:meet_up/constants.dart';
import 'package:meet_up/size_config.dart';

class TextfieldotpPage extends StatefulWidget {
  final bool last;
  final bool first;
  TextfieldotpPage({Key key, this.last, this.first}) : super(key: key);

  @override
  _TextfieldotpPageState createState() => _TextfieldotpPageState();
}

class _TextfieldotpPageState extends State<TextfieldotpPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(90),
      width: getProportionateScreenWidth(70),
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && widget.last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && widget.first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 36,
          color: kTextColor,
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          fillColor: kSecondaryColor,
          filled: true,
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: kSecondaryColor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: kPrimaryColor),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
