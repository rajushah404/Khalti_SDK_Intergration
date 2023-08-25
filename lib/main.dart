import 'package:flutter/material.dart';
import 'package:khalti_api/Presentation/khalti_integration.dart';

import 'package:khalti_api/api_key.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: Api.testKey,
      builder: (context, navKey) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const KhaltiInit(),
          navigatorKey: navKey,
          localizationsDelegates: const [KhaltiLocalizations.delegate],
        );
      },
    );
  }
}
