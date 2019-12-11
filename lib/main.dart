import 'package:flutter/material.dart';
import 'package:network_aware_app/service/connectivity_service.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Aware',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Provider<ConnectivityService>(
          builder: (context) => ConnectivityService(),
          child: Consumer<ConnectivityService>(
            builder: (context, value, _) => Home(service: value,)
          ),
        ),
      ),
    );
  }
}
