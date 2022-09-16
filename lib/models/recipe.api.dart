// ignore: unused_import
// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:convert';
import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {


  // ignore: prefer_typing_uninitialized_variables
  static Future<List><Recipe>> getRecipe() async{

    var uri = Uri.http('yummly2.p.rapidapi.com', '/feed/list',
     { " limit": "18",
   "start": "0",
   "tag": "list.recipe.popular"});

   final response = await http.get(uri, headers: { 
     "x-rapidapi-key": "a5b803e08amsh3abe18ed5b25b2cp17090jsn8c5c85b5b088",
   "x-rapidapi-host": "yummly2.p.rapidapi.com",
   "useQueryString": "true"
   });

   Map data = jasonDecode(response.body);
   List _temp = [];

    for (var i in data['feed']){
      _temp.add(i['conntent']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);

  }
  
  Map jasonDecode(body) {}
}

