import 'package:flutter/material.dart';

import '../../../../core/themes/size_config.dart';

class NumberDisplay extends StatelessWidget {
  final String number;
  const NumberDisplay({required this.number, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height! * 0.3,
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
