import 'package:bloc_pro_managment/data/model/character.dart';

import '../web_servers/dio_helper.dart';

class CharactersRepository {


  Future<List<Character>> getAllCharacters()async{
    final character = await DioHelper().getAllCharacters();
    return character.map((e) => Character.fromJson(e)).toList();
  }
}
