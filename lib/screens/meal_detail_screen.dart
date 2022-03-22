import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  //const MealDetailScreen({ Key? key }) : super(key: key);

  static const routeName = "/meal-detail";

  //building the container for Ingredients/steps etc
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      //adding a marging btw the picture and the text
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  //building the listview child
  //I need to add a mediaQuery instead to adjust the height from module responsive and adaptive apps

  Widget buildContainer(Widget child) {
    return Container(
      //we are adding the decoration for a user to identify that there is a listview
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      //margin inside the container holding the ingredients
      margin: EdgeInsets.all(10),
      //padding for the ingredients inside the container
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      //we are expecting the child to be a type widget
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    //we are maping the selected dummy data to the selectedMeal
    final selectedMeal = DUMMY_MEALS.firstWhere(
      ((meal) => meal.id == mealId),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //we are displaying the url picture
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            //we need to display the ingredients label
            buildSectionTitle(context, "Ingrediants"),
            //we need to add a list with the various steps of the recipe

            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    //we are adding padding inside the ingredients also
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            //we need to display the ingredients label
            buildSectionTitle(context, "Steps"),
            //we need to add another buldContainer to hold the steps
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(
                            selectedMeal.steps[index],
                          ),
                        ),
                        //we add a devider btw the steps
                        Divider(),
                      ],
                    )),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
