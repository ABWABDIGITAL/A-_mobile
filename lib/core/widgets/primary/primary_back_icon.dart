import 'package:a_plus/core/theme/colors.dart';
import 'package:a_plus/core/widgets/primary/my_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'my_svg.dart';

class PrimaryBackIcon extends StatelessWidget {
  final Color? color;
  const PrimaryBackIcon({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: IconButton(icon:Icon(Icons.arrow_back) ,
        onPressed: ()=> Navigator.pop(context),
      ));
  }
}
