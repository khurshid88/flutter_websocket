import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mydemo/pages/service/socket_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    SocketService.connectSocketChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: SocketService.channel.stream,
          builder: (context, snapshot) {
            return Center(
              child: Text(
                snapshot.hasData ? '${snapshot.data}' : 'No data',
                style: TextStyle(fontSize: 22),
              ),
            );
          },
        ),
      ),
    );
  }
}
