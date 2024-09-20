import 'package:flutter/material.dart';
import 'package:flutter_basic/basic_widgets/text_widget.dart';

class MyFABWidget extends StatelessWidget {
  const MyFABWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        const MyTextWidget();
      },
      backgroundColor: Colors.pink,
      child: const Icon(Icons.thumb_up),
    );
  }
}
