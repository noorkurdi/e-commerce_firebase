import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/core/utils/media_query_values.dart';
import 'package:firebase_test/pages/inner_pages/product_details.dart';
import 'package:firebase_test/widgets/empty_bag_widget.dart';
import 'package:firebase_test/widgets/products/heart_btn.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

part 'cart_widget.dart';
part 'bottom_checkout.dart';
part 'quantity_bottom_sheet.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: const Scaffold(
        body: EmptyBagWidget(
          subtitle:
              "Look like your cart is empty add something and make me happy",
          buttonText: "Shop now",
          title: "Your cart is empty!",
          imagePath: AppImages.userBagShoppingBasket,
        ),
      ),
      visible: true,
      child: Scaffold(
        bottomSheet: const CartBottomSheetWidget(),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.red,
              ),
            )
          ],
          title: const TitleWidget(text: "Cart (10)"),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset(AppImages.adminShoppingCart),
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CartWidget();
          },
        ),
      ),
    );
  }
}
