class FiltterModle {
  FiltterModle({
    this.filtter,
  });

  List<Filtter> filtter;

  factory FiltterModle.fromJson(Map<String, dynamic> json) => FiltterModle(
        filtter: json["filtter"] == null
            ? null
            : List<Filtter>.from(
                json["filtter"].map((x) => Filtter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filtter": filtter == null
            ? null
            : List<dynamic>.from(filtter.map((x) => x.toJson())),
      };
}

class Filtter {
  Filtter({
    this.filtterName,
    this.type,
    this.itmes,
  });

  String filtterName;
  String type;
  List<Itme> itmes;

  factory Filtter.fromJson(Map<String, dynamic> json) => Filtter(
        filtterName: json["filtter_name"] == null ? null : json["filtter_name"],
        type: json["type"] == null ? null : json["type"],
        itmes: json["itmes"] == null
            ? null
            : List<Itme>.from(json["itmes"].map((x) => Itme.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filtter_name": filtterName == null ? null : filtterName,
        "type": type == null ? null : type,
        "itmes": itmes == null
            ? null
            : List<dynamic>.from(itmes.map((x) => x.toJson())),
      };
}

class Itme {
  Itme({
    this.title,
    this.id,
  });

  String title;
  String id;

  factory Itme.fromJson(Map<String, dynamic> json) => Itme(
        title: json["title"] == null ? null : json["title"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "id": id == null ? null : id,
      };
}
