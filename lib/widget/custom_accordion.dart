
import 'package:flutter/material.dart';

class CustomAccordion extends StatefulWidget {
  final String title;
  final String? trailing_icon;
  final Widget content;

  const CustomAccordion({Key? key, required this.title,this.trailing_icon, required this.content})
      : super(key: key);

  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          tileColor: Colors.transparent,
          // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          title: Text(
            widget.title,
            // style:text_style().text_size_16_black_500,
          ),
          trailing: widget.trailing_icon==null?Icon(
            _isExpanded ? Icons.expand_less : Icons.expand_more,
            color:Colors.black
          ):null,
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // height: _isExpanded ? 100 : 0,
          child: _isExpanded?widget.content:const SizedBox(),
        ),
        widget.trailing_icon==null? const Divider():const SizedBox()
      ],
    );
  }
}
