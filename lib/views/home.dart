import 'package:flutter/material.dart';
import 'package:food_recipe/models/recipe.api.dart';
import 'package:food_recipe/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  // ignore: unused_field
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    debugPrint(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_literals_to_create_immutables
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 10,
              ),
              // ignore: prefer_const_constructors
              Text('Food Recipe')
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}

class Recipe {
  get totalTime => null;

  get name => null;

  get rating => null;

  get images => null;
}
