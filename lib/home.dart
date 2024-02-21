import 'package:flutter/material.dart';
import 'package:my_isekai/batalhaWidgets/batalha.dart';
import 'package:my_isekai/loading.dart';
import 'package:my_isekai/models/state.dart';
import 'package:my_isekai/perfilWidgets/perfil.dart';
import 'package:my_isekai/services/state_widget.dart';
import 'dart:ui' as ui;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loadingVisible = false;
  GlobalKey _scaffold = GlobalKey();
  StateModel appState;
  int _selectedIndex = 0;
  Stream stream;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomnavigationWidget() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group, color: Colors.white),
            title: Text(
              'Perfil',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                "assets/images/lutar.png",
              ),
              color: Colors.white,
            ),
            title: Text(
              'Battles',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.black);
  }

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    return false; // return true if the route to be popped
  }

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    List<Widget> _widgetOptions = <Widget>[
      Perfil(loading: _changeLoadingVisible),
      Batalha(loading: _changeLoadingVisible),
    ];
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: LoadingScreen(
        inAsyncCall: _loadingVisible,
        child: Scaffold(
          key: _scaffold,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: new ExactAssetImage('assets/images/isekai.jpg'),
                    fit: BoxFit.cover)),
            child: new BackdropFilter(
              filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: SafeArea(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: _bottomnavigationWidget(),
        ),
      ),
    );
  }
}
