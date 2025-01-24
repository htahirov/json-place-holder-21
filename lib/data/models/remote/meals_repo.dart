import 'dart:convert';

class MealsResponse {
    String id;
    String title;
    String image;
    List<String> ingredientsList;
    Category category;

    MealsResponse({
        required this.id,
        required this.title,
        required this.image,
        required this.ingredientsList,
        required this.category,
    });

    factory MealsResponse.fromRawJson(String str) => MealsResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MealsResponse.fromJson(Map<String, dynamic> json) => MealsResponse(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        ingredientsList: List<String>.from(json["ingredientsList"].map((x) => x)),
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "ingredientsList": List<dynamic>.from(ingredientsList.map((x) => x)),
        "category": category.toJson(),
    };
}

class Category {
    String id;
    int position;
    String title;
    String image;

    Category({
        required this.id,
        required this.position,
        required this.title,
        required this.image,
    });

    factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        position: json["position"],
        title: json["title"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
        "title": title,
        "image": image,
    };
}
