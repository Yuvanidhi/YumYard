import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YumYard',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
      routes: {
        '/home': (context) => MainPage(),
        '/cart': (context) => CartPage(),
        '/payment': (context) => PaymentScreen(),
        '/orders': (context) => OrdersScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/change-password': (context) => ChangePasswordScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Container(
          color: Colors.deepOrangeAccent, // Background color for the title area
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Optional padding
          child: Text(
            'YumYard',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            // Text color
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white), // Set icon color to white
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()), // Navigate to NotificationsPage
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white, // Background color of the circle
                    child: Icon(
                      Icons.person,
                      color: Colors.deepOrangeAccent, // Color of the icon
                      size: 50, // Size of the icon
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'YOU',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    '+91 98765 43210',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment'),
              onTap: () {
                Navigator.pushNamed(context, '/payment');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('My Orders'),
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                Navigator.pushNamed(context, '/favorites');
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                Navigator.pushNamed(context, '/change-password');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log In'),
              onTap: () async {
                // Add log out logic here
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.orange.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello YOU!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                ),
                Text(
                  'Find Your Meals',
                  style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.deepOrange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MealItem(
                          imageUrl: 'https://media.istockphoto.com/id/1206323282/photo/juicy-hamburger-on-white-background.jpg?s=612x612&w=0&k=20&c=K0DxyiChLwewXcCy8aLjjOqkc8QXPgQMAW-vwRCzqG4=',
                          name: 'Burger',
                          price: 149
                      ),
                      MealItem(
                          imageUrl: 'https://i.pinimg.com/736x/26/c6/4b/26c64bef44546cdc05bc2233168f32ac.jpg',
                          name: 'Pizza',
                          price: 259
                      ),
                      MealItem(
                          imageUrl: 'https://thumbs.dreamstime.com/b/penne-pasta-white-background-color-bowl-tomato-sauce-top-view-generative-ai-287023632.jpg',
                          name: 'Pasta',
                          price: 290
                      ),
                      MealItem(
                          imageUrl: 'https://img.freepik.com/premium-photo/slate-board-with-sushi-set-isolated-white-background_185193-75522.jpg',
                          name: 'Sushi',
                          price: 475
                      ),
                      MealItem(
                          imageUrl: 'https://img.freepik.com/premium-photo/salad-with-fresh-vegetables-white-background-wide-photo_752903-66.jpg',
                          name: 'Salad',
                          price: 120
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    FilterChip(label: Text('All'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                    FilterChip(label: Text('Soup'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                    FilterChip(label: Text('Biriyani'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                    FilterChip(label: Text('Dosa'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                    FilterChip(label: Text('Rolls'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                    FilterChip(label: Text('Noodles'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                    FilterChip(label: Text('Shawarma'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                    FilterChip(label: Text('Dosa'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                    FilterChip(label: Text('IceCream'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                    FilterChip(label: Text('Momos'), onSelected: (_) {}, backgroundColor: Colors.white, selectedColor: Colors.orange),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Popular',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDetailsPage()),
                    );
                  },
                  child: PopularItem(
                    imageUrl: 'https://www.shutterstock.com/image-photo/big-classic-beef-cheese-burger-600nw-2186648631.jpg',
                    name: 'Double Burger',
                    price: 249,
                  ),
                ),
                PopularItem(
                  imageUrl: 'https://img.freepik.com/premium-photo/chicken-biryani-plate-isolated-white-background-delicious-spicy-biryani-isolated_667286-5804.jpg',
                  name: 'Biriyani',
                  price: 210,
                ),
                PopularItem(
                  imageUrl: 'https://img.freepik.com/premium-photo/chicken-wings-white-plate-white-background_864588-11099.jpg',
                  name: 'Chicken Wings',
                  price: 375,
                ),
                PopularItem(
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ-3nwn7IuyHmjVaidIe3-Vej9_30IV8-TWw&s',
                  name: 'Cake',
                  price: 179,
                ),
                PopularItem(
                  imageUrl: 'https://img.freepik.com/premium-photo/glass-orange-juice-100-isolate-white-background_48237-606.jpg',
                  name: 'Juice',
                  price: 80,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.white,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/cart');
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            OrderTile(
              title: 'Order #1: Chicken Gravy - ₹300',
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8rDd6czMJlCQy_Hus1ivyzsAVb1362PKuPA&s',
            ),
            SizedBox(height: 16), // Adds space between items
            OrderTile(
              title: 'Order #2: Kadai Paneer - ₹220',
              imageUrl: 'https://img.freepik.com/premium-photo/kadai-paneer-white-plate-white-background_864588-11224.jpg',
            ),
            SizedBox(height: 16), // Adds space between items
            OrderTile(
              title: 'Order #3: Fruit Salad - ₹150',
              imageUrl: 'https://media.istockphoto.com/id/1338770444/photo/fruit-salad-with-banana-strawberry-orange-and-kiwi-isolated-on-white-background-top-view.jpg?s=612x612&w=0&k=20&c=oWg_kMrYC9W2KIrlp2H-MqcgBhq954LK9uw2bkncPuQ=',
            ),
          ],
        ),
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  OrderTile({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      leading: Container(
        width: 100, // Container width
        height: 100, // Container height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover, // Ensures the image covers the container
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      tileColor: Colors.orange.shade50, // Light background color for each tile
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          'Tap to view details',
          style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 14),
        ),
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Favorite Item 1: Tandoori Chicken'),
                leading: Icon(Icons.favorite, color: Colors.deepOrangeAccent),
              ),
              ListTile(
                title: Text('Favorite Item 2: Rumali Roti'),
                leading: Icon(Icons.favorite, color: Colors.deepOrangeAccent),
              ),
              ListTile(
                title: Text('Favorite Item 3: Blackcurrant IceCream'),
                leading: Icon(Icons.favorite, color: Colors.deepOrangeAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _oldPasswordController,
              decoration: InputDecoration(
                labelText: 'Old Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle password change logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Password changed successfully!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent, // Background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Padding
                textStyle: TextStyle(
                  fontSize: 16, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                ),
              ),
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Padding
                  textStyle: TextStyle(
                    fontSize: 16, // Font size
                    fontWeight: FontWeight.bold, // Font weight
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                child: Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Card Details:',
                style: TextStyle(
                  fontSize: 24,                // Sets the font size
                  fontWeight: FontWeight.bold, // Makes the text bold
                  color: Colors.deepOrangeAccent, // Uses the deepOrangeAccent color
                ),
              ),
              SizedBox(height: 20),
              Text('Card Number: 1234 5678 9012 3456'),
              Text('Expiry Date: 12/25'),
              Text('CVV: 123'),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.deepOrange, // Matching the AppBar color
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          NotificationTile(title: 'Offer Zone', message: 'You have a offer upto 50%.ORDER NOW'),
          NotificationTile(title: 'Update Available', message: 'A new update is available for the app.'),
          NotificationTile(title: 'Message Received', message: 'You have received a new message from YumYard.'),
          // Add more dummy notifications as needed
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;

  NotificationTile({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        leading: Icon(Icons.notification_important, color: Colors.deepOrange),
      ),
    );
  }
}

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;

  const MealItem({
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, width: 150, height: 150, fit: BoxFit.cover),
            ),
            SizedBox(height: 8),
            Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
            Text('₹${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 14, color: Colors.orange))

          ],
        ),
      ),
    );
  }
}

class PopularItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int price;

  PopularItem({required this.imageUrl, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Increased the height of the image from 150 to 180
            Image.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('₹$price', style: TextStyle(color: Colors.deepOrange)),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _quantity = 1; // Initial quantity

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  void _addToCart() {
    // Show toast message
    Fluttertoast.showToast(
      msg: "Item added to cart",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600]!.withOpacity(0.8),
      textColor: Colors.white.withOpacity(0.9),
      fontSize: 14.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.deepOrangeAccent, // Deep orange accent theme
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://www.shutterstock.com/image-photo/big-classic-beef-cheese-burger-600nw-2186648631.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Double Burger',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.deepOrangeAccent),
                  Icon(Icons.star, color: Colors.deepOrangeAccent),
                  Icon(Icons.star, color: Colors.deepOrangeAccent),
                  Icon(Icons.star, color: Colors.deepOrangeAccent),
                  Icon(Icons.star_half, color: Colors.deepOrangeAccent),
                  SizedBox(width: 8),
                  Text('4.3 (273 reviews)', style: TextStyle(color: Colors.black54)),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
              ),
              SizedBox(height: 8),
              Text(
                "Juicy double beef patties topped with crisp lettuce, fresh tomatoes, and melted cheese, all nestled in a toasted bun. Satisfy your hunger with this delicious, mouthwatering classic burger that's a fan favorite!",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Text(
                'Customize your order',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(child: Text('Small'), value: 'Small'),
                  DropdownMenuItem(child: Text('Medium'), value: 'Medium'),
                  DropdownMenuItem(child: Text('Large'), value: 'Large'),
                ],
                onChanged: (value) {},
                hint: Text('Select size'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(child: Text('Lettuce'), value: 'Lettuce'),
                  DropdownMenuItem(child: Text('Tomato'), value: 'Tomato'),
                  DropdownMenuItem(child: Text('Onion'), value: 'Onion'),
                ],
                onChanged: (value) {},
                hint: Text('Select ingredients'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Number of Portions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                        onPressed: _decrementQuantity,
                      ),
                      Text('$_quantity', style: TextStyle(fontSize: 20, color: Colors.black87)),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline, color: Colors.green),
                        onPressed: _incrementQuantity,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _addToCart,
                  child: Text('Add To Cart'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.deepOrangeAccent, // Deep orange accent theme
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CartItem(
                    imageUrl: 'https://www.shutterstock.com/image-photo/big-classic-beef-cheese-burger-600nw-2186648631.jpg',
                    name: 'Double Burger',
                    quantity: 2,
                    price: 249,
                  ),
                  CartItem(
                    imageUrl: 'https://i.pinimg.com/736x/26/c6/4b/26c64bef44546cdc05bc2233168f32ac.jpg',
                    name: 'Pizza',
                    quantity: 1,
                    price: 259,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                Text(
                  '- ₹150',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                Text(
                  'Free',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                Text(
                  '₹607',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderConfirmationPage(),
                    ),
                  );
                },
                child: Text('Checkout'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Your order has been placed successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int quantity;
  final double price;

  const CartItem({
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Constrain the image size
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            // Flexible text container
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Quantity: $quantity',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total: ₹${(price * quantity).toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepOrangeAccent,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'YOU',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.history, color: Colors.deepOrangeAccent),
              title: Text('My Orders', style: TextStyle(fontSize: 16, color: Colors.black87)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrdersPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.deepOrangeAccent),
              title: Text('Change Address', style: TextStyle(fontSize: 16, color: Colors.black87)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangeAddressPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.deepOrangeAccent),
              title: Text('Log Out', style: TextStyle(fontSize: 16, color: Colors.black87)),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoggedOutPage()),
                      (Route<dynamic> route) => false, // Remove all previous routes
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          OrderTiles(orderId: '1234', orderDate: '2024-08-01', amount: '₹500'),
          OrderTiles(orderId: '5678', orderDate: '2024-08-03', amount: '₹370'),
          OrderTiles(orderId: '9101', orderDate: '2024-08-05', amount: '₹620'),
        ],
      ),
    );
  }
}

class OrderTiles extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final String amount;

  OrderTiles({required this.orderId, required this.orderDate, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          'Order ID: $orderId',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
          ),
        ),
        subtitle: Text('Date: $orderDate'),
        trailing: Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}

class ChangeAddressPage extends StatefulWidget {
  @override
  _ChangeAddressPageState createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
  final TextEditingController _newAddressController = TextEditingController();
  String _currentAddress = '1234 Sea View Road, Coastal Apartment 5B,\nKochi, Kerala 682001';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Address'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
            ),
            SizedBox(height: 8),
            Text(
              _currentAddress,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 16),
            Text(
              'New Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _newAddressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your new address',
                contentPadding: EdgeInsets.all(16.0),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final newAddress = _newAddressController.text;
                if (newAddress.isNotEmpty) {
                  setState(() {
                    _currentAddress = newAddress;
                  });
                  Fluttertoast.showToast(
                    msg: "Address updated successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  _newAddressController.clear();
                } else {
                  Fluttertoast.showToast(
                    msg: "Please enter a new address",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('Save Address'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoggedOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged Out'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Text(
          'You have been logged out.',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}



