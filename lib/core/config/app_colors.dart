import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mymind_test/core/firebase_options.dart';
import 'package:mymind_test/main.dart';

class Fonts {
  static const String regular = 'Baloo2R';
  static const String medium = 'Baloo2M';
  static const String bold = 'Baloo2B';
}

Future<void> initFb() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  final jerx = FirebaseRemoteConfig.instance;
  await jerx.fetchAndActivate();
  gex = jerx.getString('cntry');
}
