import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_challenges/cookie_store/cookie_page.dart';

import 'bottom_bar.dart';

class CookieStoreHome extends StatefulWidget {
  const CookieStoreHome({Key? key}) : super(key: key);

  @override
  State<CookieStoreHome> createState() => _CookieStoreHomeState();
}

class _CookieStoreHomeState extends State<CookieStoreHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff545D68),
          ),
          onPressed: () {},
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Text(
              "Categories",
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 46.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          TabBar(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            indicatorColor: Colors.transparent,
            labelColor: Color(0xffC88d67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0xffCDCDCD),
            tabs: [
              Tab(
                child: Text(
                  'Cookies',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontFamily: 'Varela',
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Cookie Cake',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontFamily: 'Varela',
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Ice Cream',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontFamily: 'Varela',
                  ),
                ),
              ),
            ],
            controller: _tabController,
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              CookiePage(),
              CookiePage(),
              CookiePage(),
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: false,
        onPressed: () {},
        backgroundColor: Color(0xffF17532),
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
