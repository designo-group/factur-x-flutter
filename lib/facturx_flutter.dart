
import 'facturx_flutter_platform_interface.dart';

class FacturxFlutter {
  Future<String?> getPlatformVersion() {
    return FacturxFlutterPlatform.instance.getPlatformVersion();
  }
}
