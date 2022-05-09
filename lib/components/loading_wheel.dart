import 'package:flutter/material.dart';

class LoadingWheel extends StatelessWidget {
  const LoadingWheel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
