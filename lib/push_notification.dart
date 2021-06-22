import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class PushNotification{

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  ///
  // final FirebaseMessaging messaging=FirebaseMessaging.instance;
  String token;
  //
  // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   // If you're going to use other Firebase services in the background, such as Firestore,
  //   // make sure you call `initializeApp` before using other Firebase services.
  //   print('Handling a background message ${message.messageId}');
  // }
  //
  // Future<void> configure() async {
  //
  //   await FirebaseMessaging.instance.subscribeToTopic("test");
  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );
  //
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     debugPrint("onMessage");
  //     // debugPrint(message.toString());
  //   });
  //
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //
  // }
///
  Future<void> getFirebaseToken() async {
    token= await firebaseMessaging.getToken();
    debugPrint("FirebaseToken: "+token);

    // requestNotificationPermissions();
  }

  void configure(){
    // firebaseMessaging.configure(
    //   onMessage: onMessageHandler,
    //   // onBackgroundMessage: Platform.isIOS ? null : backgroundMessageHandler,
    //   onLaunch: (Map<String, dynamic> message) async {
    //     debugPrint("onLaunch: $message");
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     debugPrint("onResume: $message");
    //   },
    // );
    getFirebaseToken();
  }

  Future<dynamic> onMessageHandler(Map<String, dynamic> message){
    debugPrint("onMessageHandler: "+message.toString());
  }

  requestNotificationPermissions() {
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      debugPrint("Settings registered: $settings");
    });
  }

}