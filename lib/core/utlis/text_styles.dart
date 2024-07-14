import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/core/utlis/assets_data.dart';

abstract class TextStyles {
  static const TextStyle title = TextStyle(
    fontFamily: AssetsData.mainFontFamily,
    fontSize: 28,
  );
  static const TextStyle normal = TextStyle(
    fontFamily: AssetsData.mainFontFamily,
    fontSize: 24,
  );
  static const TextStyle small = TextStyle(
    fontFamily: AssetsData.mainFontFamily,
    fontSize: 20,
  );
}