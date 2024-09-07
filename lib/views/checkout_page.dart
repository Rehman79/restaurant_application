import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_button.dart';
import 'package:restaurant_app/utils/top_cont.dart';
import 'package:restaurant_app/Models/cart_model.dart';
import 'package:provider/provider.dart';
import '../utils/custom_text.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);

    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, // 5% padding horizontally
          vertical: screenHeight * 0.02, // 2% padding vertically
        ),
        child: Column(
          children: [
            TopCont(content: 'Checkout'),
            SizedBox(height: screenHeight * 0.02), // 2% vertical spacing
            // Checkout Form
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(content: 'Checkout Form', is_col_white: false),
                    SizedBox(height: screenHeight * 0.02), // Responsive spacing
                    _buildTextField('First Name', screenWidth),
                    _buildTextField('Last Name', screenWidth),
                    _buildTextField('Email', screenWidth),
                    _buildTextField('Phone Number', screenWidth),
                    _buildTextField('Address', screenWidth),
                    _buildTextField('Area', screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04), // 4% padding
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(content: 'Cart Summary', is_col_white: false),
                          SizedBox(height: screenHeight * 0.01),
                          // Cart Items
                          cartModel.items.isNotEmpty
                              ? Column(
                            children: cartModel.items.map((cartItem) {
                              return ListTile(
                                leading: Image.asset(
                                  cartItem.product.imagePath,
                                  width: screenWidth * 0.12, // 12% width
                                  height: screenWidth * 0.12, // 12% height
                                  fit: BoxFit.cover,
                                ),
                                title: CustomText(
                                    content: cartItem.product.name, is_col_white: false),
                                subtitle: CustomText(
                                    content:
                                    '\$${cartItem.product.price.toStringAsFixed(2)} x ${cartItem.quantity}',
                                    is_col_white: false),
                                trailing: CustomText(
                                    content:
                                    '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
                                    is_col_white: false),
                              );
                            }).toList(),
                          )
                              : CustomText(content: 'No items in cart.'),
                          Divider(thickness: 1, color: Colors.black),
                          SizedBox(height: screenHeight * 0.01),
                          _buildSummaryRow('Subtotal:', cartModel.totalPrice, screenWidth),
                          _buildSummaryRow('Shipping:', 3.00, screenWidth),
                          _buildSummaryRow('Discount:', 0.00, screenWidth), // Modify as needed
                          _buildSummaryRow('Tax:', 0.00, screenWidth), // Modify as needed
                          Divider(thickness: 1, color: Colors.black),
                          SizedBox(height: screenHeight * 0.01),
                          _buildSummaryRow(
                              'Total:', cartModel.totalPrice + 3.00, screenWidth),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomButton(content: 'Checkout', onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: CustomText(content: 'Checkout button pressed')));
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02), // Responsive padding
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: screenWidth * 0.045), // Responsive font size
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: screenWidth * 0.045, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
