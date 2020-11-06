// To parse this JSON data, do
//
//     final cartItems = cartItemsFromJson(jsonString);

// import 'dart:convert';

// List<CartItems> cartItemsFromJson(String str) => List<CartItems>.from(json.decode(str).map((x) => CartItems.fromJson(x)));

// String cartItemsToJson(List<CartItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItems {
  CartItems({
    this.id,
    this.category,
    this.name,
    this.rating,
    this.image,
    this.description,
    this.available,
    this.size,
    this.condition,
    this.color,
    this.price,
    this.discount,
  });

  int id;
  String category;
  String name;
  int rating;
  String image;
  String description;
  bool available;
  List<String> size;
  String condition;
  String color;
  double price;
  int discount;

  factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
        id: json["id"] == null ? null : json["id"],
        category: json["category"] == null ? null : json["category"],
        name: json["name"] == null ? null : json["name"],
        rating: json["rating"] == null ? null : json["rating"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
        available: json["available"] == null ? null : json["available"],
        size: json["size"] == null
            ? null
            : List<String>.from(json["size"].map((x) => x)),
        condition: json["condition"] == null ? null : json["condition"],
        color: json["color"] == null ? null : json["color"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        discount: json["discount"] == null ? null : json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category": category == null ? null : category,
        "name": name == null ? null : name,
        "rating": rating == null ? null : rating,
        "image": image == null ? null : image,
        "description": description == null ? null : description,
        "available": available == null ? null : available,
        "size": size == null ? null : List<dynamic>.from(size.map((x) => x)),
        "condition": condition == null ? null : condition,
        "color": color == null ? null : color,
        "price": price == null ? null : price,
        "discount": discount == null ? null : discount,
      };
}
