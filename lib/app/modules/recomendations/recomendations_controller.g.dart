// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recomendations_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecomendationsController on _RecomendationsControllerBase, Store {
  final _$finishLoadAtom =
      Atom(name: '_RecomendationsControllerBase.finishLoad');

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

  final _$sameCompanyAtom =
      Atom(name: '_RecomendationsControllerBase.sameCompany');

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

  final _$recomendedGamesAtom =
      Atom(name: '_RecomendationsControllerBase.recomendedGames');

  @override
  Recomendations get recomendedGames {
    _$recomendedGamesAtom.reportRead();
    return super.recomendedGames;
  }

  @override
  set recomendedGames(Recomendations value) {
    _$recomendedGamesAtom.reportWrite(value, super.recomendedGames, () {
      super.recomendedGames = value;
    });
  }

  final _$getRecomendedGamesAsyncAction =
      AsyncAction('_RecomendationsControllerBase.getRecomendedGames');

  @override
  Future<void> getRecomendedGames(int gameId) {
    return _$getRecomendedGamesAsyncAction
        .run(() => super.getRecomendedGames(gameId));
  }

  @override
  String toString() {
    return '''
finishLoad: ${finishLoad},
sameCompany: ${sameCompany},
recomendedGames: ${recomendedGames}
    ''';
  }
}
