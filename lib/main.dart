import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/config/app_colors.dart';
import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/utils.dart';
import 'core/widgets/others/loading_widget.dart';
import 'features/home/pages/rules_page.dart';

late AppsflyerSdk _appsflyerSdk;
String gex = '';
String amount = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await initializeAppsFlyer();
  await initFb();
  initPush();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

Future<void> initializeAppsFlyer() async {
  try {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: '4rfdbshjfhsdSDAbyju',
      appId: '5216312318',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
    );
    _appsflyerSdk = AppsflyerSdk(options);

    await _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    _appsflyerSdk.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK started successfully");
      },
      onError: (int code, String message) {
        print("AppsFlyer SDK failed to start: code $code, message: $message");
      },
    );
  } catch (e) {
    print("Error initializing AppsFlyer: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/bg/bg.png'), context);
    precacheImage(const AssetImage('assets/bg/bg1.jpg'), context);
    precacheImage(const AssetImage('assets/bg/bg2.jpg'), context);
    precacheImage(const AssetImage('assets/bg/bg3.jpg'), context);
    precacheImage(const AssetImage('assets/bg/bg4.jpg'), context);
    precacheImage(const AssetImage('assets/bg/bg5.png'), context);
    precacheImage(const AssetImage('assets/bg/bg6.png'), context);
    precacheImage(const AssetImage('assets/bg/bg7.png'), context);
    precacheImage(const AssetImage('assets/bg/bg8.png'), context);

    return FutureBuilder<bool>(
        future: checkCoins(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff43BCF0),
                            Color(0xff541896),
                            Color(0xff711280),
                          ],
                        ),
                      ),
                    ),
                    const LoadingWidget(),
                  ],
                ),
              ),
            );
          } else {
            if (snapshot.data == true && amount != '') {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: ShowCoins(
                  daily: amount,
                ),
              );
            } else {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: theme,
                routerConfig: routerConfig,
              );
            }
          }
        });
  }
}
