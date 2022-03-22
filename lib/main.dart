import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.amber,
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromARGB(255, 20, 27, 27),
                ),
                subtitle1: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold,
                ),
              ),
          //canvasColor: Color.fromRGBO(229, 36, 36, 0),
          canvasColor: Color.fromARGB(255, 166, 221, 247)),

      //here we are pointing which widget is going to be our first screen in our application
      //home: MyHomePage()
      home: CategoriesScreen(),
      initialRoute: '/',
      //we can use the routes table instead of the home
      //a route is a screen
      routes: {
        //'/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DeliMeals'),
//       ),
//       body: Center(
//         child: Text('Navigation Time!'),
//       ),
//     );
//   }
// }
