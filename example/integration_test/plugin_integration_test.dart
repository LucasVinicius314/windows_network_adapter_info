// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:windows_network_adapter_info/windows_network_adapter_info.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getInfo test', (WidgetTester tester) async {
    final plugin = WindowsNetworkAdapterInfo();
    final info = await plugin.getInfo();

    expect(info.isNotEmpty, true);
  });
}
