import 'package:get/get.dart';
import 'package:myapp/users/config/userPreferences/user_preferences.dart';
import 'package:myapp/users/models/user.dart';

class CurrentUser extends GetxController {
  Rx<User> _currentUser = User(0, "", "", "", "").obs;

  User get user => _currentUser.value;

  getUserInfo() async {
    User? getUserInfoFromLocalStorage =
        await RememberUserPreferences.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }
}
