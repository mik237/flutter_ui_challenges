import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_side_menu/config/app_colors.dart';
import 'package:restaurant_side_menu/home/menu_clipper.dart';
import 'package:restaurant_side_menu/home/selected_clipper.dart';
import 'package:restaurant_side_menu/models/food.dart';
import 'package:restaurant_side_menu/widgets/food_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation =
        Tween<double>(begin: 180, end: 180).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          // color: Colors.red.withAlpha(50),
          width: size.width,
          child: Stack(
            children: [
              _buildMenuBar(size),
              _buildSelectedContainer(),
              _buildBody(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar(Size size) {
    return ClipPath(
      clipper: MenuClipper(),
      child: Container(
        height: size.height,
        width: 55,
        color: AppColors.mainColor,
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            Icon(
              Icons.widgets_rounded,
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.search),
            SizedBox(
              height: 30,
            ),
            _buildRotatedBox("My Profile", 0),
            _buildRotatedBox("Notification", 1),
            _buildRotatedBox("Invoice", 2),
            _buildRotatedBox("Home", 3),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
    );
  }

  Widget _buildRotatedBox(String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _animation = Tween<double>(
            begin: 180 + (currentIndex * 100),
            end: 180 + (index * 100),
          ).animate(_animationController);
          currentIndex = index;
        });
        _animationController.forward(from: 0);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: RotatedBox(
          quarterTurns: -1,
          child: Container(
            width: 100,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedContainer() {
    return AnimatedBuilder(
      builder: (context, widget) {
        return Positioned(
          left: 55,
          top: _animation.value,
          child: ClipPath(
            clipper: SelectedClipper(),
            child: Container(
              color: AppColors.mainColor,
              width: 50,
              height: 100,
            ),
          ),
        );
      },
      animation: _animation,
    );
  }

  Widget _buildBody(Size size) {
    return Positioned(
      top: 20,
      left: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Food & Delivery',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildTabBars(size),
          SizedBox(
            height: 20,
          ),
          Text(
            'Near You:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 210,
            width: size.width - 90,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FoodItem(
                food: getNearestFood().elementAt(index),
              ),
              itemCount: getNearestFood().length,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Popular:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 210,
            width: size.width - 90,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FoodItem(
                food: getPopularFood().elementAt(index),
              ),
              itemCount: getPopularFood().length,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: size.width - 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                    color: AppColors.mainColorBlue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(7.0),
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(7.0),
                      bottomRight: Radius.circular(30.0)
                    )
                  ),
                  child: Text(
                    'View All',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabBars(Size size) {
    return Container(
      width: size.width - 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            child: Text('Asian'),
          ),
          Text('American'),
          Text('French'),
          Text('Mexico'),
        ],
      ),
    );
  }

  List<Food> getNearestFood() {
    List<Food> nearest = [];
    nearest.add(Food(
        name: 'Chicken Hamburger',
        image: 'assets/Chicken_Hamburger.png',
        description: 'Fresh Hamburger with chicken, salad and tomatoes',
        isFav: true,
        price: 30.0));
    nearest.add(Food(
        name: 'Dragon Fruits Salad',
        image: 'assets/Dragon_Fruits_Salad.png',
        description: 'A bit of avacado salad and same spinach stalks',
        isFav: true,
        price: 18.0));
    nearest.add(Food(
        name: 'Chicken Hamburger1',
        image: 'assets/Chicken_Hamburger.png',
        description: 'Fresh Hamburger with chicken, salad and tomatoes',
        isFav: true,
        price: 30.0));
    nearest.add(Food(
        name: 'Dragon Fruits Salad1',
        image: 'assets/Dragon_Fruits_Salad.png',
        description: 'A bit of avacado salad and same spinach stalks',
        isFav: true,
        price: 18.0));
    return nearest;
  }

  List<Food> getPopularFood() {
    List<Food> populars = [];
    populars.add(Food(
        name: 'Salmon Sushi',
        image: 'assets/Salmon_Sushi.png',
        description: 'Fresh Hamburger with chicken, salad and tomatoes',
        isFav: false,
        price: 25.0));
    populars.add(Food(
        name: 'Avacado Salad',
        image: 'assets/Avocado_Salad.png',
        description: 'A bit of avacado salad and same spinach stalks',
        isFav: true,
        price: 15.0));
    populars.add(Food(
        name: 'Salmon Sushi1',
        image: 'assets/Salmon_Sushi.png',
        description: 'Fresh Hamburger with chicken, salad and tomatoes',
        isFav: false,
        price: 25.0));
    populars.add(Food(
        name: 'Avacado Salad1',
        image: 'assets/Avocado_Salad.png',
        description: 'A bit of avacado salad and same spinach stalks',
        isFav: true,
        price: 15.0));
    return populars;
  }
}
