import 'package:flutter_test/flutter_test.dart';
import 'package:windows_network_adapter_info/windows_network_adapter_info.dart';
import 'package:windows_network_adapter_info/windows_network_adapter_info_platform_interface.dart';
import 'package:windows_network_adapter_info/windows_network_adapter_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWindowsNetworkAdapterInfoPlatform
    with MockPlatformInterfaceMixin
    implements WindowsNetworkAdapterInfoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WindowsNetworkAdapterInfoPlatform initialPlatform = WindowsNetworkAdapterInfoPlatform.instance;

  test('$MethodChannelWindowsNetworkAdapterInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWindowsNetworkAdapterInfo>());
  });

  test('getPlatformVersion', () async {
    WindowsNetworkAdapterInfo windowsNetworkAdapterInfoPlugin = WindowsNetworkAdapterInfo();
    MockWindowsNetworkAdapterInfoPlatform fakePlatform = MockWindowsNetworkAdapterInfoPlatform();
    WindowsNetworkAdapterInfoPlatform.instance = fakePlatform;

    expect(await windowsNetworkAdapterInfoPlugin.getPlatformVersion(), '42');
  });
}
