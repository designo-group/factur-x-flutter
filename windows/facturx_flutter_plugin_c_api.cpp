#include "include/facturx_flutter/facturx_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "facturx_flutter_plugin.h"

void FacturxFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  facturx_flutter::FacturxFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
