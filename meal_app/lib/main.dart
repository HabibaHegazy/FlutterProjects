import 'package:flutter/material.dart';
import 'package:meal_app/screens/bottom_tabs.dart';
import 'package:meal_app/screens/filters.dart';
import '../screens/meal_detail.dart';
import '../screens/category_meals.dart';
import '../screens/categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: BottomTabsScreen(),
      // initialRoute: '/', // => if you want to change the initial route to other than '/'
      routes: {
        '/': (ctx) => BottomTabsScreen(), //TopTabsScreen(),
        CategoryMealsScreen.screenName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.screenName: (ctx) => MealDetailScreen(),
        FilterScreen.screenName: (ctx) => FilterScreen(),
      }, // routes table takes a map where yuor have string keys, and the value is the creation function of the screen
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => BottomTabsScreen());
      },
      onUnknownRoute: (settings) {
        //used when there is not routes and onGenerateRoute is not used
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
