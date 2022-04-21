import 'package:flutter/material.dart';

class HealthyFoodItemDetail extends StatelessWidget {
  final String title;
  final double price;
  final String imagePath;
  final int id;

  const HealthyFoodItemDetail({
    Key? key,
    required this.price,
    required this.title,
    required this.imagePath,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Detail',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.lightBlueAccent,
                    ),
                    Positioned(
                      top: 75,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.0),
                            topRight: Radius.circular(45.0),
                          ),
                          color: Colors.white,
                        ),
                        height: 175,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: (MediaQuery.of(context).size.width / 2) - 100,
                      child: Hero(
                        tag: id,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$$price',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black38,
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.black38,
                              thickness: 1.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    alignment: Alignment.center,
                                    height: 35.0,
                                    width: 35.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        size: 20.0,
                                      ),
                                      color: Colors.black87,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.white,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
