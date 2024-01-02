import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:firebase_test/pages/inner_pages/viewed_recently.dart';
import 'package:firebase_test/pages/inner_pages/wishlist.dart';
import 'package:firebase_test/providers/theme_provider.dart';
import 'package:firebase_test/services/my_app_functions.dart';
import 'package:firebase_test/widgets/custom_list_tile.dart';
import 'package:firebase_test/widgets/custom_shimmer_text_widget.dart';
import 'package:firebase_test/widgets/subtitle_text.dart';
import 'package:firebase_test/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomShimmerTextWidget(text: "ShopSmart"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset(AppImages.adminShoppingCart),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Visibility(
              visible: false,
              child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: TitleWidget(text: "Please login to have access")),
            ),
            Visibility(
              visible: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).cardColor,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.background,
                              width: 3,
                            ),
                            image: DecorationImage(image: imageProvider),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleWidget(
                          text: "Noor Kurdi",
                        ),
                        SubtitleTextWidget(text: "noor@gmail.com")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWidget(text: "General"),
                  const SizedBox(height: 10),
                  CustomListTile(
                    imagePath: AppLists.profileListTile[0]['icon'],
                    text: AppLists.profileListTile[0]['lable'],
                    onTab: () {},
                  ),
                  CustomListTile(
                    imagePath: AppLists.profileListTile[1]['icon'],
                    text: AppLists.profileListTile[1]['lable'],
                    onTab: () async {
                      await Navigator.pushNamed(
                        context,
                        WishListPage.routeName,
                      );
                    },
                  ),
                  CustomListTile(
                    imagePath: AppLists.profileListTile[2]['icon'],
                    text: AppLists.profileListTile[2]['lable'],
                    onTab: () async {
                      await Navigator.pushNamed(
                        context,
                        ViewedRecentlyPage.routeName,
                      );
                    },
                  ),
                  CustomListTile(
                    imagePath: AppLists.profileListTile[3]['icon'],
                    text: AppLists.profileListTile[3]['lable'],
                    onTab: () {},
                  ),
                  const Divider(thickness: 2),
                  const TitleWidget(text: "Settings"),
                  const SizedBox(
                    height: 10,
                  ),
                  SwitchListTile(
                    secondary: Image.asset(
                      AppImages.userProfileTheme,
                      height: 34,
                    ),
                    title: Text(
                        themeProvider.darkTheme ? "Light Mode" : "Dark Mode"),
                    value: themeProvider.darkTheme,
                    onChanged: (value) {
                      themeProvider.setDarkTheme(value);
                    },
                  ),
                  const Divider(thickness: 2),
                  const TitleWidget(text: "Privacy"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomListTile(
                    imagePath: AppImages.userProfilePrivacy,
                    onTab: () {},
                    text: "Privacy Policy",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        await AppFunctions.showErrorOrWarningDialog(
                          context: context,
                          fct: () {},
                          isError: false,
                          subTitle: "Are you sure you want to signout?",
                        );
                      },
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text("Logout"),
                    ),
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
