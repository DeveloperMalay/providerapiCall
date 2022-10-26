class Cat {
  Cat({
    this.id,
    this.url,
    this.width,
    this.height,
  });

  String? id;
  String? url;
  int? width;
  int? height;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };
}
