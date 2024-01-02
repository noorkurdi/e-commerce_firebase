part of "cart_page.dart";

class QuantityBottomSheet extends StatelessWidget {
  const QuantityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 25,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: index == 6 - 1
                        ? Center(
                            child: CircleAvatar(
                              child: SubtitleTextWidget(text: "${index + 1}"),
                            ),
                          )
                        : Center(
                            child: SubtitleTextWidget(text: "${index + 1}"))),
              );
            },
          ),
        ),
      ],
    );
  }
}
