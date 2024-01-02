import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/core/utils/media_query_values.dart';
import 'package:firebase_test/pages/inner_pages/product_details.dart';
import 'package:firebase_test/widgets/products/heart_btn.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetailsPage.routeName);
        },
        child: SizedBox(
          width: context.width * .55,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl: AppImages.networkShoesImage,
                    height: context.height * .28,
                    width: context.width * .32,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    TitleWidget(
                      text: "title" * 5,
                      maxLines: 2,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          const HeartBtnWidget(),
                          IconButton(
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_shopping_cart_rounded,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Flexible(
                      child: FittedBox(
                        child: SubtitleTextWidget(
                          maxLines: 1,
                          text: "1550.00 \$",
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
