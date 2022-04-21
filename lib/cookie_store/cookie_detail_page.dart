import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CookieDetailPage extends StatelessWidget {
  final String imgPath;
  final String title;
  final double price;

  const CookieDetailPage({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff545D68),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pickup',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xff545d68),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.deepOrangeAccent,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              "$title",
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(25.0),
            child: Hero(
              tag: '$imgPath',
              child: Image.asset(
                '$imgPath',
              ),
            ),
          ),
          Text(
            '\$$price',
            style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '$title',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 26.0,
                fontWeight: FontWeight.w600),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(
              'This is detail recipe of this cookie. This is detail recipe of this cookie. This is detail recipe of this cookie. This is detail recipe of this cookie. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Add to cart'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                onPrimary: Colors.white,
                fixedSize: Size(double.infinity, 54.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27.0)
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
