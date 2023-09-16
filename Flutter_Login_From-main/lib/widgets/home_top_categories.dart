import 'package:amazon_clone/utils/global_variables.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  TopCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: GlobalVariables.categoryImages.length,
        scrollDirection: Axis.horizontal,
       itemExtent: 100,
        itemBuilder: (context, index) {
          // Get the image path and title for the current index from GlobalVariables.categoryImages
          String imagePath = GlobalVariables.categoryImages[index]['image']!;
          String title = GlobalVariables.categoryImages[index]['title']!;

          return GestureDetector(
            onTap: () {
              // Handle the click action for the category at the given index
              // You can navigate to a new screen, open a dialog, or perform any other action here
              // For example, you can display a message when a category is clicked:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Category "$title" clicked!'),
                ),
              );
            },
            child: Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      imagePath, // Provide the image path
                      width: 40, // Adjust the width as needed
                      height: 40, // Adjust the height as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    title, // Display the category title
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
