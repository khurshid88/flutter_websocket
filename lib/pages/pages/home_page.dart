import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mydemo/pages/service/socket_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var response = "No Data";

  _initSocketService() {
    SocketService.connectSocketChannel();

    /// Listen for all incoming data
    SocketService.channel.stream.listen((data) {
        setState(() {
          response = data.toString();
        });
      },
      onError: (error) {
        setState(() {
          response = error.toString();
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initSocketService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            response,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
