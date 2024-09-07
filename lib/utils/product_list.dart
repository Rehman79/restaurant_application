import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_button.dart';
import '../Models/Review_model.dart';
import '../Models/product_model.dart';
import '../views/product_details_page.dart';
import 'category_tab_bar.dart';
import 'custom_text.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // List of Products
  final List<Product> _products = [
    // Starters
    Product(
      name: 'Bruschetta',
      ingredients: 'Tomato, Basil, Garlic, Olive Oil',
      category: 'STARTER',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 12.00,
      description: 'A delightful Italian starter made with fresh tomatoes, basil, and garlic served on toasted bread.',
      reviews: [
        Review(reviewer: 'John', comment: 'Amazing appetizer!', rating: 4.5),
        Review(reviewer: 'Jane', comment: 'Loved the fresh flavors.', rating: 4.0),
        Review(reviewer: 'Sam', comment: 'Perfect for sharing.', rating: 4.2),
      ],
    ),
    Product(
      name: 'Stuffed Mushrooms',
      ingredients: 'Mushrooms, Cheese, Garlic, Herbs',
      category: 'STARTER',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 14.00,
      description: 'Savory mushrooms stuffed with a cheesy garlic herb filling and baked to perfection.',
      reviews: [
        Review(reviewer: 'Emily', comment: 'A cheesy delight!', rating: 4.8),
        Review(reviewer: 'Chris', comment: 'Best stuffed mushrooms I\'ve had!', rating: 5.0),
        Review(reviewer: 'Anna', comment: 'Mushrooms were perfectly cooked.', rating: 4.6),
      ],
    ),
    Product(
      name: 'Caesar Salad',
      ingredients: 'Romaine Lettuce, Caesar Dressing, Croutons, Parmesan',
      category: 'STARTER',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 11.00,
      description: 'Classic Caesar salad with crisp romaine lettuce, creamy Caesar dressing, croutons, and shaved Parmesan.',
      reviews: [
        Review(reviewer: 'Alice', comment: 'Fresh and crispy!', rating: 4.4),
        Review(reviewer: 'Bob', comment: 'Loved the dressing.', rating: 4.2),
        Review(reviewer: 'Eve', comment: 'Croutons were crunchy and delicious.', rating: 4.3),
      ],
    ),
    Product(
      name: 'Garlic Bread',
      ingredients: 'Bread, Garlic, Butter, Parsley',
      category: 'STARTER',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 8.00,
      description: 'Toasted bread topped with garlic butter and parsley, the perfect side dish to any meal.',
      reviews: [
        Review(reviewer: 'Tom', comment: 'Perfectly garlicky!', rating: 4.6),
        Review(reviewer: 'Linda', comment: 'Soft and crispy.', rating: 4.4),
        Review(reviewer: 'Michael', comment: 'A great side dish.', rating: 4.5),
      ],
    ),

    // Main Course
    Product(
      name: 'Spaghetti Carbonara',
      ingredients: 'Spaghetti, Bacon, Egg, Parmesan',
      category: 'MAIN COURSE',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 18.00,
      description: 'Creamy spaghetti with crispy bacon, egg yolk, and grated Parmesan cheese, an Italian classic.',
      reviews: [
        Review(reviewer: 'Sarah', comment: 'Rich and flavorful!', rating: 4.7),
        Review(reviewer: 'James', comment: 'Loved the crispy bacon.', rating: 4.6),
        Review(reviewer: 'Laura', comment: 'Perfectly cooked pasta.', rating: 4.8),
      ],
    ),
    Product(
      name: 'Chicken Alfredo',
      ingredients: 'Chicken, Alfredo Sauce, Fettuccine, Parmesan',
      category: 'MAIN COURSE',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 20.00,
      description: 'Tender chicken served over fettuccine pasta tossed in a creamy Alfredo sauce with Parmesan cheese.',
      reviews: [
        Review(reviewer: 'Paul', comment: 'Creamy and delicious!', rating: 4.9),
        Review(reviewer: 'Nancy', comment: 'The chicken was tender.', rating: 4.8),
        Review(reviewer: 'Roger', comment: 'A hearty and satisfying meal.', rating: 4.7),
      ],
    ),
    Product(
      name: 'Beef Stroganoff',
      ingredients: 'Beef, Mushrooms, Onions, Sour Cream',
      category: 'MAIN COURSE',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 22.00,
      description: 'Tender beef in a creamy mushroom and onion sauce, served over egg noodles.',
      reviews: [
        Review(reviewer: 'Hannah', comment: 'Hearty and comforting.', rating: 4.5),
        Review(reviewer: 'Olivia', comment: 'Beef was so tender!', rating: 4.6),
        Review(reviewer: 'Daniel', comment: 'Rich and flavorful sauce.', rating: 4.7),
      ],
    ),
    Product(
      name: 'Vegetable Stir Fry',
      ingredients: 'Mixed Vegetables, Soy Sauce, Garlic, Ginger',
      category: 'MAIN COURSE',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 16.00,
      description: 'A healthy mix of stir-fried vegetables tossed in soy sauce, garlic, and ginger.',
      reviews: [
        Review(reviewer: 'Sophia', comment: 'Fresh and vibrant.', rating: 4.4),
        Review(reviewer: 'Lucas', comment: 'Perfectly cooked veggies!', rating: 4.5),
        Review(reviewer: 'Mia', comment: 'Loved the sauce.', rating: 4.3),
      ],
    ),

    // Desserts
    Product(
      name: 'Chocolate Lava Cake',
      ingredients: 'Chocolate, Flour, Eggs, Sugar',
      category: 'DESSERTS',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 8.00,
      description: 'A rich chocolate cake with a gooey molten chocolate center.',
      reviews: [
        Review(reviewer: 'Ella', comment: 'Decadent and delicious!', rating: 4.9),
        Review(reviewer: 'Aiden', comment: 'The molten center was perfect.', rating: 4.8),
        Review(reviewer: 'Chloe', comment: 'A chocolate lover\'s dream.', rating: 4.7),
      ],
    ),
    Product(
      name: 'Cheesecake',
      ingredients: 'Cream Cheese, Sugar, Graham Cracker Crust',
      category: 'DESSERTS',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 9.00,
      description: 'Creamy cheesecake with a graham cracker crust, served with a berry topping.',
      reviews: [
        Review(reviewer: 'Ethan', comment: 'So creamy!', rating: 4.6),
        Review(reviewer: 'Mia', comment: 'Loved the graham crust.', rating: 4.5),
        Review(reviewer: 'Zoe', comment: 'The berry topping was perfect.', rating: 4.7),
      ],
    ),
    Product(
      name: 'Tiramisu',
      ingredients: 'Mascarpone, Coffee, Ladyfingers, Cocoa',
      category: 'DESSERTS',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 10.00,
      description: 'Classic Italian dessert with layers of mascarpone cream, coffee-soaked ladyfingers, and cocoa.',
      reviews: [
        Review(reviewer: 'Liam', comment: 'Rich and creamy.', rating: 4.8),
        Review(reviewer: 'Aria', comment: 'Perfect coffee flavor.', rating: 4.7),
        Review(reviewer: 'Noah', comment: 'Loved every bite!', rating: 4.9),
      ],
    ),
    Product(
      name: 'Apple Pie',
      ingredients: 'Apples, Sugar, Cinnamon, Pie Crust',
      category: 'DESSERTS',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 7.00,
      description: 'Classic apple pie with spiced apples and a flaky pie crust.',
      reviews: [
        Review(reviewer: 'Mason', comment: 'Warm and comforting.', rating: 4.6),
        Review(reviewer: 'Emma', comment: 'Loved the cinnamon flavor.', rating: 4.5),
        Review(reviewer: 'Oliver', comment: 'The crust was perfectly flaky.', rating: 4.7),
      ],
    ),

    // Drinks
    Product(
      name: 'Mojito',
      ingredients: 'Mint, Lime, Sugar, Rum',
      category: 'DRINKS',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 10.00,
      description: 'A refreshing cocktail with mint, lime, sugar, and rum served over ice.',
      reviews: [
        Review(reviewer: 'Grace', comment: 'So refreshing!', rating: 4.7),
        Review(reviewer: 'Ava', comment: 'Perfect for summer.', rating: 4.6),
        Review(reviewer: 'Eli', comment: 'Loved the minty flavor.', rating: 4.8),
      ],
    ),
    Product(
      name: 'Iced Coffee',
      ingredients: 'Coffee, Ice, Milk, Sugar',
      category: 'DRINKS',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 7.00,
      description: 'Chilled coffee with milk and sugar, served over ice.',
      reviews: [
        Review(reviewer: 'Logan', comment: 'Perfect pick-me-up.', rating: 4.5),
        Review(reviewer: 'Zoe', comment: 'Just the right amount of sweetness.', rating: 4.6),
        Review(reviewer: 'Aiden', comment: 'Refreshing and bold.', rating: 4.4),
      ],
    ),
    Product(
      name: 'Mango Smoothie',
      ingredients: 'Mango, Yogurt, Honey, Ice',
      category: 'DRINKS',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 9.00,
      description: 'A creamy smoothie made with fresh mangoes, yogurt, honey, and ice.',
      reviews: [
        Review(reviewer: 'Lily', comment: 'So creamy and delicious!', rating: 4.8),
        Review(reviewer: 'Leo', comment: 'Perfectly sweet.', rating: 4.7),
        Review(reviewer: 'Sophie', comment: 'Loved the fresh mango flavor.', rating: 4.9),
      ],
    ),
    Product(
      name: 'Lemonade',
      ingredients: 'Lemon, Sugar, Water, Ice',
      category: 'DRINKS',
      imagePath: 'lib/Assets/img/deliciousmeal_three.jpg',
      price: 6.00,
      description: 'Refreshing homemade lemonade made with fresh lemons, sugar, and water.',
      reviews: [
        Review(reviewer: 'Jack', comment: 'So refreshing!', rating: 4.6),
        Review(reviewer: 'Avery', comment: 'Loved the tartness.', rating: 4.5),
        Review(reviewer: 'Ella', comment: 'Perfect balance of sweet and sour.', rating: 4.7),
      ],
    ),
  ];
  // Selected Category
  String selectedCategory = 'STARTER';

  @override
  Widget build(BuildContext context) {
    // Filter the products based on the selected category
    List<Product> filteredProducts = _products
        .where((product) => product.category.toUpperCase() == selectedCategory.toUpperCase())
        .toList();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          CustomButton(content: 'Go to Cart', onTap: (){
            Navigator.pushNamed(context, '/cartpage');
          }),
          SizedBox(height: 10,),
          CategoryTabBar(
            selectedCategory: selectedCategory,
            onCategoryChanged: (category) {
              setState(() {
                selectedCategory = category.toUpperCase(); // Ensure the selected category is uppercase
              });
            },
          ),
          // ListView to show filtered products
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(product: product),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Image.asset(
                          product.imagePath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: CustomText(
                          content: product.name,
                          font_size: 18,
                          is_bold: true,
                          color: Colors.black,
                        ),
                        subtitle: CustomText(
                          content: product.ingredients,
                          font_size: 14,
                          color: Colors.grey,
                        ),
                        trailing: CustomText(
                          content: '\$${product.price.toStringAsFixed(2)}',
                          font_size: 16,
                          is_bold: true,
                          color: Colors.black,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
