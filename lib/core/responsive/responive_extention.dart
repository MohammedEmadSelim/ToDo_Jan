import 'package:todo_app/core/responsive/diementions.dart';

extension ResponiveExtention on num{
  /// calculate responsive height divided by 1000
  get h => Dimensions.deviceHeightPercentage() * this;
  get w => Dimensions.deviceWidthPercentage() * this;
  get r => Dimensions.deviceShortestSidePercentage() * this;
  get sp => Dimensions.deviceShortestSidePercentage() * this;
}