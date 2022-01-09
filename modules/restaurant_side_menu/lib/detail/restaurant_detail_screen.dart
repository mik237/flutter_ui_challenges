import 'package:flutter/material.dart';
import 'package:restaurant_side_menu/config/app_colors.dart';

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({Key? key}) : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerScroll){
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.mainColor.withOpacity(0.0),
              leading: Icon(Icons.arrow_back, color: Colors.black,),
              actions: [Icon(Icons.search, color: Colors.black,),],
              expandedHeight: getExpandedHeight(context),
              flexibleSpace: Container(color: Colors.amber,
              child: Image.asset('assets/Avocado_Salad.png', fit: BoxFit.cover,),),
            ),
            // SliverPersistentHeader(delegate: SliverPersistentHeaderDelegate()),
          ];
        },
        body: Container(),
      ),
    );
  }

  double getExpandedHeight(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size.height * 0.25;
  }
}
