part of "cart_page.dart";

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              await Navigator.pushNamed(context, ProductDetailsPage.routeName);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    height: context.height * .2,
                    width: context.width * .3,
                    imageUrl: AppImages.networkShoesImage,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IntrinsicWidth(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.width * .6,
                            child: TitleWidget(
                              text: "title" * 15,
                              maxLines: 2,
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                              ),
                              const HeartBtnWidget(),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SubtitleTextWidget(
                            text: "16.00\$",
                            color: Colors.blue,
                          ),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              // side: BorderSide(width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(40)),
                                ),
                                context: context,
                                builder: (context) {
                                  return const QuantityBottomSheet();
                                },
                              );
                            },
                            icon: const Icon(IconlyLight.arrowDown2),
                            label: const Text(
                              "Qty: 6",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
