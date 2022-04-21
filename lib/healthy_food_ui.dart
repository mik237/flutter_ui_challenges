import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_challenges/health_food_item_detail.dart';

class HealthyFoodUI extends StatefulWidget {
  const HealthyFoodUI({Key? key}) : super(key: key);

  @override
  State<HealthyFoodUI> createState() => _HealthyFoodUIState();
}

class _HealthyFoodUIState extends State<HealthyFoodUI> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          // statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: Color(0xff21bfbd),
        // appBar: AppBar(primary: false, backgroundColor: Colors.amber,),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  top: 0.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.tune),
                            color: Colors.white,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.menu_sharp),
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text(
                      'Healthy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Food',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.0),
                  ),
                ),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    _buildListItem(
                      context,
                        title: 'Avocado Salad',
                        id: 100,
                        imagePath: 'assets/Avocado_Salad.png',
                        price: 24.5),
                    _buildListItem(
                        context,
                        title: 'Chicken Hamburger',
                        id: 102,
                        imagePath: 'assets/Chicken_Hamburger.png',
                        price: 24.5),
                    _buildListItem(
                        context,
                        title: 'Dragon Fruits Salad',
                        id: 104,
                        imagePath: 'assets/Dragon_Fruits_Salad.png',
                        price: 24.5),
                    _buildListItem(
                        context,
                        title: 'Salmon Sushi',
                        id: 106,
                        imagePath: 'assets/Salmon_Sushi.png',
                        price: 24.5),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 35),
                      width: 65.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black26)),
                      child: Icon(
                        Icons.search,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                      width: 65.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black26)),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Icon(
                              Icons.add_shopping_cart_rounded,
                              color: Colors.black87,
                            ),
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: 0,
                          ),
                          Positioned.fill(
                            top: 5,
                            right: 10,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 65.0,
                        height: 65.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.black26)),
                        child: Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    required String title,
    required double price,
    required String imagePath,
    required int id,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return HealthyFoodItemDetail(
            title: title,
            price: price,
            imagePath: imagePath,
            id: id,
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Hero(
                  tag: id,
                  child: Image.asset(
                    imagePath,
                    scale: 5,
                  ),
                )),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                        color: Colors.black87),
                  ),
                  Text(
                    '\$$price',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Material(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
