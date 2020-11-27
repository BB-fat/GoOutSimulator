import 'package:flutter/material.dart';

class SubsequentProcessingFloatingView extends StatelessWidget {
  final Function tapClose;
  SubsequentProcessingFloatingView({this.tapClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: tapClose,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "image/subsequent_processing.jpeg",
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
