import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:threattraining/ui/widgets/text/dark_text_head.dart';
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
          PinchZoomImage(
            image: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(slideList[index].imageUrl),
            ),
            zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
            hideStatusBarWhileZooming: true,
            onZoomStart: () {
              print('Zoom started');
            },
            onZoomEnd: () {
              print('Zoom finished');
            },
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
