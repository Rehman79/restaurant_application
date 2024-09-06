**Restaurant App Documentation**

**Overview**

The Restaurant App is a Flutter-based mobile application designed to provide users with a seamless experience for browsing a restaurant’s menu, viewing product details, and managing their cart. The app features product details, user reviews, and supports multiple themes. It integrates state management using Provider, custom navigation with Curved Navigation Bar, URL launching, and various UI effects.

**Table of Contents**

**dependencies:**
 
  flutter:
  
  provider: ^x.x.x
  
  curved_navigation_bar: ^x.x.x
  
  url_launcher: ^x.x.x
  
  glassmorphism: ^x.x.x
  
  cupertino_icons: ^x.x.x
  
  carousel_slider: ^x.x.x

**Main Components**

**ProductDetailsPage**

Displays detailed information about a selected product, including image, name, ingredients, rating, and reviews. Allows users to adjust the quantity and add the product to their cart.

**Features:**

Product image and details

Rating and reviews

Quantity counter

Add to Cart button

Description and Reviews tabs

CartPage

Shows the items in the user's cart, with the ability to update quantities or remove items. Displays a summary of costs and a checkout button.

**Features:**

List of cart items

Quantity update and item removal

Cart summary (Subtotal, Shipping, Total)

Checkout button

**CheckoutPage**

Facilitates the final purchase process with a form for user details and payment information. Displays a summary of items and final costs.

**Features:**

User information form (Name, Email, Phone, Address)

Cart summary (Subtotal, Shipping, Discount, Tax, Total)

Final checkout button

**HomePage**

The landing page of the app, which may feature a carousel of promotions or popular items and a navigation bar to access other sections of the app.

**Features:**

Carousel slider with promotional images

Bottom navigation bar

State Management

The app uses **Provider** for state management:

**CartModel:** Manages cart items and quantities.

**ProductModel:** Represents product details and reviews.

**Navigation**

Curved Navigation Bar

The CurvedNavigationBar package is used for the bottom navigation bar to switch between different sections of the app.

**UI Design**

**Responsive Design**

Utilizes MediaQuery and LayoutBuilder to adjust layouts and font sizes based on screen size.

**Animations**

Basic animations and transitions are applied for a smooth user experience. For advanced animations, use AnimatedList, PageRouteBuilder, and custom animated widgets.

**Packages Integration**

URL Launcher

For opening external URLs

**Glassmorphism**

Apply glassmorphism effects to widgets

**Carousel Slider**

For creating carousels with images

**Usage**

**Clone the Repository:** Clone the repository to your local machine.

**Install Dependencies:** Run flutter pub get to install the necessary packages.

**Run the App:** Use flutter run to start the app on an emulator or device.

**Contributing**

**Fork the Repository:** Create your own fork of the repository.

**Create a Branch:** Create a new branch for your changes.

**Make Changes:** Implement your changes or new features.

**Submit a Pull Request:** Open a pull request with a description of your changes.
