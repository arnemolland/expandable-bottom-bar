import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() => runApp(BottomBarExample());

class BottomBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterDark.dark(),
      home: DefaultBottomBarController(
        child: Page(),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      // Set to true for the bottom appbar to overlap body content
      extendBody: true,
      appBar: AppBar(
        title: Text('Panel Showcase'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        // Set onVerticalDrag event to drag handlers of controller for swipe effect
        onVerticalDragUpdate: DefaultBottomBarController.of(context).onDrag,
        onVerticalDragEnd: DefaultBottomBarController.of(context).onDragEnd,
        child: FloatingActionButton.extended(
          label: Text('Toggle'),
          // Set onPressed event to swap state of bottom bar
          onPressed: () => DefaultBottomBarController.of(context).swap(),
        ),
      ),
      bottomNavigationBar: BottomExpandableAppBar(
        expandedHeight: MediaQuery.of(context).size.height * 0.5,
        horizontalMargin: 16.0,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        expandedBody: Center(
          child: Text('Hello world!'),
        ),
        bottomAppBarBody: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Text('Tets', textAlign: TextAlign.center),
            ),
            Spacer(),
            Expanded(
              child: Text('Stet', textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
