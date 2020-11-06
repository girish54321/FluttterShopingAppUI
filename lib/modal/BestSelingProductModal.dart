// To parse this JSON data, do
//
//     final bestSeliingProduct = bestSeliingProductFromJson(jsonString);

// import 'dart:convert';

// BestSeliingProduct bestSeliingProductFromJson(String str) =>
//     BestSeliingProduct.fromJson(json.decode(str));

// String bestSeliingProductToJson(BestSeliingProduct data) =>
//     json.encode(data.toJson());

class BestSeliingProduct {
  BestSeliingProduct({
    this.bestSelling,
  });

  BestSelling bestSelling;

  factory BestSeliingProduct.fromJson(Map<String, dynamic> json) =>
      BestSeliingProduct(
        bestSelling: json["best_selling"] == null
            ? null
            : BestSelling.fromJson(json["best_selling"]),
      );

  Map<String, dynamic> toJson() => {
        "best_selling": bestSelling == null ? null : bestSelling.toJson(),
      };
}

class BestSelling {
  BestSelling({
    this.products,
  });

  List<Product> products;

  factory BestSelling.fromJson(Map<String, dynamic> json) => BestSelling(
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
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
    this.keywords,
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
  Condition condition;
  String color;
  double price;
  List<String> keywords;
  int discount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        condition: json["condition"] == null
            ? null
            : conditionValues.map[json["condition"]],
        color: json["color"] == null ? null : json["color"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        keywords: json["keywords"] == null
            ? null
            : List<String>.from(json["keywords"].map((x) => x)),
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
        "condition":
            condition == null ? null : conditionValues.reverse[condition],
        "color": color == null ? null : color,
        "price": price == null ? null : price,
        "keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords.map((x) => x)),
        "discount": discount == null ? null : discount,
      };
}

enum Condition { NEW, RENEWED, USED, COLLECTIBLE }

final conditionValues = EnumValues({
  "collectible": Condition.COLLECTIBLE,
  "new": Condition.NEW,
  "renewed": Condition.RENEWED,
  "used": Condition.USED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
