import 'package:flutter_test/flutter_test.dart';
import 'package:windows_network_adapter_info/model/windows_network_adapter_info_data.dart';
import 'package:windows_network_adapter_info/windows_network_adapter_info.dart';
import 'package:windows_network_adapter_info/windows_network_adapter_info_platform_interface.dart';
import 'package:windows_network_adapter_info/windows_network_adapter_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWindowsNetworkAdapterInfoPlatform
    with MockPlatformInterfaceMixin
    implements WindowsNetworkAdapterInfoPlatform {
  @override
  Future<List<WindowsNetworkAdapterInfoData>> getInfo() {
    return Future.value([]);
  }
}

void main() {
  final initialPlatform = WindowsNetworkAdapterInfoPlatform.instance;

  test('$MethodChannelWindowsNetworkAdapterInfo is the default instance', () {
    expect(initialPlatform,
        isInstanceOf<MethodChannelWindowsNetworkAdapterInfo>());
  });

  test('getInfo', () async {
    final windowsNetworkAdapterInfoPlugin = WindowsNetworkAdapterInfo();
    final fakePlatform = MockWindowsNetworkAdapterInfoPlatform();
    WindowsNetworkAdapterInfoPlatform.instance = fakePlatform;

    expect(await windowsNetworkAdapterInfoPlugin.getInfo(), []);
  });
}
