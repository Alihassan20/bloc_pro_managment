import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/character.dart';
import '../../data/repo/character_repo.dart';
import 'character_cubit.dart';

class CharacterScreenView extends StatefulWidget {
  const CharacterScreenView({Key? key}) : super(key: key);

  @override
  _CharacterScreenViewState createState() => _CharacterScreenViewState();
}

class _CharacterScreenViewState extends State<CharacterScreenView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => CharacterCubit(),
        child: BlocBuilder<CharacterCubit, CharacterState>(
            builder: (context, state) {
              List<Character> allCharacters = BlocProvider.of<CharacterCubit>(context).getAllCharacters();
              print(allCharacters);
          return allCharacters==null||allCharacters.isEmpty?const Center(child: CircularProgressIndicator()):SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: allCharacters.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {},
                        child: GridTile(
                          footer: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            color: Colors.black54,
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              '${allCharacters[index].name}',
                              style: const TextStyle(
                                height: 1.3,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          child: Hero(
                            tag: allCharacters[index].charId,
                            child: Container(
                              child: allCharacters[index].image.isNotEmpty
                                  ? FadeInImage.assetNetwork(
                                      width: double.infinity,
                                      height: double.infinity,
                                      placeholder: 'assets/images/loading.gif',
                                      image: allCharacters[index].image,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/images/placeholder.jpg'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
