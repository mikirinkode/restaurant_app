import 'package:flutter/material.dart';

import '../restaurant.dart';

class RestaurantCard extends StatelessWidget {
  Restaurant restaurant;

  RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.indigo,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image.network(
                  "https://avatars.githubusercontent.com/u/69853015?v=4",
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ), // TODO
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(restaurant.city),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text("${restaurant.rating}"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopRestaurantCard extends StatelessWidget {
  Restaurant restaurant;

  TopRestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.indigo,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(children: [
                Image.network(
                  "https://avatars.githubusercontent.com/u/69853015?v=4",
                  width: 250,
                  height: 150,
                  fit: BoxFit.cover,
                ), // TODO
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        Text("${restaurant.rating}"),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(restaurant.city),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
