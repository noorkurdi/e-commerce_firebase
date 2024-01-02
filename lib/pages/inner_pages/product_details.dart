import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/core/utils/media_query_values.dart';
import 'package:firebase_test/widgets/custom_shimmer_text_widget.dart';
import 'package:firebase_test/widgets/products/heart_btn.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});
  static const routeName = "/ProductDetailsPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: const CustomShimmerTextWidget(text: "ShopSmart"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: AppImages.networkShoesImage,
              height: context.height * .38,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TitleWidget(
                          text: "title" * 15,
                          softWrap: true,
                          fontSize: 20,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const FittedBox(
                        child: SubtitleTextWidget(
                          maxLines: 1,
                          text: "1550.00 \$",
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const HeartBtnWidget(),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: kBottomNavigationBarHeight - 10,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.add_shopping_cart_outlined),
                              label: const Text("Add to cart"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleWidget(text: "About this item"),
                      SubtitleTextWidget(text: "In Phone")
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SubtitleTextWidget(
                    text: "Description" * 29,
                    overflow: TextOverflow.visible,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
