import 'dart:math';

import 'package:alfred_test/config/my_colors.dart';
import 'package:alfred_test/models/character.dart';
import 'package:flutter/material.dart';

import '../pages/character_detail_page.dart';

Widget cardCharacter(Results characterModel, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
    child: Row(
      children: [
        SizedBox(
          width: 130,
          child: Hero(
            tag: characterModel.id.toString(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage(
                placeholder: AssetImage(
                  'assets/img/loading.gif',
                ),
                image: NetworkImage(characterModel.image.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Card(
            elevation: 0,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(characterModel.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      children: [
                        Icon(Icons.circle,
                            size: 15,
                            color: characterModel.status.toString() == 'Alive'
                                ? Colors.green
                                : Colors.red),
                        const Text('  Status',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text(characterModel.species.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharacterDetails(
                                        characterData: characterModel,
                                      )));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: MyColor.myGreen,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, top: 4, bottom: 4),
                              child: Text(
                                'Detalle',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: MyColor.myBlue),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
