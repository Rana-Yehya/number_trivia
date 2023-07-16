import 'package:flutter/material.dart';

import '../../../../core/themes/size_config.dart';
class MessageDisplay extends StatelessWidget {
  final String message;
  const MessageDisplay({required this.message, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height! * 0.3,
      child: Expanded(
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              message,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}