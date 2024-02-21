import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_isekai/models/monster.dart';
import 'package:my_isekai/models/personagem_equipamento.dart';
import 'package:my_isekai/models/item.dart';
import 'package:my_isekai/models/personagem_atributos.dart';
import 'package:my_isekai/models/state.dart';
import 'package:my_isekai/models/todo.dart';
import 'package:my_isekai/services/getmonster.dart';

class StateWidget extends StatefulWidget {
  final StateModel state;
  final Widget child;

  StateWidget({
    @required this.child,
    this.state,
  });

  static _StateWidgetState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_StateDataWidget>()
            as _StateDataWidget)
        .data;
  }

  @override
  _StateWidgetState createState() => new _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  StateModel state;

  @override
  void initState() {
    super.initState();
    if (widget.state != null) {
      state = widget.state;
    } else {
      state = new StateModel(isLoading: true);
      initUser();
    }
  }

  Future<Null> initUser() async {
    print('...user...');
    UserPersonagem user = new UserPersonagem();
    user.personagemAtributos = new PersonagemAtributos();

    PersonagemEquipamento equipamento = new PersonagemEquipamento();

    user.personagemEquipamento = equipamento;

    print('...monsters...');
    List getmonsters = await Monsters.getMonsters();

    setState(() {
      state.isLoading = false;
      state.user = user;
      state.monsters = getmonsters;
    });
    print("...setstate...");
  }

  Future<void> removeMonster(Monster monster) async {
    setState(() {
      state.monsters.removeWhere((objeto) => objeto.id == monster.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _StateDataWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _StateDataWidget extends InheritedWidget {
  final _StateWidgetState data;

  _StateDataWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  // Rebuild the widgets that inherit from this widget
  // on every rebuild of _StateDataWidget:
  @override
  bool updateShouldNotify(_StateDataWidget old) => true;
}
