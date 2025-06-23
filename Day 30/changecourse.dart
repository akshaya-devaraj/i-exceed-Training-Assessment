import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class ChangeCourse extends ChangeNotifier {
  String sub = '';
  void changeSubject(String nsub) {
    sub = nsub;
    notifyListeners();
  }
}