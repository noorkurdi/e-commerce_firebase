import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/pages/cart/cart_page.dart';
import 'package:firebase_test/widgets/empty_bag_widget.dart';
import 'package:firebase_test/widgets/products/product_widget.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ViewedRecentlyPage extends StatelessWidget {
  static const routeName = "/ViewedRecentlyPage";
  const ViewedRecentlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: Scaffold(
        appBar: AppBar(
          title: const TitleWidget(text: "Viewed recently (10)"),
        ),
        body: const EmptyBagWidget(
          subtitle:
              "Look like your viewed products is empty see something and make me happy :)",
          buttonText: "Shop now",
          title: "No viewed products yet!",
          imagePath: AppImages.userBagOrder,
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
          title: const TitleWidget(text: "Viewed recently (10)"),
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
