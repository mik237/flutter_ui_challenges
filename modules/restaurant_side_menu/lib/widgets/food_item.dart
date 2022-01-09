import 'package:flutter/material.dart';
import 'package:restaurant_side_menu/config/app_colors.dart';
import 'package:restaurant_side_menu/detail/food_detail.dart';
import 'package:restaurant_side_menu/detail/restaurant_detail_screen.dart';
import 'package:restaurant_side_menu/models/food.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  const FoodItem({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return FoodDetail(food: food,);
          // return RestaurantDetail();
        }));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        width: size.width / 2,
        height: 210,
        child: Stack(
          children: [
            _buildCard(),
            _buildImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Hero(
      tag: food.name,
      child: Image.asset(
        food.image,
        width: 120,
        height: 120,
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10),
      child: Card(

        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            _buildFavIcon(),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
              child: Text(
                '\$${food.price}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.purple,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Text(
                '${food.name}',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Text(
                '${food.description}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          margin: EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0))),
          child: Icon(
            Icons.favorite,
            color: food.isFav
                ? AppColors.mainColorBlue
                : AppColors.mainColorBlue.withOpacity(0.50),
          ),
        ),
      ],
    );
  }
}
