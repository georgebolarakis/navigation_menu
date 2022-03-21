//it will output a single category item in our grid of categories
import 'package:flutter/material.dart';

import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  //const CategoryItem({Key? key}) : super(key: key);

  final String id;
  final String title;
  final Color color;

  CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  //we use this method to move between screens
  // void selectCategory(BuildContext ctx) {
  //   //the navigator needs to be connected to context that has information about the widget tree
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(builder: (_) {
  //       return CategoryMealsScreen(id, title);
  //     },),
  //   );
  // }

  void selectCategory(BuildContext ctx) {
    //the navigator needs to be connected to context that has information about the widget tree
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      "id": id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    //to make the container selectable we wrap it in a gestureRecognizer widget or an IkWell
    //that fires up a wripple effect
    return InkWell(
      //we don't add the method with the parenthesis since we don't want it to run when the code is
      //parsed but when the user selects it
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            //we need to control the direction
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          //to set up round corners
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
