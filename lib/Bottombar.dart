import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ShortsPage(),
    AddPage(),
    SubscriptionsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == 3;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Shorts",
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            Icon(CupertinoIcons.search, color: Colors.white),
            SizedBox(width: 10),
            Icon(Icons.more_vert, color: Colors.white),
          ],
          automaticallyImplyLeading: false,
        ),
        body: _pages[selectedIndex],
        bottomNavigationBar: Container(
          height: 65, // Increased height for better visibility
          decoration: BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _buildNavItem(Icons.home_outlined, "Home", 0)),
              Expanded(child: _buildNavItem(Icons.play_circle_fill, "Shorts", 1)),
              Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(2),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade800, // Custom color
                    ),
                    child: Icon(Icons.add, size: isSelected ? 30 : 25, color: Colors.white),
                  ),
                ),
              ),
              Expanded(child: _buildNavItem(Icons.subscriptions_outlined, "Subscription", 3)),
              Expanded(child: _buildNavItem(Icons.person_sharp, "Profile", 4)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: isSelected ? 25 :20, color: Colors.white),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: isSelected ? 12 : 10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://tse3.mm.bing.net/th?id=OIP.Hwg82k_7EosONC8kU1BLZQHaHa&pid=Api&P=0&h=180"),
            fit: BoxFit.cover)
          ),
        ),

    );
  }
}

class ShortsPage extends StatelessWidget {
  const ShortsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:InteractionPanel(
        imageUrl: "https://tse3.mm.bing.net/th?id=OIP.Hwg82k_7EosONC8kU1BLZQHaHa&pid=Api&P=0&h=180",
        profileImageUrl: "https://tse3.mm.bing.net/th?id=OIP.Hwg82k_7EosONC8kU1BLZQHaHa&pid=Api&P=0&h=180",
      ),
    );
  }
}

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://tse3.mm.bing.net/th?id=OIP.Hwg82k_7EosONC8kU1BLZQHaHa&pid=Api&P=0&h=180"),
                fit: BoxFit.cover)
        ),
      ),
    );
  }
}
class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://tse3.mm.bing.net/th?id=OIP.Hwg82k_7EosONC8kU1BLZQHaHa&pid=Api&P=0&h=180"),
                fit: BoxFit.cover)
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://tse3.mm.bing.net/th?id=OIP.Hwg82k_7EosONC8kU1BLZQHaHa&pid=Api&P=0&h=180"),
                fit: BoxFit.cover)
        ),
      ),
    );
  }
}




class InteractionPanel extends StatelessWidget {
  final String imageUrl; // Custom background image URL
  final String profileImageUrl; // Custom profile image URL

  const InteractionPanel({
    Key? key,
    required this.imageUrl,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIconWithText(Icons.thumb_up_alt_outlined, "1.4M"),
              _buildIconWithText(Icons.thumb_down_alt_outlined, "Dislike"),
              _buildIconWithText(Icons.message_outlined, "4,095"),
              _buildIconWithText(Icons.reply, "Share", rotate: true),
              _buildIconWithText(Icons.repeat_outlined, "19k"),
              SizedBox(height: 10),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(profileImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconWithText(IconData icon, String label, {bool rotate = false}) {
    return Column(
      children: [
        rotate
            ? Transform.rotate(
          angle: 3.14,
          child: Icon(icon, color: Colors.black, size: 30),
        )
            : Icon(icon, color: Colors.black, size: 30),
        Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}





