import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/pages/cart/cart_page.dart';
import 'package:firebase_test/widgets/empty_bag_widget.dart';
import 'package:firebase_test/widgets/products/product_widget.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {
  static const routeName = "/WishListPage";

  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: Scaffold(
        appBar: AppBar(
          title: const TitleWidget(text: "wishlist (0)"),
        ),
        body: const EmptyBagWidget(
          subtitle:
              "Look like your wishlist is empty add something and make me happy :)",
          buttonText: "Shop now",
          title: "Nothing in your wishlist yet",
          imagePath: AppImages.userBagBagWish,
        ),
      ),
      visible: false,
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
          title: const TitleWidget(text: "wishlist (10)"),
        ),
        body: DynamicHeightGridView(
          builder: (context, index) {
            return const ProductWidget();
          },
          crossAxisCount: 2,
          itemCount: 20,
        ),
      ),
    );
  }
}
