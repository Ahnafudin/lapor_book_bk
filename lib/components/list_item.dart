import 'package:flutter/material.dart';
import 'package:lapor_book_bk/components/styles.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image.asset(
            'assets/istock-default.jpg',
            width: 130,
            height: 130,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(width: 2))),
            child: Text(
              'Judul',
              style: headerStyle(level: 4),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: warningColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                      ),
                      border: const Border.symmetric(
                          vertical: BorderSide(width: 1))),
                  alignment: Alignment.center,
                  child: Text("posted"),
                ),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: successColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(5)),
                          border: const Border.symmetric(
                              vertical: BorderSide(width: 1))),
                      alignment: Alignment.center,
                      child: Text(
                        "01/01/2001",
                        style: headerStyle(level: 5, dark: false),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
