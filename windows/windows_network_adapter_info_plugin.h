#ifndef FLUTTER_PLUGIN_WINDOWS_NETWORK_ADAPTER_INFO_PLUGIN_H_
#define FLUTTER_PLUGIN_WINDOWS_NETWORK_ADAPTER_INFO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace windows_network_adapter_info {

class WindowsNetworkAdapterInfoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  WindowsNetworkAdapterInfoPlugin();

  virtual ~WindowsNetworkAdapterInfoPlugin();

  // Disallow copy and assign.
  WindowsNetworkAdapterInfoPlugin(const WindowsNetworkAdapterInfoPlugin&) = delete;
  WindowsNetworkAdapterInfoPlugin& operator=(const WindowsNetworkAdapterInfoPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace windows_network_adapter_info

#endif  // FLUTTER_PLUGIN_WINDOWS_NETWORK_ADAPTER_INFO_PLUGIN_H_
