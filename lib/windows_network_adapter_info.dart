
import 'windows_network_adapter_info_platform_interface.dart';

class WindowsNetworkAdapterInfo {
  Future<String?> getPlatformVersion() {
    return WindowsNetworkAdapterInfoPlatform.instance.getPlatformVersion();
  }
}
