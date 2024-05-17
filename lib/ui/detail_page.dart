import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';

  final Restaurant restaurant;
  const DetailPage({super.key, required this.restaurant, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft:Radius.circular(15)),
                  child: Image.network(
                    restaurant.pictureId,
                    height: 250,
                    width: MediaQuery.of(context).size.width, // memenuhi lebar layar
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                                Icons.arrow_back
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: FavoriteButton()
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          restaurant.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
        
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.yellow,),
                          const SizedBox(width: 4,),
                          Text(restaurant.rating.toString())
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16,),
                      const SizedBox(width: 4,),
                      Text(restaurant.city),
                    ],
                  ),
                  const SizedBox(height: 28,),
                  const Text('Description', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 7,),
                  Text(restaurant.description),
                ],
              ),
            ),
            const SizedBox(height: 21,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Foods', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 7,),
            SizedBox(
                height: 40,
                child: _buildFoodsList(restaurant.menus.foods)
            ),
            const SizedBox(height: 21,),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Drinks', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 7,),
            SizedBox(
                height: 40,
                child: _buildDrinksList(restaurant.menus.drinks)
            ),
            const SizedBox(height: 21,),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodsList(List<Food> foods) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Chip(
            label: Text(foods[index].name),
          ),
        );
      },
    );
  }

  Widget _buildDrinksList(List<Drink> drinks) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Chip(
            label: Text(drinks[index].name),
          ),
        );
      },
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey ,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}