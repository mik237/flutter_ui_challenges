import 'package:flutter/material.dart';
import 'package:restaurant_side_menu/config/app_colors.dart';
import 'package:restaurant_side_menu/models/food.dart';

class FoodDetail extends StatefulWidget {
  final Food food;

  const FoodDetail({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              _buildAddCartBtn(size),
              _buildCounter(size),
              _buildBodyTop(size),
            ],
          ),
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
            color: widget.food.isFav
                ? AppColors.mainColorBlue
                : AppColors.mainColorBlue.withOpacity(0.50),
          ),
        ),
      ],
    );
  }

  Widget _buildBodyTop(Size size) {
    return Container(
      /*decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: AppColors.mainColor,
          // spreadRadius: 2.0,
          blurRadius: 10,
          offset: Offset(0,-30)
        )]
      ),*/
      margin: EdgeInsets.only(top: 30),
      width: size.width,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(10),
        )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 7.0,
                width: 30,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.mainColorBlue),
              ),
            ),
            _buildFavIcon(),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Hero(
                tag: widget.food.name,
                child: Image.asset(
                  widget.food.image,
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
              child: Text(
                '\$${widget.food.price}',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.purple,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Text(
                '${widget.food.name}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 10, bottom: 20),
              child: Text(
                '${widget.food.description}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter(Size size) {
    return Positioned(
      bottom: 100,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(10),
            )),
        height: 150,
        width: size.width,
        padding: EdgeInsets.only(top: 60, left: 12, right: 12.0),
        child: Row(
          children: [
            Text(
              'Quantity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(0.7),
              ),
              child: Icon(
                Icons.remove,
                color: AppColors.mainColorBlue,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(0.7),
              ),
              child: Icon(
                Icons.add,
                color: AppColors.mainColorBlue,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCartBtn(Size size) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(top: 35),
        height: 150,
        width: size.width,
        color: Colors.indigo,
        child: Center(
            child: Text(
          'Add to cart',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
