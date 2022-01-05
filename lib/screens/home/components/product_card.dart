import 'package:flutter/material.dart';
import 'package:flutter_traditional_snack/components/fav_btn.dart';
import 'package:flutter_traditional_snack/components/price.dart';
import 'package:flutter_traditional_snack/models/Product.dart';

import '../../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final Product product;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding * 1.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.title,
              child: Container(
                height: 150,
                width: 135,
                child: Image.asset(product.image),
              ),
            ),
            Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Fruits",
              style: Theme.of(context).textTheme.caption,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Price(amount: "20.00"),
                FavBtn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
