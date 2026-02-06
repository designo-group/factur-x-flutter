import 'dart:io';
import 'dart:typed_data';
import 'package:facturx_flutter/src/rust/frb_generated.dart';
import 'package:facturx_flutter/src/rust/api.dart' as rust_api;
import 'package:facturx_flutter/src/rust/models.dart';

class FacturXService {
  static Future<void> init() async {
    await RustLib.init();
  }

  Future<Uint8List> generate({
    required String pdfPath,
    required String xmlPath,
    GenerateConfig? config,
  }) async {
    final Uint8List pdfBytes = await File(pdfPath).readAsBytes();
    final Uint8List xmlBytes = await File(xmlPath).readAsBytes();

    final finalConfig = config ?? GenerateConfig(
      flavor: Flavor.facturX,
      level: Level.basic,
      checkXsd: false,
      afrelationship: "data",
      xmpCompression: true,
      attachments: {}, 
    );

    try {
      final resultBytes = await rust_api.generateFacturx(
        pdfBytes: pdfBytes,
        xmlBytes: xmlBytes,
        config: finalConfig,
      );
      
      final Uint8List bytes = await rust_api.unpackResultVec(result: resultBytes);
      return bytes;
    } catch (e) {
      throw Exception("Factur-X Error: $e");
    }
  }
}