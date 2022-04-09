import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/util/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;

  BigText({ Key? key,
    final this.color = const Color(0xFFccc7c5),
    required final this.text,
    final this.size=0,
    final this.overflow=TextOverflow.ellipsis }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.size20 : 20
      ),
    );
  }
}