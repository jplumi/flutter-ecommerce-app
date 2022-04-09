import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/home/food_page_body.dart';
import 'package:flutter_ecommerce_app/util/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';
import 'package:flutter_ecommerce_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({ Key? key }) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // showing the header
          Container (
            margin: EdgeInsets.only(top: Dimensions.size45, bottom: Dimensions.size30),
            padding: EdgeInsets.only(right: Dimensions.size20, left: Dimensions.size20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Brasil", color: Colors.blue),
                    Row(
                      children: [
                        SmallText(text: "Erechim", color: Colors.black54),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: Dimensions.size45,
                      height: Dimensions.size45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.size20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.size15),
                        color: Colors.blue
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          // showing the body
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            )
          )
        ]
      ),
    );
  }
}