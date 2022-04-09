import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/util/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  const IconAndTextWidget({ Key? key, 
    required this.icon,
    required this.text,
    required this.iconColor,
    this.textColor=Colors.black38
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.size24,),
        const SizedBox(width: 5,),
        SmallText(text: text, color: textColor,)
      ],
    );
  }
}