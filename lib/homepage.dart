import 'package:flutter/material.dart';
import 'package:restaurant/restaurant.dart';
import 'package:restaurant/widget/restaurant_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Popular Restaurant"),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString("resources/data.json"),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
          return Expanded(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Text("Top Restaurant",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: restaurants
                        .map((e) => TopRestaurantCard(restaurant: e))
                        .toList(),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Text("All Restaurant",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Column(
                  children: restaurants
                      .map((e) => RestaurantCard(restaurant: e))
                      .toList())
            ],
          ));
        },
      ),
    );
  }
}
