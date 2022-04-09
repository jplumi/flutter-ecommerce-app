import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/util/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';
import 'package:flutter_ecommerce_app/widgets/icon_and_text_widget.dart';
import 'package:flutter_ecommerce_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({ Key? key }) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  final PageController pageControler = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  final int _pageCount = 5;
  final double _scaleFactor = 0.8;

  final double _cardHeight = Dimensions.size240;
  
  @override
  void initState() {
    super.initState();
    pageControler.addListener(() {
      setState(() {
        _currentPageValue = pageControler.page!;
      });
    });
  }

  @override
  void dispose() {
    pageControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider
        Container(
          height: Dimensions.size330,
          // color: Colors.red[300],
          child: PageView.builder(
            controller: pageControler,
            itemCount: _pageCount,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _pageCount,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        // Popular section
        Container(
          margin: EdgeInsets.only(left: Dimensions.size30, top: Dimensions.size30, right: Dimensions.size30),
          child: Column(
            children: [
              Row(
                children: [
                  BigText(text: 'Popular', color: Colors.black87,),
                  SizedBox(width: Dimensions.size10),
                  SmallText(text: '.', color: Colors.black38,),
                  SizedBox(width: Dimensions.size10,),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    child: SmallText(text: 'Food pairing', color: Colors.black38,)
                  )
                ],
              ),
              // list items
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        // food image
                        Container(
                          margin: EdgeInsets.only(bottom: Dimensions.size10, top: Dimensions.size10),
                          width: Dimensions.size130,
                          height: Dimensions.size130,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(Dimensions.size20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image/food1.jpg')
                            )
                          ),
                        ),
                        // food description
                        Expanded(
                          child: Container(
                            height: Dimensions.size10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.size20),
                                bottomRight: Radius.circular(Dimensions.size20)
                              ),
                              color: Colors.white
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(Dimensions.size10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: 'Food name Lorem Ipsum bla', color: Colors.black87,),
                                  SizedBox(height: 5,),
                                  SmallText(text: 'A descriptive food description', color: Colors.black38,),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: 'Normal',
                                        iconColor: Colors.amberAccent,
                                      ),
                                      IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: '1.7km',
                                        iconColor: Colors.blue,
                                      ),
                                      IconAndTextWidget(
                                        icon: Icons.access_time_outlined,
                                        text: '32min',
                                        iconColor: Colors.redAccent,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    
    matrix = scaleFoodCardPages(index);

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          // card image
          Container(
            height: _cardHeight,
            margin: EdgeInsets.only(left: Dimensions.size10, right: Dimensions.size10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.size30),
              color: Colors.blue,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/food1.jpg')
              )
            ),
            // child: Text('$index'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            // card description
            child: Container(
              height: Dimensions.size130,
              margin: EdgeInsets.only(left: Dimensions.size30, right: Dimensions.size30, bottom: Dimensions.size30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.size20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    offset: Offset(0, 3)
                  )
                ],
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.size10, right: 20, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Food name', color: Colors.black54, size: Dimensions.size20,),
                    // comments section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                              return Icon(Icons.star, color: Colors.blue, size: Dimensions.size20);
                            }
                          ),
                        ),
                        SmallText(text: '4.5', color: Colors.black38,),
                        SizedBox(width: 20,),
                        SmallText(text: '1287 comments', color: Colors.black38,),
                      ],
                    ),
                    // time and distance
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          iconColor: Colors.amberAccent,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: '1.7km',
                          iconColor: Colors.blue,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_outlined,
                          text: '32min',
                          iconColor: Colors.redAccent,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // logic for zoom in and out of food cards
  Matrix4 scaleFoodCardPages(int index) {
    if(index == _currentPageValue.floor()) {
      var currentScale = 1-(_currentPageValue - index)*(1-_scaleFactor);
      var currentTransformation = _cardHeight*(1-currentScale)/2;
      return Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);
    } 
    else if(index == _currentPageValue.floor()+1) {
      var currentScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currentTransformation = _cardHeight*(1-currentScale)/2;
      return Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);
    } 
    else if(index == _currentPageValue.floor()-1) {
      var currentScale = 1-(_currentPageValue - index)*(1-_scaleFactor);
      var currentTransformation = _cardHeight*(1-currentScale)/2;
      // matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      return Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);
    } 
    else {
      var currentScale = _scaleFactor;
      var currentTransformation = _cardHeight*(1-currentScale)/2;
      return Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);
    }
  }

}