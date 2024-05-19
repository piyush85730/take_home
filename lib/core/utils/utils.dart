import 'dart:math';

import 'package:flutter/material.dart';
import 'package:take_home/core/constants/image_constants.dart';
import 'package:take_home/core/constants/string_constants.dart';

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

String getRandomUserImage() {
  return ImageConstants.userList[Random().nextInt(6)];
}

String getRandomPostImage() {
  return ImageConstants.postList[Random().nextInt(11)];
}

String getRandomUserName() {
  return StringConstants.userNameList[Random().nextInt(99)];
}
