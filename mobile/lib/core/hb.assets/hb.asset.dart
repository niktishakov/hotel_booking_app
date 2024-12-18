class HbAsset {
  const HbAsset.bitmap(this.path) : type = HbAssetType.bitmap;

  const HbAsset.vector(this.path) : type = HbAssetType.vector;

  const HbAsset.video(this.path) : type = HbAssetType.video;

  final String path;
  final HbAssetType type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HbAsset && runtimeType == other.runtimeType && path == other.path && type == other.type;

  @override
  int get hashCode => path.hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'HbAsset{path: $path, type: $type}';
  }
}

enum HbAssetType {
  bitmap,
  vector,
  video,
}
