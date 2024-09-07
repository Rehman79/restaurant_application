import 'package:flutter/material.dart';

class QuantityCounter extends StatefulWidget {
  final Function(int) onQuantityChanged; // Callback function to report quantity changes

  QuantityCounter({required this.onQuantityChanged});

  @override
  _QuantityCounterState createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (_quantity > 1) {
              setState(() {
                _quantity--;
                widget.onQuantityChanged(_quantity); // Notify parent of the quantity change
              });
            }
          },
        ),
        Text('$_quantity'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _quantity++;
              widget.onQuantityChanged(_quantity); // Notify parent of the quantity change
            });
          },
        ),
      ],
    );
  }
}
