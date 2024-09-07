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

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            TopCont(content: 'Cart Items'),
            CustomText(
              content: 'Swipe left to delete an item',
              color: Colors.grey,
              font_size: 14,
            ),
            Expanded(
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
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 30,
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
                  font_size: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        content: 'Cart Subtotal:',
                        font_size: 16,
                        color: Colors.black,
                      ),
                      CustomText(
                        content: '\$${cartModel.totalPrice.toStringAsFixed(2)}',
                        font_size: 16,
                        color: Colors.black,
                        is_bold: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        content: 'Shipping Charge:',
                        font_size: 16,
                        color: Colors.black,
                      ),
                      CustomText(
                        content: '\$3.00',
                        font_size: 16,
                        color: Colors.black,
                        is_bold: true,
                      ),
                    ],
                  ),
                  Divider(thickness: 1, color: Colors.black),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        content: 'Total Amount:',
                        font_size: 18,
                        color: Colors.black,
                        is_bold: true,
                      ),
                      CustomText(
                        content: '\$${(cartModel.totalPrice + 3.00).toStringAsFixed(2)}', // Total including shipping
                        font_size: 18,
                        color: Colors.black,
                        is_bold: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                content: 'Check Out',
                onTap: () {
                  Navigator.pushNamed(context, '/checkoutpage');
                },
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        cartItem.product.imagePath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: CustomText(
        content: cartItem.product.name,
        is_bold: true,
        font_size: 16,
      ),
      subtitle: CustomText(
        content: '\$${cartItem.product.price.toStringAsFixed(2)} x ${cartItem.quantity}',
        font_size: 14,
        color: Colors.grey,
      ),
      trailing: CustomText(
        content: '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
        is_bold: true,
        font_size: 16,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
