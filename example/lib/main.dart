import 'package:flutter/material.dart';
import 'dart:async';

import 'package:windows_network_adapter_info/model/windows_network_adapter_info_data.dart';
import 'package:windows_network_adapter_info/windows_network_adapter_info.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<WindowsNetworkAdapterInfoData>>? _future;

  Widget _getContent() {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: snapshot.data!.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(e.adapterName),
                  Text(e.description),
                  Text(e.ipAddress),
                ],
              );
            }).toList(),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _future = WindowsNetworkAdapterInfo().getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(height: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _getContent(),
            ),
          ),
        ],
      ),
    );
  }
}
