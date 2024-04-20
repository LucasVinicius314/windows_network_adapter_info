import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'windows_network_adapter_info_method_channel.dart';

abstract class WindowsNetworkAdapterInfoPlatform extends PlatformInterface {
  /// Constructs a WindowsNetworkAdapterInfoPlatform.
  WindowsNetworkAdapterInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static WindowsNetworkAdapterInfoPlatform _instance = MethodChannelWindowsNetworkAdapterInfo();

  /// The default instance of [WindowsNetworkAdapterInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelWindowsNetworkAdapterInfo].
  static WindowsNetworkAdapterInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WindowsNetworkAdapterInfoPlatform] when
  /// they register themselves.
  static set instance(WindowsNetworkAdapterInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
