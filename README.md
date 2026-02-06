# factur-x-flutter

A Flutter plugin that leverages a **Rust core** to generate Factur-X (ZUGFeRD) compliant PDF invoices.

## Features

* **Fast**: Uses Rust via FFI for heavy XML/PDF processing.
* **Simple API**: Single method call to attach Factur-X data to your PDF.
* **Cross-Platform**: Supports Android and iOS.

## Getting Started

### 1. Initialize the Library

Before calling any methods, initialize the Rust backend in your `main()` function:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FacturXService.init(); // Load the Rust library
  runApp(const MyApp());
}

```

### 2. Generate a Factur-X Invoice

Provide the paths to your existing PDF and the Factur-X XML data.

```dart
final service = FacturXService();

try {
  final Uint8List result = await service.generate(
    pdfPath: 'path/to/invoice.pdf',
    xmlPath: 'path/to/metadata.xml',
    config: GenerateConfig(
      level: Level.basic,
      flavor: Flavor.facturX,
    ),
  );
  
  // Save or share the resulting Uint8List
} catch (e) {
  print("Error generating Factur-X: $e");
}

```