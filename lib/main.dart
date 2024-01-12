// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/signup/owner': (context) => OwnerSignUpPage(),
        '/signup/customer': (context) => CustomerSignUpPage(),
        '/admin': (context) => AdminPanel(),
        '/owner': (context) => DairyOwnerPanel(),
        '/shopping': (context) => ShoppingPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            Text(
              'Dailys Dairy',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() {
    if (phoneNumberController.text == "111" &&
        passwordController.text == "111") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DiaryApp()),
      );
    } else if (phoneNumberController.text == "222" &&
        passwordController.text == "222") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DairyOwnerPanel()),
      );
    } else if (phoneNumberController.text == "333" &&
        passwordController.text == "333") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminPanel()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Login Failed"),
            content: Text("Invalid Email or password."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily's Dairy"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: "Email"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(child: Text('Sign Up As:')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup/owner');
                  },
                  child: Text('Dairy Owner'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup/customer');
                  },
                  child: Text(
                    'Customer',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}

class OwnerSignUpPage extends StatelessWidget {
  final TextEditingController ownerPasswordController = TextEditingController();
  final TextEditingController ownernameController = TextEditingController();
  final TextEditingController ownerAddressController = TextEditingController();
  final TextEditingController ownerShopAddressController =
      TextEditingController();
  final TextEditingController ownerDeliveryNumberController =
      TextEditingController();
  final TextEditingController ownerphoneNumberController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dairy Owner Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dairy Owner Sign-Up Form'),
              TextField(
                controller: ownernameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 1),
              TextField(
                controller: ownerShopAddressController,
                decoration: InputDecoration(labelText: 'Address of Shop'),
              ),
              TextField(
                controller: ownerAddressController,
                decoration: InputDecoration(
                  labelText: 'Range of Delivery Area',
                ),
              ),
              SizedBox(height: 1),
              TextField(
                controller: ownerphoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Contact Number of Owner',
                ),
              ),
              SizedBox(height: 1),
              TextField(
                controller: ownerDeliveryNumberController,
                decoration: InputDecoration(
                  labelText: 'Contact Number of Delivery Person',
                ),
              ),
              SizedBox(height: 1),
              TextField(
                controller: ownerPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 1),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerSignUpPage extends StatelessWidget {
  final TextEditingController customerEmailController = TextEditingController();
  final TextEditingController customerPasswordController =
      TextEditingController();
  final TextEditingController customernameController = TextEditingController();
  final TextEditingController customerAddressController =
      TextEditingController();
  final TextEditingController customerphoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Customer Sign-Up Form'),
              TextField(
                controller: customernameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: customerAddressController,
                decoration: InputDecoration(
                  labelText: 'Residency Address',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: customerphoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: customerPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily's Dairy"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/amul.png',
              width: 200,
              height: 200,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shopping');
              },
              child: Text("Amul Dairy : Rajkot"),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingPage extends StatelessWidget {
  final List<Product> dairyProducts = [
    Product('Milk', 'Fresh milk from the farm', 2.99, 'assets/images/milk.png'),
    Product('Cheese', 'Delicious cheese', 4.99, 'assets/images/cheese.png'),
    Product('Yogurt', 'Creamy yogurt', 1.99, 'assets/images/yogurt.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amul Dairy'),
      ),
      body: ListView.builder(
        itemCount: dairyProducts.length,
        itemBuilder: (context, index) {
          return ProductItem(product: dairyProducts[index]);
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageAsset;

  Product(this.name, this.description, this.price, this.imageAsset);
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.asset(
            product.imageAsset,
            height: 200.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dash Board'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('#');
              },
              child: Text(
                'Customer Details',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('#');
              },
              child: Text(
                'Dairy Details',
                style: TextStyle(fontSize: 23),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('#');
              },
              child: Text(
                'Current Orders',
                style: TextStyle(fontSize: 21),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DairyOwnerPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dairy Owner Dash Board'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('#');
              },
              child: Text(
                'Customer Details',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('#');
              },
              child: Text(
                'Current Orders',
                style: TextStyle(fontSize: 21),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
