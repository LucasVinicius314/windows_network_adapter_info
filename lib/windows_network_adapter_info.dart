import 'package:windows_network_adapter_info/model/windows_network_adapter_info_data.dart';

import 'windows_network_adapter_info_platform_interface.dart';

class WindowsNetworkAdapterInfo {
  Future<List<WindowsNetworkAdapterInfoData>> getInfo() async {
    return WindowsNetworkAdapterInfoPlatform.instance.getInfo();
  }
}
