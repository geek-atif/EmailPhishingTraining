import 'package:flutter/material.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import '../../ui/widgets/text/dark_text_head.dart';
import '../../model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          DarkTextHead(data: slideList[index].title),
          const SizedBox(
            height: 20,
          ),
          ZoomOverlay(
            minScale: 0.5, // Optional
            maxScale: 3.0, // Optional
            twoTouchOnly: true, // Defaults to false
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(slideList[index].imageUrl),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            slideList[index].description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
