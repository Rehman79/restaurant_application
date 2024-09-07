import 'package:flutter/material.dart';

class CategoryTabBar extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;

  CategoryTabBar({required this.selectedCategory, required this.onCategoryChanged});

  // List of categories in uppercase
  final List<String> categories = ['STARTER', 'MAIN COURSE', 'DESSERTS', 'DRINKS'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              onCategoryChanged(category.toUpperCase()); // Ensure the selected category is uppercase
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category.toUpperCase(), // Convert to uppercase when displaying
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Federo',
                      fontWeight: selectedCategory.toUpperCase() == category
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: selectedCategory.toUpperCase() == category ? Colors.black : Colors.grey,
                    ),
                  ),
                  if (selectedCategory.toUpperCase() == category)
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 2,
                      width: 30,
                      color: Colors.green,
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
