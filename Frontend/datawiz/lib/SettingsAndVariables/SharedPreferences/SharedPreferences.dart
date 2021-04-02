import 'package:shared_preferences/shared_preferences.dart';

Future<int> getIntFromSharedPref() async {
  final prefs = await SharedPreferences.getInstance();
  final startupNumber = prefs.getInt('startupNumber');
  if (startupNumber == null) return 0;
  return startupNumber;
}

Future<void> resetCounter() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('startupNumber', 0);
}

Future<int> incrementStartup() async {
  final prefs = await SharedPreferences.getInstance();

  int lastStartupNumber = await getIntFromSharedPref();
  int currentStartupNumber = ++lastStartupNumber;

  await prefs.setInt('startupNumber', currentStartupNumber);

  return currentStartupNumber;
}