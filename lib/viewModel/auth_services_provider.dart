import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/LoginController/login_controllers.dart';
import 'package:the_fin_news/model/LoginModel/login_api_res_model.dart';
import 'package:the_fin_news/model/LoginModel/update_profile_api_res_model.dart';
import 'package:the_fin_news/services/hive_database.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';

class AuthServices extends ChangeNotifier {
  AuthServices() {
    _checkAuthentication();
  }

  bool _isUserLoggedIn = false;
  bool get isUserLoggedIn => _isUserLoggedIn;

  bool _isLoginDone = false;
  bool get isLoginDone => _isLoginDone;

  /// Check if user is authenticated by checking stored access token
  void _checkAuthentication() async {
    debugPrint('Check the auth token');
    String? token = HiveDatabase.getToken() ?? ''; // Fetch token from Hive
    if (token.isNotEmpty) {
      _isLoginDone = true;
      notifyListeners();
    } else {
      _isLoginDone = false;
      notifyListeners();
    }
  }

  void setUserLoggedIn(bool value) {
    _isUserLoggedIn = value;
    notifyListeners();
  }

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _updateEmailController = TextEditingController();
  TextEditingController get updateEmailController => _updateEmailController;

  final TextEditingController _updateNameController = TextEditingController();
  TextEditingController get updateNameController => _updateNameController;

  final LoginControllers _loginControllers = LoginControllers();
  LoginApiResModel loginApiResModel = LoginApiResModel();
  ProfileUpdateApiResModel profileUpdateApiResModel =
      ProfileUpdateApiResModel();

  /// LOGIN USER
  void loginUser(context) async {
    setUserLoggedIn(true);
    loginApiResModel = await _loginControllers.userLogin(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    if (loginApiResModel.success == true) {
      HiveDatabase.saveToken(loginApiResModel.data?.token ?? '');
      HiveDatabase.saveUserEmail(loginApiResModel.data?.email ?? "");
      HiveDatabase.saveUserName(loginApiResModel.data?.name ?? "");
      HiveDatabase.saveStudentId("${loginApiResModel.data?.studentID}");
      HiveDatabase.saveBatchId("${loginApiResModel.data?.batchId}");
      setUserLoggedIn(false);
      _checkAuthentication();
      showSnackBar(context, "${loginApiResModel.msg}");
      notifyListeners();
      Navigator.pop(context);
    } else {
      showSnackBar(context, "${loginApiResModel.msg}");
      setUserLoggedIn(false);
      notifyListeners();
    }
  }

  bool _isUserUpdating = false;
  bool get isUserUpdating => _isUserUpdating;

  /// UPDATE PROFILE USER
  void updateProfile(context) async {
    _isUserUpdating = true;
    notifyListeners();
    profileUpdateApiResModel = await _loginControllers.updateProfile(
      updatedName: _updateNameController.text.trim(),
      updatedEmail: _updateEmailController.text.trim(),
    );
    if (profileUpdateApiResModel.status == 200) {
      HiveDatabase.saveUserEmail(profileUpdateApiResModel.record?.email ?? "");
      HiveDatabase.saveUserName(profileUpdateApiResModel.record?.name ?? "");
      _isUserUpdating = false;
      showSnackBar(context, "${profileUpdateApiResModel.msg}");
      notifyListeners();
      Navigator.pop(context);
    } else {
      _isUserUpdating = false;
      showSnackBar(context, "${profileUpdateApiResModel.msg}");
      notifyListeners();
    }
  }

  void logOut() async {
    /// Handle Logout
    await HiveDatabase.clearData();
    _checkAuthentication();
    notifyListeners();
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColor.secondaryColor,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        bottom: 50,
        left: 20,
        right: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 10,
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
