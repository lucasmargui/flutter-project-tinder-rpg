import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_isekai/models/state.dart';
import 'package:my_isekai/models/todo.dart';
import 'package:my_isekai/perfilWidgets/perfil_atributos.dart';
import 'package:my_isekai/perfilWidgets/perfil_equipamento.dart';

import 'package:my_isekai/services/state_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Perfil extends StatefulWidget {
  final Function loading;
  Perfil({this.loading});
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> with SingleTickerProviderStateMixin {
  final themeColor = Color(0xfff5a623);
  final primaryColor = Color(0xff203152);
  final greyColor = Color(0xffaeaeae);
  final greyColor2 = Color(0xffE8E8E8);

  bool _myProfile = true;

  StateModel appState;
  SharedPreferences prefs;

  String id;
  String status;
  String photoUrl;

  String idprofile;
  String imageprofile;

  bool isLoading = false;
  File avatarImageFile;

  double screenDivideHeight = 2;
  double screenDivideWidth = 1.5;
  double heightImageDivide = 2.5;
  double paddingImage = 30;

  TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(_setActiveTabIndex);
    super.initState();
  }

  void _setActiveTabIndex() {
    if (tabController.index > 0) {
      setState(() {
        screenDivideHeight = 3.5;
        screenDivideWidth = 1.75;
        heightImageDivide = 3.5;
        paddingImage = 100;
      });
    } else {
      setState(() {
        screenDivideHeight = 2.0;
        screenDivideWidth = 1.5;
        heightImageDivide = 2.5;
        paddingImage = 30;
      });
    }

    print(tabController.index);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: new ExactAssetImage('assets/images/treasuremap.jpg'),
              fit: BoxFit.cover)),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Material(
          elevation: 5,
          shape: new CircleBorder(),
          child: IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: primaryColor.withOpacity(0.5),
            ),
            onPressed: null,
            splashColor: Colors.transparent,
            highlightColor: greyColor,
            iconSize: 40.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Material(
          elevation: 5,
          shape: new CircleBorder(),
          child: IconButton(
            icon: Icon(
              Icons.settings,
              color: primaryColor.withOpacity(0.5),
            ),
            onPressed: () => null,
            splashColor: Colors.transparent,
            highlightColor: greyColor,
            iconSize: 40.0,
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    Size screenSize = MediaQuery.of(context).size;
    appState = StateWidget.of(context).state;
    final foto = appState?.user?.user_foto ?? '';

    return Center(
      child: ListView(
        children: <Widget>[
          AnimatedContainer(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.only(left: paddingImage, right: paddingImage),
              height: screenSize.height / heightImageDivide,
              child: isLoading
                  ? Container(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    )
                  : foto != ''
                      ? ClipRRect(
                          borderRadius: new BorderRadius.circular(40.0),
                          child: Image.network(
                            foto,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                        )
                      : Icon(
                          Icons.person,
                          size: screenSize.height / 2.5,
                          color: Colors.grey,
                        )),
        ],
      ),
    );
  }

  Widget _profileBody(Size screenSize, context) {
    appState = StateWidget.of(context).state;
    UserPersonagem userLocal = appState.user;
    return Column(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: screenSize.height / screenDivideHeight,
          child: Stack(
            children: <Widget>[
              _buildCoverImage(screenSize),
              _buildProfileImage(),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [PerfilAtributo(), PerfilEquipamento()],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(''),
                ),
                Tab(
                  child: Text(''),
                ),
                Tab(
                  child: Text(''),
                )
              ],
              indicatorColor: Colors.white,
              controller: tabController,
            ),
          )),
      body: SafeArea(
        child: Center(
          child: Container(
            width: (screenSize.width),
            child: _profileBody(screenSize, context),
          ),
        ),
      ),
    );
  }
}
