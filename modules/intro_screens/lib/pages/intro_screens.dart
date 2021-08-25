// library intro_screens;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_screens/models/step_model.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<StepModel> stepModels = StepModel.list;
  var _initialPage = 0;
  var _pageController = PageController();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);

    _pageController.addListener(() {
      setState(() {
        _initialPage = _pageController.page!.round();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: [
            _appBar(),
            _body(),
            _circularIndicator(),
          ],
        ),
      ),
    ));
  }

  _appBar() {
    return Container(
      // height: kToolbarHeight,
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              _pageController.animateToPage(
                _initialPage-1,
                duration: Duration(microseconds: 500),
                curve: Curves.easeIn,
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Skip',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  _body() {
    return Expanded(
        child: Container(
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          return _buildPageView(index);
        },
        itemCount: stepModels.length,
      ),
    ));
  }

  _circularIndicator() {
    return Container(
      height: 60,
      width: 60,
      margin: EdgeInsets.symmetric(vertical: 25.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.purple),
              value: (_initialPage + 1) / (stepModels.length),
            ),
          ),
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _initialPage+1,
                duration: Duration(microseconds: 500),
                curve: Curves.easeIn,
              );
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageView(int index) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 50.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/${stepModels[index].id}.png',
          ),
          Text(
            '${stepModels.elementAt(index).text}',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
