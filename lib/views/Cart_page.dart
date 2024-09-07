import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/Models/cart_model.dart';
import 'package:restaurant_app/utils/coupon_section.dart';
import 'package:restaurant_app/utils/custom_button.dart';
import 'package:restaurant_app/utils/custom_text.dart';
import 'package:restaurant_app/utils/top_cont.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController couponController = TextEditingController();
    final cartModel = Provider.of<CartModel>(context);

    // Get screen dimensions and keyboard height
    final mediaQuery = MediaQuery.of(context);
    final keyboardHeight = mediaQuery.viewInsets.bottom;
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: keyboardHeight),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopCont(content: 'Cart Items'),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, // Responsive padding
                ),
                child: CustomText(
                  content: 'Swipe left to delete an item',
                  color: Colors.grey,
                  font_size: screenWidth * 0.035, // Responsive font size
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Container(
                height: screenHeight * 0.4, // Adjust height responsively
                child: cartModel.items.isNotEmpty
                    ? ListView.builder(
                  itemCount: cartModel.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartModel.items[index];
                    return Dismissible(
                      key: ValueKey(cartItem),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: screenWidth * 0.08, // Responsive icon size
                            ),
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        cartModel.removeProduct(cartItem.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${cartItem.product.name} removed from cart'),
                          ),
                        );
                      },
                      child: CartItemWidget(cartItem: cartItem),
                    );
                  },
                )
                    : Center(
                  child: CustomText(
                    content: 'No items in cart.',
                    font_size: screenWidth * 0.04, // Responsive font size
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                child: CouponSection(
                  couponController: couponController,
                  onApplyCoupon: () {
                    // Handle the coupon application logic here
                    final couponCode = couponController.text;
                    // Apply coupon logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Coupon code $couponCode applied!'),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // Responsive padding
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRow(
                        'Cart Subtotal:',
                        '\$${cartModel.totalPrice.toStringAsFixed(2)}',
                        screenWidth,
                      ),
                      SizedBox(height: screenHeight * 0.01), // Responsive spacing
                      _buildRow(
                        'Shipping Charge:',
                        '\$3.00',
                        screenWidth,
                      ),
                      Divider(thickness: 1, color: Colors.black),
                      SizedBox(height: screenHeight * 0.01), // Responsive spacing
                      _buildRow(
                        'Total Amount:',
                        '\$${(cartModel.totalPrice + 3.00).toStringAsFixed(2)}', // Total including shipping
                        screenWidth,
                        isBold: true,
                        fontSize: screenWidth * 0.045, // Responsive font size for total amount
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // Responsive padding
                child: CustomButton(
                  content: 'Check Out',
                  onTap: () {
                    Navigator.pushNamed(context, '/checkoutpage');
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, double screenWidth, {bool isBold = false, double? fontSize}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          content: label,
          font_size: fontSize ?? screenWidth * 0.04, // Responsive font size
          color: Colors.black,
        ),
        CustomText(
          content: value,
          font_size: fontSize ?? screenWidth * 0.04, // Responsive font size
          color: Colors.black,
          is_bold: isBold,
        ),
      ],
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Image.asset(
        cartItem.product.imagePath,
        width: screenWidth * 0.15, // Responsive width
        height: screenWidth * 0.15, // Responsive height
        fit: BoxFit.cover,
      ),
      title: CustomText(
        content: cartItem.product.name,
        is_bold: true,
        font_size: screenWidth * 0.045, // Responsive font size
      ),
      subtitle: CustomText(
        content: '\$${cartItem.product.price.toStringAsFixed(2)} x ${cartItem.quantity}',
        font_size: screenWidth * 0.04, // Responsive font size
        color: Colors.grey,
      ),
      trailing: CustomText(
        content: '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
        is_bold: true,
        font_size: screenWidth * 0.045, // Responsive font size
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
