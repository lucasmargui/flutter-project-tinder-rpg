import 'package:flutter/material.dart';
import 'package:my_isekai/models/zodiacos.dart';

class Elemento extends StatelessWidget {
  final int elementprimary;
  final int elementsecondary;
  final String name;
  final int zodiac;

  Elemento(
      {this.elementprimary, this.elementsecondary, this.name, this.zodiac});

  buildNome(nome, idzodiac) {
    var now = DateTime.now();
    var anofuturo = DateTime((now.year + 1), idzodiac, 21);
    var atual = DateTime(now.year, idzodiac, 21);
    var monthatual = now.month;

    int zodiacproximityuser;

    var zodiacatual = (now.difference(atual).inDays).toInt();
    var zodiacfuturo = (now.difference(anofuturo).inDays).toInt();

    if (zodiacatual.isNegative) {
      zodiacatual = zodiacatual * -1;
    }
    if (zodiacfuturo.isNegative) {
      zodiacfuturo = zodiacfuturo * -1;
    }

    if (zodiacatual < zodiacfuturo) {
      zodiacproximityuser = 182 - zodiacatual;
    } else if (zodiacatual > zodiacfuturo) {
      zodiacproximityuser = 182 - zodiacfuturo;
    } else {
      zodiacproximityuser = 182 - zodiacatual;
    }

    if (zodiacproximityuser.isNegative) {
      zodiacproximityuser = zodiacproximityuser * -1;
    }

    TextStyle _style = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w300,
    );

    TextStyle _stylezodiac = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w200,
    );

    Zodiaco signo = new Zodiaco();
    return Container(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            name,
            style: _style,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${signo.zodiac['$idzodiac']}',
                style: _stylezodiac,
              ),
              Text(
                '$zodiacproximityuser',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  static buildElementImage(int value) {
    switch (value) {
      case 0:
        return Image.asset(
          'assets/images/water.png',
          fit: BoxFit.cover,
          height: 50,
        );
        break;
      case 1:
        return Image.asset(
          'assets/images/fire.png',
          fit: BoxFit.cover,
          height: 50,
        );
        break;
      case 2:
        return Image.asset(
          'assets/images/earth.png',
          fit: BoxFit.cover,
          height: 50,
        );
        break;
      case 3:
        return Image.asset(
          'assets/images/air.png',
          fit: BoxFit.cover,
          height: 50,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w200,
    );

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        'Pri',
        style: _style,
      ),
      buildElementImage(elementprimary),
      buildNome(name, zodiac),
      buildElementImage(elementsecondary),
      Text('Sec', style: _style),
    ]);
  }
}
