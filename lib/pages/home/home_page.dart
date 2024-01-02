import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/core/utils/media_query_values.dart';
import 'package:firebase_test/pages/home/advertisements_container.dart';
import 'package:firebase_test/providers/slider_provider.dart';
import 'package:firebase_test/widgets/custom_shimmer_text_widget.dart';
import 'package:firebase_test/widgets/products/latest_arrival_widget.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'category_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    final sliderProvider = Provider.of<SliderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomShimmerTextWidget(text: "ShopSmart"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset(AppImages.adminShoppingCart),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              AdvertisementsContainer(
                  sliderIndex: sliderProvider.getSliderIndex),
              // SizedBox(
              //   height: context.height * .25,
              //   width: context.width,
              //   child: Swiper(
              //     itemBuilder: (context, index) {
              //       return Image.asset(AppImages.sliderImages[0]);
              //     },
              //     itemCount: AppImages.sliderImages.length,
              //     autoplay: true,
              //     duration: 500,
              //     allowImplicitScrolling: true,
              //     containerWidth: context.width,
              //     containerHeight: context.height * .25,
              //     fade: 0.05,
              //     pagination: const SwiperPagination(
              //       alignment: Alignment.bottomCenter,
              //       builder: DotSwiperPaginationBuilder(
              //         activeColor: Colors.red,
              //         color: Colors.grey,
              //       ),
              //       margin: EdgeInsets.all(15),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              const TitleWidget(text: "Latest arrival"),
              SizedBox(
                height: context.height * .24,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const LatestArrivalProductWidget();
                  },
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const TitleWidget(text: "Categories"),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: context.height * .3,
                child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children:
                        List.generate(AppLists.categories.length, (index) {
                      return CategoryWidget(
                          imgPath: AppLists.categories[index].imgPath,
                          category: AppLists.categories[index].name);
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
