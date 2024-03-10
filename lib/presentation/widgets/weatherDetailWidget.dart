import 'package:flutter/material.dart';

class WeatherDetailWidget extends StatelessWidget {
  const WeatherDetailWidget({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}