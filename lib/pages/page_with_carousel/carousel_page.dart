import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:l2helper_v2/data_base/data_base.dart';
import 'package:l2helper_v2/pages/page_with_carousel/carousel_item.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  CarouselController buttonCarouselController = CarouselController();

  List<CarouselItem> carouselItems = [
    CarouselItem(
      title: 'Draconic Bow',
      image: 'images/dbHD.jpg',
      resources: draconicBow,
      lowResources: draconicBowLowRes,
    ),
    CarouselItem(
      title: 'Arcana Mace',
      image: 'images/amHD.jpg',
      resources: arcanaMace,
      lowResources: arcanaMaceLowRes,
    ),
    CarouselItem(
      title: 'Heavens Divider',
      image: 'images/hdHD.jpg',
      resources: heavensDivider,
      lowResources: heavensDividerLowRes,
    ),
    CarouselItem(
      title: "Dark Legion's Edge",
      image: 'images/dleHD.jpg',
      resources: darkLegion,
      lowResources: darkLegionLowRes,
    ),
    CarouselItem(
      title: "Tallum blade",
      image: 'images/tallumHD.jpg',
      resources: tallumBlade,
      lowResources: tallumBladeLowRes,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Choose weapon',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
        foregroundColor: Colors.black54,
        shadowColor: Colors.black54,
        surfaceTintColor: Colors.black54,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                  'images/giran.jpg',
                ),
              ),
            ),
          ),
          // Image.asset(
          //   'images/giran.jpg',
          //   width: 1.sw,
          //   height: 1.sh,
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: carouselItems,
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    height: 500.h,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () =>
                            buttonCarouselController.previousPage(),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black26),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black26),
                          overlayColor:
                              MaterialStateProperty.all(Colors.black26),
                          shadowColor:
                              MaterialStateProperty.all(Colors.black26),
                        ),
                        child: const Text(
                          'Previous',
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(width: 10.w),
                    ElevatedButton(
                        onPressed: () => buttonCarouselController.nextPage(),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black26),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black26),
                          overlayColor:
                              MaterialStateProperty.all(Colors.black26),
                          shadowColor:
                              MaterialStateProperty.all(Colors.black26),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
