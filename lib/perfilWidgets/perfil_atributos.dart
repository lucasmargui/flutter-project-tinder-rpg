import 'package:flutter/material.dart';
import 'package:my_isekai/models/personagem_equipamento.dart';
import 'package:my_isekai/models/state.dart';
import 'package:my_isekai/models/todo.dart';
import 'package:my_isekai/models/zodiacos.dart';

import 'package:my_isekai/services/state_widget.dart';

class PerfilAtributo extends StatefulWidget {
  @override
  _PerfilAtributoState createState() => _PerfilAtributoState();
}

class _PerfilAtributoState extends State<PerfilAtributo> {
  StateModel appState;
  bool _changeProfile = false;
  bool isLoading = false;
  String descricao;

  Map<String, Map<String, int>> level = {
    'level': {
      '1': 150,
      '2': 225,
      '3': 337,
      '4': 506,
      '5': 759,
      '6': 1139,
      '7': 1708,
      '8': 2562,
      '9': 3844,
      '10': 5766,
      '11': 8649,
      '12': 12974,
      '13': 19461,
      '14': 29192,
      '15': 43789,
      '16': 65684,
      '17': 98526,
      '18': 147789,
      '19': 221683,
      '20': 332525,
      '21': 498788,
      '22': 748182,
      '23': 1122274,
      '24': 1683411,
      '25': 2525116,
      '26': 3787675
    }
  };

  Widget _buildFullName() {
    appState = StateWidget.of(context).state;
    final nome = appState?.user?.user_nome ?? '';
    final lvl = appState?.user?.user_level ?? '';

    TextStyle _nameTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w300,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
            child: Container(
          child: new Text(
            nome,
            overflow: TextOverflow.ellipsis,
            style: _nameTextStyle,
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Lvl:$lvl",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  Widget _buildAtributoItem(atribute, value, int bonus, valueTextStyle) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 10, bottom: 30.0, top: 30, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$atribute',
            style: valueTextStyle,
          ),
          Row(
            children: <Widget>[
              Text('${value.toInt()}'),
              bonus != null
                  ? bonus != 0
                      ? Text(
                          '+$bonus',
                          style: TextStyle(color: Colors.green[500]),
                        )
                      : Text('')
                  : Text('')
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAtributo(status) {
    int bonusStr = 0;
    int bonusAgi = 0;
    int bonusInt = 0;
    appState = StateWidget.of(context).state;
    PersonagemEquipamento equipamento = appState.user.personagemEquipamento;

    if (equipamento.weapon != null) {
      bonusStr += equipamento.weapon.strenght;
      bonusAgi += equipamento.weapon.agility;
      bonusInt += equipamento.weapon.agility;
    }
    if (equipamento.body != null) {
      bonusStr += equipamento.body.strenght;
      bonusAgi += equipamento.body.agility;
      bonusInt += equipamento.body.inteligence;
    }
    if (equipamento.cape != null) {
      bonusStr += equipamento.cape.strenght;
      bonusAgi += equipamento.cape.agility;
      bonusInt += equipamento.cape.inteligence;
    }
    if (equipamento.feet != null) {
      bonusStr += equipamento.feet.strenght;
      bonusAgi += equipamento.feet.agility;
      bonusInt += equipamento.feet.inteligence;
    }
    if (equipamento.head != null) {
      bonusStr += equipamento.head.strenght;
      bonusAgi += equipamento.head.agility;
      bonusInt += equipamento.head.inteligence;
    }
    if (equipamento.legs != null) {
      bonusStr += equipamento.legs.strenght;
      bonusAgi += equipamento.legs.agility;
      bonusInt += equipamento.legs.inteligence;
    }
    if (equipamento.neck != null) {
      bonusStr += equipamento.neck.strenght;
      bonusAgi += equipamento.neck.agility;
      bonusInt += equipamento.neck.inteligence;
    }

    if (equipamento.ring != null) {
      bonusStr += equipamento.ring.strenght;
      bonusAgi += equipamento.ring.agility;
      bonusInt += equipamento.ring.inteligence;
    }
    if (equipamento.shield != null) {
      bonusStr += equipamento.shield.strenght;
      bonusAgi += equipamento.shield.agility;
      bonusInt += equipamento.shield.inteligence;
    }

    TextStyle valueTextStyle = TextStyle(
      fontWeight: FontWeight.w300,
      color: Colors.grey,
      fontSize: 17.0,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildAtributoItem('Força', status.strenght, bonusStr, valueTextStyle),
        _buildAtributoItem(
            'Agilidade', status.agility, bonusAgi, valueTextStyle),
        _buildAtributoItem(
            'Inteligência', status.inteligence, bonusInt, valueTextStyle),
      ],
    );
  }

  _buildElementImage(int value) {
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

  Widget _buildTitulo(context) {
    Zodiaco signo = new Zodiaco();
    appState = StateWidget.of(context).state;
    UserPersonagem user = appState?.user ?? '';
    var idzodiac = user.personagemAtributos.zodiac;
    final titulo = appState?.user?.user_titulo ?? '';
    return Column(
      children: <Widget>[
        Text(
          '$titulo',
          style: TextStyle(fontSize: 17),
        ),
        Text(signo.zodiac['$idzodiac'])
      ],
    );
  }

  Widget _buildElementItem(status, context) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildElementImage(status.elementprimary),
          _buildTitulo(context),
          _buildElementImage(status.elementsecondary),
        ]);
  }

  Widget _buildElementContainer(status, screensize) {
    return Container(
        height: 60.0,
        margin: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: Color(0xFFEFF4F7),
        ),
        child: _buildElementItem(status, context));
  }

  Widget _buildStatusProfile(status, screenSize) {
    return Column(
      children: <Widget>[
        _buildElementContainer(status, screenSize),
        _buildAtributo(status),
      ],
    );
  }

  Widget _buildXpBar(context, diference) {
    return LinearProgressIndicator(
      value: diference,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildXpLvl(context, xpuser, levelup, Size screenSize) {
    return Text("$xpuser/$levelup");
  }

  Widget _profileWidgets(Size screenSize, context) {
    appState = StateWidget.of(context).state;
    UserPersonagem user = appState?.user ?? '';

    final userlevel = appState?.user?.user_level ?? '';

    final levelup = level['level']['$userlevel'] != null
        ? level['level']['$userlevel']
        : 999;
    var xpuser = user.personagemAtributos.xp;
    var diference = (xpuser / levelup);

    return Material(
      elevation: 5,
      child: Container(
        child: Column(
          children: <Widget>[
            _buildFullName(),
            SizedBox(
              height: 2,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _buildXpBar(context, diference),
                  _buildXpLvl(context, xpuser, levelup, screenSize),
                ],
              ),
            ),
            _buildStatusProfile(user.personagemAtributos, screenSize)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return _profileWidgets(screenSize, context);
  }
}
