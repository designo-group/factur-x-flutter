#!/bin/bash

# Configuration - Relative to the 'scripts/' folder
SOURCE_DIR="../rs"     # Move up 1 level to root, then into 'rs'
TARGET_DIR="../rust"   # Move up 1 level to root, then into 'rust'
PLUGIN_DIR=".."        # Move up 1 level to the project root

echo "🚀 Starting vendor process..."

# 1. Vendor Source Code
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Sync core and dart logic from the submodule
rsync -av --progress \
    --exclude='*.pdf' --exclude='*.xsd' --exclude='*.sch' --exclude='target/' \
    --exclude='kotlin/' --exclude='swift/' --exclude='rb/' --exclude='py/' --include='core/' --include='dart/' \
    "$SOURCE_DIR/" "$TARGET_DIR/"

# 2. Bundle the Binaries
echo "📂 Bundling binaries for Android..."
ANDROID_DEST="$PLUGIN_DIR/android/src/main/jniLibs/arm64-v8a"
mkdir -p "$ANDROID_DEST"

# Check the .so path (Assuming Cargo puts it in rs/target/...)
if [ -f "$SOURCE_DIR/target/aarch64-linux-android/release/libfacturx.so" ]; then
    cp "$SOURCE_DIR/target/aarch64-linux-android/release/libfacturx.so" "$ANDROID_DEST/"
    echo "  ✅ Android binary copied."
else
    echo "  ❌ ERROR: Android binary not found! (Path: $SOURCE_DIR/target/aarch64-linux-android/release/)"
fi

echo "📂 Bundling binaries for iOS..."
IOS_DEST="$PLUGIN_DIR/ios"
mkdir -p "$IOS_DEST"

if [ -f "$SOURCE_DIR/target/aarch64-apple-ios/release/libfacturx.a" ]; then
    cp "$SOURCE_DIR/target/aarch64-apple-ios/release/libfacturx.a" "$IOS_DEST/"
    echo "  ✅ iOS binary copied."
else
    echo "  ❌ ERROR: iOS binary not found! (Path: $SOURCE_DIR/target/aarch64-apple-ios/release/)"
fi

echo "✅ Script complete."