void main() {
  Product tv = Product(
      ID: 5,
      name: "Samsung Tv",
      price: 5000,
      quantity: 4,
      imageURL: "https//:www.samsung-tvs.com");
  Product sample = Product.sample();
  print(tv);
  print(sample);
}

class Product {
  int ID;
  String name;
  double price;
  int quantity;
  String imageURL;
  Product(
      {required this.ID,
      required this.name,
      required this.price,
      required this.quantity,
      required this.imageURL});
  Product.sample()
      : ID = 3,
        name = "Mug",
        price = 250,
        quantity = 13,
        imageURL = "https//:www.mugs.com";
  @override
  String toString() {
    //ToDo: implement toString
    return "$ID, $name, $price, $quantity,$imageURL";
  }
}
