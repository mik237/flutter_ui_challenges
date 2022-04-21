import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/cookie_store/cookie_detail_page.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(20),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      alignment: Alignment.bottomCenter,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        childAspectRatio: 0.8,
        crossAxisCount: 2,
        children: [
          _buildProductView(
            context: context,
            imgPath: 'assets/cookiechoco.jpg',
            price: 2.99,
            title: 'Cookie Choco',
          ),
          _buildProductView(
            context: context,
            imgPath: 'assets/cookieclassic.jpg',
            price: 3.50,
            title: 'Cookie Classic',
          ),
          _buildProductView(
            context: context,
            imgPath: 'assets/cookiecream.jpg',
            price: 4.99,
            title: 'Cookie Cream',
          ),
          _buildProductView(
            context: context,
            imgPath: 'assets/cookiemint.jpg',
            price: 2.35,
            title: 'Cookie Mint',
          ),
          _buildProductView(
            context: context,
            imgPath: 'assets/cookievan.jpg',
            price: 1.99,
            title: 'Cookie Van',
          ),
          _buildProductView(
            context: context,
            imgPath: 'assets/cookiechocolate.png',
            price: 3.99,
            title: 'Cookie Butter',
          ),
        ],
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }

  Widget _buildProductView({
    required BuildContext context,
    required String imgPath,
    required String title,
    required double price,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CookieDetailPage(
            imgPath: imgPath,
            price: price,
            title: title,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: '$imgPath',
                  child: Image.asset(
                    '$imgPath',
                    width: 80.0,
                    height: 80.0,
                  ),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$title',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600),
                ),
                Divider(
                  color: Colors.black26,
                  height: 1.0,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.green,
                  ),
                  label: Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
