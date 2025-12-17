import 'package:flutter/material.dart';

import '../../../core/constant/imgaeasset.dart';

class CardAdminHome extends StatelessWidget {
  final String url;
  final String title;
  final void Function()?onClick;

  const CardAdminHome({super.key, required this.url, required this.title, this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,//(){},
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
             url, //AppImageAsset.avatar,
              width: 70,
            ),
            Text("$title",
                style: const TextStyle(fontSize: 20)
            ),
          ],
        ),
      ),
    );
  }
}