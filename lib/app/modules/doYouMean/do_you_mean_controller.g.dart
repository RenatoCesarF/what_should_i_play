// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'do_you_mean_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoYouMeanController on _DoYouMeanControllerBase, Store {
  final _$searchBarControllerAtom =
      Atom(name: '_DoYouMeanControllerBase.searchBarController');

  @override
  TextEditingController get searchBarController {
    _$searchBarControllerAtom.reportRead();
    return super.searchBarController;
  }

  @override
  set searchBarController(TextEditingController value) {
    _$searchBarControllerAtom.reportWrite(value, super.searchBarController, () {
      super.searchBarController = value;
    });
  }

  final _$gamesAtom = Atom(name: '_DoYouMeanControllerBase.games');

  @override
  ObservableList<Game> get games {
    _$gamesAtom.reportRead();
    return super.games;
  }

  @override
  set games(ObservableList<Game> value) {
    _$gamesAtom.reportWrite(value, super.games, () {
      super.games = value;
    });
  }

  final _$isSearchingAtom = Atom(name: '_DoYouMeanControllerBase.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$findGamesAsyncAction =
      AsyncAction('_DoYouMeanControllerBase.findGames');

  @override
  Future<void> findGames(String gameName) {
    return _$findGamesAsyncAction.run(() => super.findGames(gameName));
  }

  final _$openGameAsyncAction =
      AsyncAction('_DoYouMeanControllerBase.openGame');

  @override
  Future<void> openGame(Game game) {
    return _$openGameAsyncAction.run(() => super.openGame(game));
  }

  @override
  String toString() {
    return '''
searchBarController: ${searchBarController},
games: ${games},
isSearching: ${isSearching}
    ''';
  }
}
