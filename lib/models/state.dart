import 'package:my_isekai/models/todo.dart';

class StateModel {
  bool isLoading;
  UserPersonagem user;
  List monsters;

  StateModel({this.isLoading = false, this.user, this.monsters});
}
