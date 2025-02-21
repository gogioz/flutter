void main() {
  print(CalcDiscount(originalPrice: 410, discountPercentage: 25));
  print(CalcDiscount(originalPrice: 940, discountPercentage: 12));
  print(CalcDiscount(originalPrice: 319));
}

double CalcDiscount(
    {required double originalPrice, double discountPercentage = 10}) {
  return originalPrice * (discountPercentage / 100);
}
