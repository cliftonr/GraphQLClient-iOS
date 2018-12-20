#!/bin/sh

SWIFTGEN=$PODS_ROOT/SwiftGen/bin/swiftgen
RESOURCES_DIR=$PROJECT_DIR/Resources
GENERATED_FILES_DIR=$PROJECT_DIR/Sources/Generated

mkdir -p $GENERATED_FILES_DIR

$SWIFTGEN fonts -t swift4 --param enumName="FontFamily" -o "$GENERATED_FILES_DIR/FontFamily.swift" "$RESOURCES_DIR/Fonts/"
$SWIFTGEN xcassets -t swift4 --param enumName="Asset" -o "$GENERATED_FILES_DIR/Asset.swift" "$RESOURCES_DIR/Images/Assets.xcassets"
$SWIFTGEN ib -t scenes-swift4 --param sceneEnumName="Scene" -o "$GENERATED_FILES_DIR/Scene.swift" "$RESOURCES_DIR/Views & Strings/"
$SWIFTGEN ib -t segues-swift4 --param segueEnumName="Segue" -o "$GENERATED_FILES_DIR/Segue.swift" "$RESOURCES_DIR/Views & Strings/"
#$SWIFTGEN strings -t structured-swift4 --param enumName="L10n" -o "$GENERATED_FILES_DIR/L10n.swift" "$RESOURCES_DIR/Views & Strings/en.lproj/Localizable.strings"
