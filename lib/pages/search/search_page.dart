import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/providers/search_provider.dart';
import 'package:firebase_test/providers/theme_provider.dart';
import 'package:firebase_test/widgets/products/product_widget.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const TitleWidget(text: "Search products"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset(AppImages.adminShoppingCart),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchInput(
              clearEvent: () {
                FocusScope.of(context).unfocus();
                searchProvider.searchBarController.clear();
              },
              isClearIconVisible:
                  searchProvider.searchBarController.text.isNotEmpty,
              textController: searchProvider.searchBarController,
              onChanged: (val) {
                searchProvider.isSearchEmpty(val);
              },
              hintText: "Search",
              fillColor: themeProvider.darkTheme ? Colors.white : null,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: DynamicHeightGridView(
                builder: (context, index) {
                  return const ProductWidget();
                },
                crossAxisCount: 2,
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
