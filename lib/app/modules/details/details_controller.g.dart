// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$finishLoadAtom = Atom(name: '_DetailsControllerBase.finishLoad');

  @override
  bool get finishLoad {
    _$finishLoadAtom.reportRead();
    return super.finishLoad;
  }

  @override
  set finishLoad(bool value) {
    _$finishLoadAtom.reportWrite(value, super.finishLoad, () {
      super.finishLoad = value;
    });
  }

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

  final _$sameCompanyAtom = Atom(name: '_DetailsControllerBase.sameCompany');

  @override
  ObservableList<Game> get sameCompany {
    _$sameCompanyAtom.reportRead();
    return super.sameCompany;
  }

  @override
  set sameCompany(ObservableList<Game> value) {
    _$sameCompanyAtom.reportWrite(value, super.sameCompany, () {
      super.sameCompany = value;
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

  final _$recomendedGamesAtom =
      Atom(name: '_DetailsControllerBase.recomendedGames');

  @override
  GamePage get recomendedGames {
    _$recomendedGamesAtom.reportRead();
    return super.recomendedGames;
  }

  @override
  set recomendedGames(GamePage value) {
    _$recomendedGamesAtom.reportWrite(value, super.recomendedGames, () {
      super.recomendedGames = value;
    });
  }

  final _$getRecomendedGamesAsyncAction =
      AsyncAction('_DetailsControllerBase.getRecomendedGames');

  @override
  Future<void> getRecomendedGames(int gameId) {
    return _$getRecomendedGamesAsyncAction
        .run(() => super.getRecomendedGames(gameId));
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
  void onTapInfoPanel() {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.onTapInfoPanel');
    try {
      return super.onTapInfoPanel();
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
finishLoad: ${finishLoad},
isRecomendationsExpanded: ${isRecomendationsExpanded},
isInfoExpanded: ${isInfoExpanded},
sameCompany: ${sameCompany},
similarGames: ${similarGames},
recomendedGames: ${recomendedGames}
    ''';
  }
}
