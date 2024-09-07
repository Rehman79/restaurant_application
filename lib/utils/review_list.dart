import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/product_model.dart';
import 'custom_text.dart';

class ReviewList extends StatelessWidget {
  Product product;

  ReviewList({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product.reviews.length,
      itemBuilder: (context, index) {
        final review = product.reviews[index];
        return Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: CustomText(
                content: review.reviewer,
                is_bold: true,
                is_col_white: false,
                font_size: 18,
              ),
              subtitle: CustomText(
                content: review.comment,
                is_bold: false,
                font_size: 16,
                color: Colors.black,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star,
                      color: Colors.amber, size: 20),
                  CustomText(
                    content: '${review.rating} ★',
                    is_bold: true,
                    font_size: 16,
                    color:
                    Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
