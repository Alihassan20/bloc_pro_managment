import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/character.dart';
import '../../data/repo/character_repo.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());
  // static CharacterCubit of(context) => CharacterCubit.of(context);

  List<Character> character = [];

  List<Character> getAllCharacters() {
    CharactersRepository().getAllCharacters().then((character) {
      emit(CharactersLoaded(character));
      this.character = character;
    });
    return character;

  }
}
