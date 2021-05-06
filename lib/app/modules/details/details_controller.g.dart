// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$isSummaryExpandedAtom =
      Atom(name: '_DetailsControllerBase.isSummaryExpanded');

  @override
  bool get isSummaryExpanded {
    _$isSummaryExpandedAtom.reportRead();
    return super.isSummaryExpanded;
  }

  @override
  set isSummaryExpanded(bool value) {
    _$isSummaryExpandedAtom.reportWrite(value, super.isSummaryExpanded, () {
      super.isSummaryExpanded = value;
    });
  }

  final _$gamesFromTheSameDevelopersAtom =
      Atom(name: '_DetailsControllerBase.gamesFromTheSameDevelopers');

  @override
  ObservableList<Game> get gamesFromTheSameDevelopers {
    _$gamesFromTheSameDevelopersAtom.reportRead();
    return super.gamesFromTheSameDevelopers;
  }

  @override
  set gamesFromTheSameDevelopers(ObservableList<Game> value) {
    _$gamesFromTheSameDevelopersAtom
        .reportWrite(value, super.gamesFromTheSameDevelopers, () {
      super.gamesFromTheSameDevelopers = value;
    });
  }

  final _$similarGamesAtom = Atom(name: '_DetailsControllerBase.similarGames');

  @override
  ObservableList<Game> get similarGames {
    _$similarGamesAtom.reportRead();
    return super.similarGames;
  }

  @override
  set similarGames(ObservableList<Game> value) {
    _$similarGamesAtom.reportWrite(value, super.similarGames, () {
      super.similarGames = value;
    });
  }

  final _$gameInfoAtom = Atom(name: '_DetailsControllerBase.gameInfo');

  @override
  Game get gameInfo {
    _$gameInfoAtom.reportRead();
    return super.gameInfo;
  }

  @override
  set gameInfo(Game value) {
    _$gameInfoAtom.reportWrite(value, super.gameInfo, () {
      super.gameInfo = value;
    });
  }

  final _$getgameInfoAsyncAction =
      AsyncAction('_DetailsControllerBase.getgameInfo');

  @override
  Future<void> getgameInfo(int gameId) {
    return _$getgameInfoAsyncAction.run(() => super.getgameInfo(gameId));
  }

  @override
  String toString() {
    return '''
isSummaryExpanded: ${isSummaryExpanded},
gamesFromTheSameDevelopers: ${gamesFromTheSameDevelopers},
similarGames: ${similarGames},
gameInfo: ${gameInfo}
    ''';
  }
}
