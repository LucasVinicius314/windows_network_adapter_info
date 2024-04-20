import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'windows_network_adapter_info_platform_interface.dart';

/// An implementation of [WindowsNetworkAdapterInfoPlatform] that uses method channels.
class MethodChannelWindowsNetworkAdapterInfo extends WindowsNetworkAdapterInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('windows_network_adapter_info');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
