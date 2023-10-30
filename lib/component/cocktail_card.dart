import 'package:flutter/material.dart';

import 'custom_text.dart';

class CocktailCard extends StatelessWidget {
  final String? imageUrl;
  final String? cardText;
  final bool favoriteIconFilled;
  final void Function()? onTap;

  const CocktailCard({
    super.key,
    required this.imageUrl,
    required this.cardText,
    required this.favoriteIconFilled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Row(children: [
            SizedBox(height: 100, width: 100, child: Image.network(imageUrl!)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomText(
                text: cardText!,
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 20,
            )
          ]),
        ),
      ),
    );
  }
}
