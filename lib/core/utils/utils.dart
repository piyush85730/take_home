double calculateDiscountPrice(double originalPrice, double discountPercentage) {
  final discountAmount = originalPrice * (discountPercentage / 100);
  final discountPrice = originalPrice - discountAmount;
  return discountPrice;
}
