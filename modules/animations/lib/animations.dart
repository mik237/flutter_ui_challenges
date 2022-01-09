import 'dart:math';

import 'package:flutter/material.dart';

class AnimationsSample extends StatefulWidget {
  const AnimationsSample({Key? key}) : super(key: key);

  @override
  _AnimationsSampleState createState() => _AnimationsSampleState();
}

class _AnimationsSampleState extends State<AnimationsSample>
    with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _animation;

  late AnimationController _heartAnimationController;
  late Animation _heartAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween(begin: 0.0, end: pi).animate(_animationController);

    _heartAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..forward();
    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(
      CurvedAnimation(
          parent: _heartAnimationController, curve: Curves.bounceOut),
    );

    _heartAnimationController.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        _heartAnimationController.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Animations'),
      ),
      body: Column(
        children: [
          firstChild(),
          SizedBox(height: 50,),
          secondChild(),
        ],
      ),
    );
  }

  Widget firstChild() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (ctx, child) => Transform.rotate(
              angle: _animation.value,
              child: child,
            ),
            child: Icon(
              Icons.expand_more,
              size: 25,
              color: Colors.blue,
            ),
          ),
          OutlinedButton(
              onPressed: () {
                _animationController.isCompleted
                    ? _animationController.reverse()
                    : _animationController.forward();
              },
              child: Text('Click Me'))
        ],
      ),
    );
  }

  Widget secondChild() {
    return Container(
      child: AnimatedBuilder(
        animation: _heartAnimationController,
        builder: (ctx, child){
          return Icon(Icons.favorite, color: Colors.red, size: _heartAnimation.value,);
        },
      ),
    );
  }
}
