import 'package:flutter/material.dart';
import 'package:take_home/core/constants/image_constants.dart';

double calculateDiscountPrice(double originalPrice, double discountPercentage) {
  final discountAmount = originalPrice * (discountPercentage / 100);
  final discountPrice = originalPrice - discountAmount;
  return discountPrice;
}

void preLoadImages(BuildContext context) {
  for (final image in ImageConstants.imageList) {
    precacheImage(AssetImage(image), context);
  }
}
