import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/Models/cart_model.dart';
import 'package:restaurant_app/Models/product_model.dart';
import 'package:restaurant_app/utils/custom_button.dart';
import 'package:restaurant_app/utils/quantity_counter.dart';
import 'package:restaurant_app/utils/review_list.dart';
import '../utils/custom_text.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedIndex = 0;
  int _selectedQuantity = 1; // Track selected quantity

  void _updateQuantity(int quantity) {
    setState(() {
      _selectedQuantity = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600; // Example breakpoint for wider screens

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          content: widget.product.name,
          is_bold: true,
          font_size: isWideScreen ? 24 : 22, // Adjust font size based on screen width
          fam_federo: true,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Image.asset(
            widget.product.imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomText(
              content: '${widget.product.name}',
              is_col_white: false,
              font_size: isWideScreen ? 32 : 30,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomText(
              content: widget.product.ingredients,
              is_bold: false,
              font_size: isWideScreen ? 20 : 18,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          // Overall Rating
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Rating: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: isWideScreen ? 20 : 18)),
                Icon(Icons.star, color: Colors.amber, size: isWideScreen ? 24 : 20),
                Text('${widget.product.averageRating.toStringAsFixed(1)}', style: TextStyle(fontSize: isWideScreen ? 20 : 18)),
                SizedBox(width: 8),
                Text('(${widget.product.reviews.length} reviews)', style: TextStyle(fontSize: isWideScreen ? 18 : 16, color: Colors.grey)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CustomText(
                  content: '\$${widget.product.price.toStringAsFixed(2)}',
                  is_bold: true,
                  font_size: isWideScreen ? 24 : 22,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: QuantityCounter(onQuantityChanged: _updateQuantity), // Pass the callback
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    content: 'Add to Cart',
                    onTap: () {
                      Provider.of<CartModel>(context, listen: false).addProduct(widget.product, _selectedQuantity);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${widget.product.name} added to cart!')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Tabs for Description and Reviews
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedIndex = 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 0 ? Colors.grey : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: CustomText(
                        content: 'Description',
                        is_bold: _selectedIndex == 0,
                        font_size: isWideScreen ? 22 : 20,
                        color: _selectedIndex == 0 ? Theme.of(context).primaryColor : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedIndex = 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 1 ? Colors.grey : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: CustomText(
                        content: 'Reviews',
                        is_bold: _selectedIndex == 1,
                        font_size: isWideScreen ? 22 : 20,
                        color: _selectedIndex == 1 ? Theme.of(context).primaryColor : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Show content based on selected tab
          Expanded(
            child: _selectedIndex == 0
                ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomText(
                  content: widget.product.description,
                  is_bold: false,
                  font_size: isWideScreen ? 18 : 16,
                  color: Colors.black,
                ),
              ),
            )
                : ReviewList(product: widget.product),
          ),
        ],
      ),
    );
  }
}
