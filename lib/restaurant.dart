import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String rating;
  final List<Menu> menus;

  Restaurant({required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus});

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) =>
      Restaurant(id: restaurant["id"],
          name: restaurant["name"],
          description: restaurant["description"],
          pictureId: restaurant["pictureId"],
          city: restaurant["city"],
          rating: restaurant["rating"],
          menus: []); // TODO
}

class Menu {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> menu) =>
      Menu(foods: menu["foods"], drinks: menu["drinks"]);
}

class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromJson(Map<String, dynamic> item) =>
      MenuItem(name: item["name"]);
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
