#include "include/windows_network_adapter_info/windows_network_adapter_info_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "windows_network_adapter_info_plugin.h"

void WindowsNetworkAdapterInfoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  windows_network_adapter_info::WindowsNetworkAdapterInfoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
