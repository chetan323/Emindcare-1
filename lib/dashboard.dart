import 'package:flutter/material.dart';
import 'package:emindcare/login_screen.dart';
import 'package:emindcare/chat_bot.dart'; // Import the chatbot screen

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the login screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        title: const Text('Dashboard'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade300, Colors.blue.shade500], // Gradient colors
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Clickable Card for View Graph with unique color and image beside text
                  _buildCard(
                    context,
                    title: 'View Graph',
                    color: Colors.green.shade400, // Green color for this card
                    icon: Icons.insert_chart, // Chart icon
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Graph View Coming Soon')),
                      );
                    },
                  ),
                  const SizedBox(height: 60),  // Space between cards

                  // Clickable Card for Data Generation with unique color and image beside text
                  _buildCard(
                    context,
                    title: 'Generate Data',
                    color: Colors.orange.shade400, // Orange color for this card
                    icon: Icons.data_usage, // Data icon
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Generated')),
                      );
                    },
                  ),
                  const SizedBox(height: 50),  // Space between cards

                  // Clickable Card for Chatbot with unique color and image beside text
                  _buildCard(
                    context,
                    title: 'Go to Chatbot',
                    color: Colors.pink.shade400, // Pink color for this card
                    icon: Icons.chat_bubble, // Chat icon
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChatBotScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, {
    required String title,
    required VoidCallback onTap,
    required Color color,  // Pass in the custom color for each card
    required IconData icon, // Pass in the icon for each card
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: 100,  // Reduced height for the card
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Adjusted padding for the reduced height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,  // Use the passed color
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon for the card
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(width: 20), // Space between icon and text
              // Text beside the icon
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,  // Adjusted font size for better proportion
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
