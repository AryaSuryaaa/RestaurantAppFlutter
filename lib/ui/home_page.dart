import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/model.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [ SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Restaurant', style: TextStyle(color: Colors.black),),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
            ),
          )];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              transform: Matrix4.translationValues(0.0, 35.0, 0.0),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Recommended for you')),
            Expanded(
              child: Container(
                //
                child: FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
                  builder: (context, snapshot) {
                    final List<Restaurant> restaurant = parseRestaurants(snapshot.data);

                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return _buildRestaurantItem (context, restaurant[index]);
                        },
                      itemCount: restaurant.length,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant)  {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    leading: Hero(
      tag: restaurant.pictureId,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          restaurant.pictureId,
          width: 100,
          fit: BoxFit.cover,
          errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error),)
        ),
      ),
    ),
    title: Text(
      restaurant.name,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),

    ),
    subtitle: Column(
      children: [
        Row(
          children: [
            Icon(Icons.location_on, size: 15,),
            SizedBox(width: 4,),
            Text(restaurant.city),
          ],
        ),
        Row(
          children: [
            Icon(Icons.star, size: 15,),
            SizedBox(width: 4,),
            Text(restaurant.rating.toString()),
          ],
        ),

      ],
    ),
    onTap: (){

    },
  );
}