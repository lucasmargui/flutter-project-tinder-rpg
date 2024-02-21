import 'package:flutter/material.dart';

import 'package:my_isekai/loading.dart';
import 'package:my_isekai/services/state_widget.dart';

class AwaitPage extends StatefulWidget {
  _AwaitPageState createState() => _AwaitPageState();
}

class _AwaitPageState extends State<AwaitPage> {
  bool _autoValidate = false;
  bool _loadingVisible = false;
  @override
  void initState() {
    super.initState();
  }

  cancel() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  Widget build(BuildContext context) {
    cancel();
    final logo = Hero(
      tag: 'logo',
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 60.0,
          child: ClipOval(
            child: Image.asset(
              'assets/images/dragon.png',
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
              color: Colors.indigo,
            ),
          )),
    );

    final namelogo = FlatButton(
      onPressed: () {},
      child: Text(
        'MyIsekai',
        style: TextStyle(color: Colors.indigo, fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );

    return Scaffold(
      body: LoadingScreen(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: new ExactAssetImage('assets/images/isekai.jpg'),
                    fit: BoxFit.cover)),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    logo,
                    SizedBox(height: 12.0),
                    namelogo,
                    CircularProgressIndicator(),
                    RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: cancel,
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          inAsyncCall: _loadingVisible),
    );
  }
}
