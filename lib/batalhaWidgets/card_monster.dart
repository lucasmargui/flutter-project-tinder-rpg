import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:my_isekai/models/monster.dart';
import 'package:my_isekai/batalhaWidgets/atributoMonster.dart';
import 'package:my_isekai/widgets/element.dart';

Widget cardMonster(Monster monster, double cardWidth, BuildContext context,
    Function removebattleMonster, int index) {
  Size screenSize = MediaQuery.of(context).size;

  Color colorDificulty;

  if (monster.difficulty == 'S') {
    colorDificulty = Colors.red[900];
  } else if (monster.difficulty == 'A') {
    colorDificulty = Colors.yellow[700];
  } else if (monster.difficulty == 'B') {
    colorDificulty = Colors.blue[700];
  } else if (monster.difficulty == 'C') {
    colorDificulty = Colors.green[700];
  } else {
    colorDificulty = Colors.grey[400];
  }

  TextStyle bioTextStyle = TextStyle(
    fontFamily: 'Spectral',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: Colors.grey[300],
    fontSize: 14.0,
  );

  return Column(
    children: <Widget>[
      new Dismissible(
        key: Key(UniqueKey().toString()),
        crossAxisEndOffset: -0.3,
        confirmDismiss: (direction) async {
          return false;
        },
        child: new GestureDetector(
          onTap: () {
            print('abrir perfil do monstro');
          },
          child: new Card(
            color: Colors.transparent,
            elevation: 4.0,
            child: new Container(
              alignment: Alignment.center,
              width: screenSize.width / 1.05 + cardWidth,
              height: screenSize.height / 1.35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.1, 0.2],
                  colors: [Colors.black, colorDificulty],
                ),
                borderRadius: new BorderRadius.circular(8.0),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(monster.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                      )),
                  new AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: screenSize.width / 1.05 + cardWidth,
                    height: screenSize.height / 1.8,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: new Radius.circular(8.0),
                          topRight: new Radius.circular(8.0)),
                    ),
                    child: Image.network(
                      monster.img,
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Elemento(
                        elementprimary: monster.elementprimary,
                        elementsecondary: monster.elementsecondary,
                        name: '',
                        zodiac: monster.zodiac,
                      ),
                      AtributoMonstro.buildAtributo(monster)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      new Container(
          width: screenSize.width / 1.2 + cardWidth,
          height: screenSize.height / 1.7 - screenSize.height / 2.2,
          alignment: Alignment.center,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                  color: Colors.red,
                  elevation: 5,
                  shape: new CircleBorder(),
                  padding: new EdgeInsets.all(0.0),
                  onPressed: () {
                    removebattleMonster(monster, context);
                  },
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: ImageIcon(
                      AssetImage(
                        "assets/images/run.png",
                      ),
                      color: Colors.white,
                      size: 60,
                    ),
                  )),
              new RaisedButton(
                color: Colors.blue[600],
                elevation: 5,
                shape: new CircleBorder(),
                padding: new EdgeInsets.all(0.0),
                onPressed: () {
                  removebattleMonster(monster, context);
                },
                child: ImageIcon(
                  AssetImage(
                    "assets/images/dice.png",
                  ),
                  color: Colors.white,
                  size: 70,
                ),
              ),
              new RaisedButton(
                color: Colors.green,
                elevation: 5,
                shape: new CircleBorder(),
                padding: new EdgeInsets.all(0.0),
                onPressed: () {
                  removebattleMonster(monster, context);
                },
                child: ImageIcon(
                  AssetImage(
                    "assets/images/lutar.png",
                  ),
                  color: Colors.white,
                  size: 60,
                ),
              )
            ],
          ))
    ],
  );
}
