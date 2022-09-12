import 'dart:convert';
import 'dart:developer';

import 'package:alfred_test/core/api.dart';
import 'package:alfred_test/widgets/card_character_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paging/paging.dart';

import '../models/character.dart';
import '../models/episodes.dart';
import '../models/locations.dart';
import '../widgets/custom_appbar_widget.dart';
import 'character_detail_page.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  static const _pageSize = 20;
  final apiRemote = ApiRemote();

  final PagingController<int, Results> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await apiRemote.getCharacters(pageKey);
      final isLastPage = newItems!.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        backActive: false,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'La serie en números',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: FutureBuilder(
                      builder:
                          (context, AsyncSnapshot<EpisodesModel> snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.info!.count.toString() +
                                ' episodios',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset('assets/img/loading.gif',
                                width: 40, height: 40),
                          );
                        }
                      },
                      future: apiRemote.getEpisodes(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: FutureBuilder(
                        builder: (context, AsyncSnapshot<ResultsL> snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                const Text(
                                  'Locación con mas personajes',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data!.name.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset('assets/img/loading.gif',
                                  width: 40, height: 40),
                            );
                          }
                        },
                        future: apiRemote.getLocationWithMaxResidents()),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PagedListView<int, Results>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Results>(
                  itemBuilder: (context, item, index) =>
                      cardCharacter(item, context)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
