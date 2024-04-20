import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:windows_network_adapter_info/model/windows_network_adapter_info_data.dart';

import 'windows_network_adapter_info_platform_interface.dart';

/// An implementation of [WindowsNetworkAdapterInfoPlatform] that uses method channels.
class MethodChannelWindowsNetworkAdapterInfo
    extends WindowsNetworkAdapterInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('windows_network_adapter_info');

  @override
  Future<List<WindowsNetworkAdapterInfoData>> getInfo() async {
    return methodChannel.invokeListMethod<Map>('getInfo').then((value) {
      return (value ?? []).map((e) {
        return WindowsNetworkAdapterInfoData.fromJson(e.cast<String, String>());
      }).toList();
    });
  }
}
