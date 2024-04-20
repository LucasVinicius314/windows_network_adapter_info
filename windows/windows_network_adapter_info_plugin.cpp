#include "windows_network_adapter_info_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <iphlpapi.h>

#pragma comment(lib, "iphlpapi.lib")

#include <memory>
#include <sstream>

static flutter::EncodableList EncodeInfo(std::vector<std::map<std::string, std::string>> adapters)
{
  auto adapterList = flutter::EncodableList();

  for (auto adapter : adapters)
  {
    auto adapterMap = flutter::EncodableMap{};

    for (const auto &pair : adapter)
    {
      adapterMap[flutter::EncodableValue(pair.first)] = flutter::EncodableValue(pair.second);
    }

    adapterList.push_back(adapterMap);
  }

  return flutter::EncodableList(adapterList);
}

static std::vector<std::map<std::string, std::string>> GetInfo()
{
  ULONG ulOutBufLen = sizeof(IP_ADAPTER_INFO);
  PIP_ADAPTER_INFO pAdapterInfo = (IP_ADAPTER_INFO *)malloc(sizeof(IP_ADAPTER_INFO));
  if (GetAdaptersInfo(pAdapterInfo, &ulOutBufLen) == ERROR_BUFFER_OVERFLOW)
  {
    free(pAdapterInfo);
    pAdapterInfo = (IP_ADAPTER_INFO *)malloc(ulOutBufLen);
  }

  std::vector<std::map<std::string, std::string>> adapterVector;

  if (GetAdaptersInfo(pAdapterInfo, &ulOutBufLen) == NO_ERROR)
  {
    PIP_ADAPTER_INFO pAdapter = pAdapterInfo;
    while (pAdapter)
    {
      std::map<std::string, std::string> adapterMap;

      adapterMap["adapterName"] = pAdapter->AdapterName;
      adapterMap["description"] = pAdapter->Description;
      adapterMap["ipAddress"] = pAdapter->IpAddressList.IpAddress.String;

      adapterVector.push_back(adapterMap);

      pAdapter = pAdapter->Next;
    }
  }

  if (pAdapterInfo)
  {
    free(pAdapterInfo);
  }

  return adapterVector;
}

namespace windows_network_adapter_info
{

  // static
  void WindowsNetworkAdapterInfoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarWindows *registrar)
  {
    auto channel =
        std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            registrar->messenger(), "windows_network_adapter_info",
            &flutter::StandardMethodCodec::GetInstance());

    auto plugin = std::make_unique<WindowsNetworkAdapterInfoPlugin>();

    channel->SetMethodCallHandler(
        [plugin_pointer = plugin.get()](const auto &call, auto result)
        {
          plugin_pointer->HandleMethodCall(call, std::move(result));
        });

    registrar->AddPlugin(std::move(plugin));
  }

  WindowsNetworkAdapterInfoPlugin::WindowsNetworkAdapterInfoPlugin() {}

  WindowsNetworkAdapterInfoPlugin::~WindowsNetworkAdapterInfoPlugin() {}

  void WindowsNetworkAdapterInfoPlugin::HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
  {
    if (method_call.method_name().compare("getInfo") == 0)
    {
      result->Success(EncodeInfo(GetInfo()));
    }
    else
    {
      result->NotImplemented();
    }
  }

} // namespace windows_network_adapter_info
