import 'package:flutter/material.dart';
import 'package:restaurant_side_menu/config/app_colors.dart';
import 'package:restaurant_side_menu/home/menu_clipper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _buildMenuBar(size),
          ],
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
      ),
    );
  }
}
