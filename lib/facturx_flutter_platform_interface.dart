import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'facturx_flutter_method_channel.dart';

abstract class FacturxFlutterPlatform extends PlatformInterface {
  /// Constructs a FacturxFlutterPlatform.
  FacturxFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static FacturxFlutterPlatform _instance = MethodChannelFacturxFlutter();

  /// The default instance of [FacturxFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelFacturxFlutter].
  static FacturxFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FacturxFlutterPlatform] when
  /// they register themselves.
  static set instance(FacturxFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
