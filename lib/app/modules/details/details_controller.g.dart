// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$isRecomendationsExpandedAtom =
      Atom(name: '_DetailsControllerBase.isRecomendationsExpanded');

  @override
  bool get isRecomendationsExpanded {
    _$isRecomendationsExpandedAtom.reportRead();
    return super.isRecomendationsExpanded;
  }

  @override
  set isRecomendationsExpanded(bool value) {
    _$isRecomendationsExpandedAtom
        .reportWrite(value, super.isRecomendationsExpanded, () {
      super.isRecomendationsExpanded = value;
    });
  }

  final _$isInfoExpandedAtom =
      Atom(name: '_DetailsControllerBase.isInfoExpanded');

  @override
  bool get isInfoExpanded {
    _$isInfoExpandedAtom.reportRead();
    return super.isInfoExpanded;
  }

  @override
  set isInfoExpanded(bool value) {
    _$isInfoExpandedAtom.reportWrite(value, super.isInfoExpanded, () {
      super.isInfoExpanded = value;
    });
  }

  final _$isScreenshotsExpandedAtom =
      Atom(name: '_DetailsControllerBase.isScreenshotsExpanded');

  @override
  bool get isScreenshotsExpanded {
    _$isScreenshotsExpandedAtom.reportRead();
    return super.isScreenshotsExpanded;
  }

  @override
  set isScreenshotsExpanded(bool value) {
    _$isScreenshotsExpandedAtom.reportWrite(value, super.isScreenshotsExpanded,
        () {
      super.isScreenshotsExpanded = value;
    });
  }

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

  final _$gamesFromTheSameCompanyAtom =
      Atom(name: '_DetailsControllerBase.gamesFromTheSameCompany');

  @override
  ObservableList<Game> get gamesFromTheSameCompany {
    _$gamesFromTheSameCompanyAtom.reportRead();
    return super.gamesFromTheSameCompany;
  }

  @override
  set gamesFromTheSameCompany(ObservableList<Game> value) {
    _$gamesFromTheSameCompanyAtom
        .reportWrite(value, super.gamesFromTheSameCompany, () {
      super.gamesFromTheSameCompany = value;
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

  final _$_DetailsControllerBaseActionController =
      ActionController(name: '_DetailsControllerBase');

  @override
  void onTapRecomendationsPanel() {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.onTapRecomendationsPanel');
    try {
      return super.onTapRecomendationsPanel();
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapScreenshotsPanel() {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.onTapScreenshotsPanel');
    try {
      return super.onTapScreenshotsPanel();
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapDetailsPanel() {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.onTapDetailsPanel');
    try {
      return super.onTapDetailsPanel();
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRecomendationsExpanded: ${isRecomendationsExpanded},
isInfoExpanded: ${isInfoExpanded},
isScreenshotsExpanded: ${isScreenshotsExpanded},
isSummaryExpanded: ${isSummaryExpanded},
gamesFromTheSameCompany: ${gamesFromTheSameCompany},
similarGames: ${similarGames},
gameInfo: ${gameInfo}
    ''';
  }
}
