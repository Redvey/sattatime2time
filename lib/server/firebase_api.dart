import 'package:firebase_messaging/firebase_messaging.dart';

Future<void>handleBackgroundMessage(RemoteMessage message) async{
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications()async {
    await _firebaseMessaging.requestPermission();
    final fCMToken =await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  }
}

// void handleMessage (RemoteMessage? message) {
//   if
//   (message == null) return;
//   // navigatorKey.currentState?. pushNamed (
//   //     NotificationScreen. route, arguments: message,);
//   }
//
// Future initPushNotifications () async {
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//   );
//
//   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//
// }

