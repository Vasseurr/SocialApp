// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../core/extension/context_extension.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<String> names = [
    "Sefiller",
    "Uçurtma Avcısı",
    "1984",
    "Hayvan Çiftliği",
    "Son Ada"
  ];
  List<bool> isFavourited = List.generate(5, (index) => false);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Text(names[index]),
            trailing: InkWell(
              onTap: () {
                setState(() {
                  isFavourited[index] = !isFavourited[index];
                });
              },
              child: Icon(
                Icons.favorite,
                color: isFavourited[index] == false ? Colors.grey : Colors.red,
              ),
            ),
          ),
        );
      },
      padding: EdgeInsets.only(
        top: context.getHeight * 0.05,
        left: context.getWidth * 0.02,
        right: context.getWidth * 0.02,
      ),
      itemCount: 5,
    );
  }
}
