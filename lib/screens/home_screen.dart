import 'package:chess_game/screens/game_screen.dart';
import 'package:chess_game/widgets/c_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isLarge = (constraints.maxWidth > 600);
          return responsiveScreen(isLarge);
        },
      ),
    );
  }

  Widget responsiveScreen(bool isLarge) {
    String bgImg = isLarge
        ? "lib/assets/images/home/home_desktop.png"
        : "lib/assets/images/home/home_mobile.png";
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImg), fit: BoxFit.fill),
      ),
      child: Center(
        child: Container(
          // color: Colors.red,
          constraints: BoxConstraints(maxWidth: 500, minWidth: 480),
          child: Home(),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CButton(
          text: "Start",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameScreen()),
            );
          },
        ),

        SizedBox(height: 90.0),
      ],
    );
  }
}
