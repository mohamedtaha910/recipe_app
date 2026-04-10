import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/cubits/fav_cubits/fav_states.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/services/favourites_services.dart';
// import 'package:hive/hive.dart';

class FavCubit extends Cubit<FavStates> {
  FavCubit() : super(FavInitial());

  late List<MealModel> favMeals = [];

  fetchAllFav() async {
    emit(FavLoading());
    favMeals = FavouritesServices().getAllFavourites();
    if (favMeals.isEmpty) {
      emit(FavNull(errMessage: 'No Favourites yet!'));
    } else {
      emit(FavSuccess(favMeals: favMeals));
    }
  }
}
