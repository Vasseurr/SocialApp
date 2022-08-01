import 'package:flutter/material.dart';

import '../constants/asset_URL.dart';

extension ImageExtension on AssetURL {
  Widget iconAssetToWidget(String name) => Image.asset(pathIconValue(name));
  Widget imageAssetToWidget(String path) => Image.asset(path);
  Widget imageNetworkToWidget(String path) => Image.network(path);
}
