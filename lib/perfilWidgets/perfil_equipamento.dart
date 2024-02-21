import 'package:flutter/material.dart';
import 'package:my_isekai/models/personagem_equipamento.dart';
import 'package:my_isekai/models/item.dart';
import 'package:my_isekai/models/state.dart';
import 'package:my_isekai/services/state_widget.dart';

class PerfilEquipamento extends StatefulWidget {
  @override
  _PerfilEquipamentoState createState() => _PerfilEquipamentoState();
}

class _PerfilEquipamentoState extends State<PerfilEquipamento> {
  StateModel appState;

  Widget buildEquip(Item equipamento, String slot) {
    Color color;
    String name;
    TextStyle style;
    if (equipamento != null) {
      name = equipamento.name;
      if (equipamento.rarity == 1) {
        color = Colors.green[900];
      } else if (equipamento.rarity == 2) {
        color = Colors.yellow[700];
      } else {
        color = Colors.orange[900];
      }
      style = TextStyle(
        color: color,
        fontSize: 15,
        shadows: [
          Shadow(
            blurRadius: 15.0,
            color: color,
            offset: Offset(5.0, 5.0),
          ),
        ],
      );
    } else {
      name = 'Desequipado';
      color = Colors.grey[400];
      style = TextStyle(
        color: color,
        fontSize: 15,
        shadows: [
          Shadow(
            blurRadius: 15.0,
            color: color,
            offset: Offset(5.0, 5.0),
          ),
        ],
      );
    }

    return Card(
      child: ListTile(
        leading: Image.asset(
          'assets/images/$slot.png',
          scale: 2,
          color: Colors.black,
          height: 40,
        ),
        title: Text(
          "$name",
          style: style,
        ),
        subtitle: equipamento != null
            ? buildAtributos(equipamento, color)
            : Container(),
        onTap: null,
      ),
    );
  }

  buildAtributos(Item item, color) {
    List<Widget> widget = [];

    if (item.strenght != 0) {
      widget.add(Text('Força: +${item.strenght}',
          style: TextStyle(color: color, fontSize: 12)));
    }
    if (item.agility != 0) {
      widget.add(Text('Agilidade: +${item.agility}',
          style: TextStyle(color: color, fontSize: 12)));
    }
    if (item.inteligence != 0) {
      widget.add(Text('Inteligencia: +${item.inteligence}',
          style: TextStyle(color: color, fontSize: 12)));
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widget);
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    PersonagemEquipamento equipamento = appState.user.personagemEquipamento;

    return ListView(children: <Widget>[
      buildEquip(equipamento.head, 'head'),
      buildEquip(equipamento.neck, 'neck'),
      buildEquip(equipamento.body, 'body'),
      buildEquip(equipamento.cape, 'cape'),
      buildEquip(equipamento.weapon, 'weapon'),
      buildEquip(equipamento.shield, 'shield'),
      buildEquip(equipamento.hands, 'hands'),
      buildEquip(equipamento.ring, 'ring'),
      buildEquip(equipamento.legs, 'legs'),
      buildEquip(equipamento.feet, 'feet'),
    ]);
  }
}
