import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/core/utils/media_query_values.dart';
import 'package:firebase_test/providers/slider_provider.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

part 'carousel_slide.dart';

class AdvertisementsContainer extends StatelessWidget {
  const AdvertisementsContainer({
    super.key,
    required this.sliderIndex,
  });
  final int sliderIndex;
  @override
  Widget build(BuildContext context) {
    final sliverProvider = Provider.of<SliderProvider>(context);
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: AppImages.sliderImages.length,
          itemBuilder: (context, index, realIndex) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                side: const BorderSide(
                  color: Colors.black87,
                  width: 1,
                ),
              ),
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      AppImages.sliderImages[index],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 150,
            initialPage: 0,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              sliverProvider.changeSliderIndex(index);
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CarouselSlide(
          listLength: AppImages.sliderImages.length,
          sliderIndex: sliderIndex,
        )
      ],
    );
  }
}
