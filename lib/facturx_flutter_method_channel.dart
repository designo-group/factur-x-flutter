import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'facturx_flutter_platform_interface.dart';

/// An implementation of [FacturxFlutterPlatform] that uses method channels.
class MethodChannelFacturxFlutter extends FacturxFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('facturx_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
