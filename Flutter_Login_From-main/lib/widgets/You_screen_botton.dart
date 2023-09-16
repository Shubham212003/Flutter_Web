import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HomeButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _HomeButtonState createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
    width: 15,
    height: 50,
        margin: const EdgeInsets.all(20), // Adjust the margin to increase size
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(50),
          
          color: Colors.white,
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: widget.onTap, // Use the onTap callback from the widget
          child: Text(
            widget.text, // Access the text from the widget
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
