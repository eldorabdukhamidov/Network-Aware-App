import 'package:flutter/material.dart';
import 'package:network_aware_app/service/connectivity_service.dart';
import 'package:provider/provider.dart';

import 'enums/connectivity_status.dart';

class Home extends StatefulWidget {
  final ConnectivityService service;

  Home({@required this.service});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>.value(
      value: widget.service.connectionStatusController.stream,
      child: Consumer<ConnectivityStatus>(
        builder: (ctx, value, _) {
          if(value == null){
            return Container();
          }
          return Center(
            child: Text("You have ${_getStatus(value)} connection"),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.service.disposeStream();
    super.dispose();
  }

  String _getStatus(ConnectivityStatus value) {
    switch(value){

      case ConnectivityStatus.WiFi:
        return "Wifi";
      case ConnectivityStatus.Cellular:
        return "cellular";
      case ConnectivityStatus.Offline:
        return "offline";
    }
  }
}
