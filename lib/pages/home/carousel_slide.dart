part of "advertisements_container.dart";

class CarouselSlide extends StatelessWidget {
  const CarouselSlide({
    super.key,
    required this.listLength,
    required this.sliderIndex,
  });

  final int listLength;
  final int sliderIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            listLength,
            ((index) {
              return AnimatedContainer(
                duration: const Duration(
                  milliseconds: 300,
                ),
                height: 7,
                width: index == sliderIndex ? 7 : 15,
                margin: const EdgeInsets.symmetric(
                  horizontal: 3,
                ),
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(10),
                  color: index == sliderIndex
                      ? Colors.red
                      : Colors.grey.withOpacity(0.3),
                ),
              );
            }),
          ),
        ),
        SizedBox(
          height: context.height * 0.03,
        )
      ],
    );
  }
}
