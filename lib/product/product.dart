
class Product {
  final String name;
  final int price;
  final String image;
  final String color;
  final String id;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.color,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    price: json["price"],
    image: json["image"],
    color: json["color"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "image": image,
    "color": color,
    "id": id,
  };
}
