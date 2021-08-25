import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  _AnimatedContainerScreenState createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen>
    with TickerProviderStateMixin {
  var selected = false;

  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 2));

  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                if(_animationController.isAnimating){
                  _animationController.stop();
                }
                else{
                  _animationController.repeat(reverse: false);
                }
              },
              child: RotationTransition(
                turns: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterLogo(
                    size: 150,
                  ),
                ),
              ),
            )
            /*InkWell(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    color: selected ? Colors.red : Colors.purple,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                */ /*height: selected ? 200 : 150,
                width: selected ? MediaQuery.of(context).size.width - 24 : 150,*/ /*
                duration: const Duration(milliseconds: 200),
                child: selected ? Container(
                  // color: Colors.purple,
                  height: 200,
                  width: MediaQuery.of(context).size.width - 24,
                ) : Container(
                  color: Colors.red,
                  height: 150, width: 150,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
