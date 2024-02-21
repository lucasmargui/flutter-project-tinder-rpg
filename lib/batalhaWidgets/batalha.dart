import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:my_isekai/batalhaWidgets/card_monster.dart';
import 'package:my_isekai/models/monster.dart';
import 'package:my_isekai/models/personagem_atributos.dart';

import 'package:my_isekai/models/state.dart';

import 'package:my_isekai/services/getmonster.dart';
import 'package:my_isekai/services/state_widget.dart';

import 'package:my_isekai/widgets/element.dart';

class Batalha extends StatefulWidget {
  final String userId;
  final GlobalKey scaffoldstate;
  final Function loading;
  final int distance;

  Batalha({this.userId, this.loading, this.scaffoldstate, this.distance});
  @override
  BatalhaState createState() =>
      new BatalhaState(scaffoldstate: scaffoldstate, distance: distance);
}

class BatalhaState extends State<Batalha> with SingleTickerProviderStateMixin {
  int distance;
  GlobalKey scaffoldstate;
  BatalhaState({this.scaffoldstate, this.distance});

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

  StateModel appState;
  int flag = 0;
  double opacityvalue = 0;
  bool isLoading = false;
  double heightValue = 1;
  bool loadingBattle = false;

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void attMonsters() async {
    if (isLoading != true) {
      setState(() {
        isLoading = true;
      });
    }

    appState = StateWidget.of(context).state;
    List getmonsters = await Monsters.getMonsters();
    setState(() {
      StateWidget.of(context).state.monsters = getmonsters;
      isLoading = false;
    });
  }

  void removebattleMonster(Monster monster, BuildContext context) {
    setState(() {
      StateWidget.of(context).removeMonster(monster);
    });
  }

  void changeOpacity() {
    if (opacityvalue == 1) {
      setState(() {
        opacityvalue = 0;
        heightValue = 1;
      });
    } else {
      setState(() {
        opacityvalue = 1;
        heightValue = 215;
      });
    }
  }

  Widget listView(context, monsters) {
    timeDilation = 0.4;
    double initialBottom = 15.0;
    var dataLength = monsters.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = 0;
    return monsters.isNotEmpty
        ? ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return cardMonster(
                monsters[index],
                backCardWidth + 10,
                context,
                removebattleMonster,
                index,
              );
            },
            itemCount: monsters.length,
          )
        : Text('Nenhum  monstro na area');
  }

  Widget buildAnimatedOpacity(PersonagemAtributos status) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: heightValue,
      child: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: opacityvalue,
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [
                0.1,
              ],
              colors: [
                Color.fromRGBO(60, 100, 200, 0.5),
              ],
            ),
            borderRadius: new BorderRadius.circular(8.0),
          ),
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                Elemento(
                  elementprimary: status.elementprimary,
                  elementsecondary: status.elementsecondary,
                  name: '',
                  zodiac: status.zodiac,
                ),
                //Atributo.buildAtributo(status),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/water.png',
                        fit: BoxFit.cover,
                        height: 25,
                      ),
                      Text(
                        '>>>>',
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset(
                        'assets/images/fire.png',
                        fit: BoxFit.cover,
                        height: 25,
                      ),
                      Text(
                        '>>>>',
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset(
                        'assets/images/air.png',
                        fit: BoxFit.cover,
                        height: 25,
                      ),
                      Text(
                        '>>>>',
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset(
                        'assets/images/earth.png',
                        fit: BoxFit.cover,
                        height: 25,
                      ),
                      Text(
                        '>>>>',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/water.png',
                        fit: BoxFit.cover,
                        height: 25,
                      ),
                      Text(
                        '≠',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Image.asset(
                        'assets/images/air.png',
                        fit: BoxFit.cover,
                        height: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/fire.png',
                        fit: BoxFit.cover,
                        height: 25,
                      ),
                      Text(
                        '≠',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Image.asset(
                        'assets/images/earth.png',
                        fit: BoxFit.cover,
                        height: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'v',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Empates e elementos divergentes levam em consideração a força do seu signo, quanto mais próximo do mês, mais forte será!',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget buttonInfo(height) {
    return Positioned(
        left: -10,
        top: (height - 150),
        child: RaisedButton(
            color: Colors.blue,
            elevation: 5,
            shape: new CircleBorder(),
            padding: new EdgeInsets.all(0.0),
            onPressed: () {
              changeOpacity();
            },
            child: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            )));
  }

  Widget buttonAtualiza() {
    return RaisedButton(
        color: Colors.green,
        // onPressed: () => attMonsters(),
        onPressed: () => null,
        child: Text(
          'Atualizar mapa da area',
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget buildStack(status, height, monstersAndPlayers) {
    Size screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    appState = StateWidget.of(context).state;
    var status = appState.user.personagemAtributos;
    var monsters = appState.monsters;
    var img = appState.user.user_foto;
    var nome = appState.user.user_nome;
    return Stack(
      children: <Widget>[
        listView(context, monsters),
        buildAnimatedOpacity(status),
        buttonInfo(height),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    appState = StateWidget.of(context).state;
    var status = appState.user.personagemAtributos;
    var img = appState.user.user_foto;
    var nome = appState.user.user_nome;
    return Stack(
      children: <Widget>[
        new Center(
            child: StateWidget.of(context).state.monsters.isNotEmpty
                ? buildStack(
                    status, height, StateWidget.of(context).state.monsters)
                : StateWidget.of(context).state.monsters.isEmpty &&
                        isLoading == true
                    ? CircularProgressIndicator()
                    : buttonAtualiza()),
      ],
    );
  }
}
