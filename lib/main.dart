import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket Booking App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFf1f8ff), // Soft light blue
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Ticket Booking App',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF33b5e5), // Soft turquoise
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0097a7), // Deep teal
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> transportData = const [
    {
      'type': 'Kereta',
      'icon': Icons.train,
      'routes': ['Jakarta - Bandung', 'Bandung - Surabaya', 'Yogyakarta - Solo'],
    },
    {
      'type': 'Bus',
      'icon': Icons.directions_bus,
      'routes': ['Jakarta - Bogor', 'Bandung - Cirebon', 'Semarang - Yogyakarta'],
    },
    {
      'type': 'Pesawat',
      'icon': Icons.flight,
      'routes': ['Jakarta - Bali', 'Surabaya - Makassar', 'Medan - Jakarta'],
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      // Home page (Transport selection)
      Scaffold(
        appBar: AppBar(
          title: const Text('Ticket Booking'),
          centerTitle: true,
          backgroundColor: const Color(0xFF1e88e5), // Soft Blue
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: transportData.length,
          itemBuilder: (context, index) {
            final transport = transportData[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouteSelectionPage(
                      type: transport['type'],
                      icon: transport['icon'],
                      routes: transport['routes'],
                    ),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color(0xFF4caf50), // Vibrant green
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: Icon(
                      transport['icon'],
                      size: 40,
                      color: const Color(0xFF1b5e20), // Deep green
                    ),
                    title: Text(
                      transport['type'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2c6e32), // Deep green
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // Profile Page
      Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: const Color(0xFF455a64), // Steel blue-grey
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF455a64),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Username: User123',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              SizedBox(height: 10),
              Text(
                'Email: user123@example.com',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Booking App'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1e88e5),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: const Color(0xFFcfd8dc),
        selectedItemColor: const Color(0xFF0288d1), // Lighter blue
        unselectedItemColor: const Color(0xFF607d8b), // Grey
      ),
    );
  }
}

class RouteSelectionPage extends StatelessWidget {
  final String type;
  final IconData icon;
  final List<String> routes;

  const RouteSelectionPage({
    Key? key,
    required this.type,
    required this.icon,
    required this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Rute - $type'),
        backgroundColor: const Color(0xFF0288d1),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              leading: Icon(icon, size: 40, color: Colors.blueGrey[600]),
              title: Text(
                routes[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tiket untuk ${routes[index]} dipesan!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0288d1),
                ),
                child: const Text('Pesan'),
              ),
            ),
          );
        },
      ),
    );
  }
}
