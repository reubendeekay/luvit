import 'package:flutter/foundation.dart';
import 'package:luvit/constants.dart';
import 'package:luvit/models/user_model.dart';

class DatingProvider extends ChangeNotifier {
  // Add your code here

  final List<UserModel> _datingProfiles = [];
  List<UserModel> get datingProfiles => _datingProfiles;

  Future<void> getDatingProfiles() async {
    _datingProfiles.addAll(List.generate(5, (index) => defaultUserModel));

    notifyListeners();
  }

  void removeDatingProfile() {
    _datingProfiles.removeLast();

    notifyListeners();
  }
}
