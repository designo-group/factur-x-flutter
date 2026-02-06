import 'package:flutter_test/flutter_test.dart';
import 'package:facturx_flutter/facturx_flutter.dart';
import 'package:facturx_flutter/facturx_flutter_platform_interface.dart';
import 'package:facturx_flutter/facturx_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFacturxFlutterPlatform
    with MockPlatformInterfaceMixin
    implements FacturxFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FacturxFlutterPlatform initialPlatform = FacturxFlutterPlatform.instance;

  test('$MethodChannelFacturxFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFacturxFlutter>());
  });

  test('getPlatformVersion', () async {
    FacturxFlutter facturxFlutterPlugin = FacturxFlutter();
    MockFacturxFlutterPlatform fakePlatform = MockFacturxFlutterPlatform();
    FacturxFlutterPlatform.instance = fakePlatform;

    expect(await facturxFlutterPlugin.getPlatformVersion(), '42');
  });
}
