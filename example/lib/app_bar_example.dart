import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() => runApp(AppBarExample());

class AppBarExample extends StatelessWidget {
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

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  BottomBarController controller;

  @override
  void initState() {
    super.initState();
    controller = BottomBarController(vsync: this, dragLength: 550, snap: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      // Set to true for the bottom appbar to overlap body content
      extendBody: true,
      floatingActionButton: GestureDetector(
        // Set onVerticalDrag event to drag handlers of controller for swipe effect
        onVerticalDragUpdate: controller.onDrag,
        onVerticalDragEnd: controller.onDragEnd,
        child: FloatingActionButton.extended(
          label: Text('Toggle'),
          // Set onPressed event to swap state of bottom bar
          onPressed: () => controller.swap(),
        ),
      ),
      body: Container(
        child: GridView.builder(
          itemBuilder: (context, index) => Card(
            child: Center(child: Text('Card $index')),
          ),
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(controller.dragLength),
        child: BottomExpandableAppBar(
          controller: controller,
          expandedHeight: controller.dragLength,
          horizontalMargin: 16.0,
          attachSide: Side.Top,
          expandedBackColor: Theme.of(context).backgroundColor,
          expandedBody: Center(
            child: Text('Hello world!'),
          ),
          bottomAppBarBody: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Hello',
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  'World',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
