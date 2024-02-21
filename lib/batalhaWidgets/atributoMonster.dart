import 'package:flutter/material.dart';
import 'package:my_isekai/models/personagem_equipamento.dart';
import 'package:my_isekai/models/monster.dart';

class AtributoMonstro {
  static buildAtributo(Monster monster) {
    int bonusStr = 0;
    int bonusAgi = 0;
    int bonusInt = 0;

    TextStyle bioTextStyle = TextStyle(
      fontWeight: FontWeight.w300, //try changing weight to w500 if not thin
      color: Colors.white,
      fontSize: 16.0,
    );
    TextStyle valueTextStyle = TextStyle(
      fontWeight: FontWeight.w300, //try changing weight to w500 if not thin
      color: Colors.white,
      fontSize: 16.0,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildAtributoItem('Força', monster.strength, bonusStr, bioTextStyle,
            valueTextStyle, Colors.red),
        buildAtributoItem('Agilidade', monster.agility, bonusAgi, bioTextStyle,
            valueTextStyle, Colors.green),
        buildAtributoItem('Inteligencia', monster.inteligence, bonusInt,
            bioTextStyle, valueTextStyle, Colors.blueAccent),
      ],
    );
  }

  static buildAtributoItem(
      atribute, value, bonus, bioTextStyle, valueTextStyle, color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$atribute',
          style: bioTextStyle,
        ),
        OutlineButton(
          borderSide: BorderSide(color: color),
          shape: CircleBorder(),
          child: Text(
            '${(value + bonus).toInt()}',
            style: valueTextStyle,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
