import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/userController.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/services/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<FirebaseUser> _firebaseUser = Rx<FirebaseUser>();

  FirebaseUser get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.onAuthStateChanged);
  }

  void createUser(String name, String email, String password) async {
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: _authResult.user.email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
