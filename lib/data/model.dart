import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: (json['rating'] as num).toDouble(),
      menus: Menus.fromJson(json['menus']),
    );
  }
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}

class Menus {
  final List<Food> foods;
  final List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) {
    var foodsFromJson = json['foods'] as List;
    List<Food> foodList = foodsFromJson.map((e) => Food.fromJson(e)).toList();

    var drinksFromJson = json['drinks'] as List;
    List<Drink> drinkList = drinksFromJson.map((e) => Drink.fromJson(e)).toList();

    return Menus(foods: foodList, drinks: drinkList);
  }
}

class Food {
  final String name;

  Food({
    required this.name,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(name: json['name']);
  }
}

class Drink {
  final String name;

  Drink({
    required this.name,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(name: json['name']);
  }
}
