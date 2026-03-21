import 'dimensions.dart';

extension ResponsiveExtension on num {
  get h => Dimensions.deviceHeightPercentage() * this;
  get w => Dimensions.deviceWidthPercentage() * this;
  get r => Dimensions.deviceShortestSidePercentage() * this;
  get sp => Dimensions.deviceShortestSidePercentage() * this;
}
