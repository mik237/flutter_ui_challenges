
import 'package:flutter/material.dart';
import '../story_carosel/data.dart';
import 'card_scroll_widget.dart';



class StoryCarosel extends StatefulWidget {
  @override
  _StoryCaroselState createState() => new _StoryCaroselState();
}

class _StoryCaroselState extends State<StoryCarosel> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {

    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
        // print("CurrentPage: $currentPage");
      });
    });

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Colors.purple,
            Color(0xFF2d3447),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Trending",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1.0,
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFff6e6e),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text("Animated",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("25+ Stories",
                        style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.all(15.0),
                        );
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Favourite",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1.0,
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text("Latest",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("9+ Stories",
                        style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/image_02.jpg",
                          width: 296.0, height: 222.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*class StoryCarosel extends StatefulWidget {
  const StoryCarosel({Key? key}) : super(key: key);

  @override
  State<StoryCarosel> createState() => _StoryCaroselState();
}

class _StoryCaroselState extends State<StoryCarosel> {
  var currentPage = images.length - 1;
  PageController controller = PageController(initialPage: images.length - 1);


  @override
  void initState() {

    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.toInt()??0;
        print("CurrentPage: ${controller.page?.toInt()}");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 30,
                bottom: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontFamily: 'Calibre-Semibold'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFff6e6e),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22.0,
                      vertical: 6.0,
                    ),
                    child: Text(
                      'Animated',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  '25+ Stories',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
            Stack(
              children: [
                CardScrollWidget(
                  currentPage: currentPage,
                ),
                Positioned.fill(
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: images.length,
                    reverse: true,
                    controller: controller,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Favourite",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      )),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                        child: Text("Latest",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text("9+ Stories",
                      style: TextStyle(color: Colors.blueAccent))
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset("assets/image_02.jpg",
                        width: 296.0, height: 222.0),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}*/

// class CardScrollWidget extends StatelessWidget {
//   final int currentPage;
//
//   var padding = 20.0;
//   var verticalInset = 20.0;
//
//   CardScrollWidget({Key? key, required this.currentPage}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: widgetAspectRatio,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           var width = constraints.maxWidth;
//           var height = constraints.maxHeight;
//
//           var safeWidth = width - 20 * padding;
//           var safeHeight = height - 20 * padding;
//
//           var heightOfPrimaryCard = safeHeight;
//           var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;
//
//           var primaryCardLeft = safeWidth - widthOfPrimaryCard;
//           var horizontalInset = primaryCardLeft / 2;
//
//           List<Widget> cardsList = List.empty(growable: true);
//           for (var i = 0; i < images.length; i++) {
//             var delta = i - currentPage;
//             bool isOnRight = delta > 0;
//             var start = padding +
//                 max(
//                     primaryCardLeft -
//                         horizontalInset * -delta * (isOnRight ? 15 : 1),
//                     0.0);
//
//             var cardItem = Positioned.directional(
//               top: padding + verticalInset * max(-delta, 0),
//               bottom: padding + verticalInset * max(-delta, 0),
//               start: start,
//               textDirection: TextDirection.rtl,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16.0),
//                 child: Container(
//                   decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                     BoxShadow(
//                         color: Colors.black12,
//                         offset: Offset(3.0, 6.0),
//                         blurRadius: 10.0)
//                   ]),
//                   child: AspectRatio(
//                     aspectRatio: cardAspectRatio,
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: <Widget>[
//                         Image.asset(images[i], fit: BoxFit.cover),
//                         Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 16.0, vertical: 8.0),
//                                 child: Text(title[i],
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 25.0,
//                                         fontFamily: "SF-Pro-Text-Regular")),
//                               ),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 12.0, bottom: 12.0),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 22.0, vertical: 6.0),
//                                   decoration: BoxDecoration(
//                                       color: Colors.blueAccent,
//                                       borderRadius:
//                                           BorderRadius.circular(20.0)),
//                                   child: Text("Read Later",
//                                       style: TextStyle(color: Colors.white)),
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//
//             cardsList.add(cardItem);
//           }
//           return Stack(children: cardsList,);
//         },
//       ),
//     );
//   }
// }
