import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/core/utils/media_query_values.dart';
import 'package:firebase_test/pages/inner_pages/product_details.dart';
import 'package:firebase_test/widgets/products/heart_btn.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetailsPage.routeName);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: AppImages.networkShoesImage,
                height: context.height * .22,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: TitleWidget(
                    text: "Nike shoes",
                    fontSize: 18,
                    maxLines: 2,
                  ),
                ),
                Flexible(
                  child: HeartBtnWidget(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 5,
                  child: SubtitleTextWidget(
                    maxLines: 1,
                    text: "1550.00 \$",
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Flexible(
                  child: IconButton(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_shopping_cart_rounded,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
