part of "search_page.dart";

class SearchInput extends StatelessWidget {
  final TextEditingController? textController;
  final String hintText;
  final Color? fillColor;
  final Function(String)? onChanged;
  final bool isClearIconVisible;
  final void Function()? clearEvent;
  const SearchInput(
      {required this.textController,
      required this.clearEvent,
      required this.hintText,
      required this.fillColor,
      this.isClearIconVisible = false,
      this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        onSubmitted: (value) {
          if (isClearIconVisible) {
            log("message");
            Navigator.pop(context);
          }
        },
        style: const TextStyle(color: Colors.black, fontSize: 17),
        controller: textController,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: isClearIconVisible,
            child: GestureDetector(
              onTap: clearEvent,
              child: const Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff4338CA),
          ),
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
