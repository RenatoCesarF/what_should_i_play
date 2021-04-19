// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'do_you_mean_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoYouMeanController on _DoYouMeanControllerBase, Store {
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

  final _$finishSearchAtom =
      Atom(name: '_DoYouMeanControllerBase.finishSearch');

  @override
  bool get finishSearch {
    _$finishSearchAtom.reportRead();
    return super.finishSearch;
  }

  @override
  set finishSearch(bool value) {
    _$finishSearchAtom.reportWrite(value, super.finishSearch, () {
      super.finishSearch = value;
    });
  }

  final _$findGamesAsyncAction =
      AsyncAction('_DoYouMeanControllerBase.findGames');

  @override
  Future<void> findGames(String gameName) {
    return _$findGamesAsyncAction.run(() => super.findGames(gameName));
  }

  @override
  String toString() {
    return '''
games: ${games},
finishSearch: ${finishSearch}
    ''';
  }
}
