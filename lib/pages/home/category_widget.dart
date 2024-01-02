part of "home_page.dart";

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.imgPath,
    required this.category,
  }) : super(key: key);
  final String imgPath;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        children: [
          Image.asset(
            imgPath,
            height: 50,
            width: 50,
          ),
          Flexible(
            child: FittedBox(
              child: SubtitleTextWidget(
                maxLines: 1,
                text: category,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
