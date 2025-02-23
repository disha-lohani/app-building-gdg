import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IIT-Mandi Marketplace',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

// Splash Screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 93, 172, 232), const Color.fromARGB(255, 186, 216, 236)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ), 
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('IIT-Mandi Marketplace', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen())),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    ),);
  }
}

// Login Screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Username')),
            TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen())),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// Signup Screen
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      backgroundColor: Colors.pink[400] ,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(decoration: InputDecoration(labelText: 'Username')),
            TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            TextField(decoration: InputDecoration(labelText: 'Contact Number')),
            TextField(decoration: InputDecoration(labelText: 'Address')),
            TextField(decoration: InputDecoration(labelText: 'Verification Code')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen())),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

// Main Screen with Bottom Navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    MarketplaceScreen(),
    AddItemScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Item'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Marketplace Screen
class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IIT Marketplace')),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(labelText: 'Search here')),
          Expanded(
            child: ListView(
              children: [
                ListTile(title: Text('Electronics')),
                ListTile(title: Text('Furniture')),
                ListTile(title: Text('Books')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: '),
            Text('Role: '),
            Text('Email ID: '),
            Text('Seller ID: '),
          ],
        ),
      ),
    );
  }
}

// Add Item Screen
class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Item')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Category')),
            TextField(decoration: InputDecoration(labelText: 'Name of Item')),
            TextField(decoration: InputDecoration(labelText: 'Description')),
            TextField(decoration: InputDecoration(labelText: 'Image URL')),
            TextField(decoration: InputDecoration(labelText: 'Price')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}