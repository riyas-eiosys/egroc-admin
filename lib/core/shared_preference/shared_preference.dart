import 'package:shared_preferences/shared_preferences.dart';

const String _isLoggedIn = 'isLoggedIn';

const String _authToken = 'authToken';

class SharedPreferenceRepo {
  static late SharedPreferences _pref;
  static SharedPreferenceRepo? _instance;

  SharedPreferenceRepo._(SharedPreferences pref) {
    _pref = pref;
  }
  static SharedPreferenceRepo get instance => _instance!;

  static Future<void> initialize() async {
    _instance ??= SharedPreferenceRepo._(await SharedPreferences.getInstance());
  }

  set isLoggedIn(bool loggedIn) => _pref.setBool(_isLoggedIn, loggedIn);

  bool get isLoggedIn => _pref.getBool(_isLoggedIn) ?? false;

  set authToken(String token) => _pref.setString(_authToken, token);

  String get authToken => _pref.getString(_authToken) ?? '';

  void logout() {
    _pref.remove(_authToken);
    _pref.setBool(_isLoggedIn, false);
    _pref.clear();
  }
}
