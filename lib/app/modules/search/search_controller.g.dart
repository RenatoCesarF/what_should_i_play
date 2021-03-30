// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchControllerBase, Store {
  final _$searchBarControllerAtom =
      Atom(name: '_SearchControllerBase.searchBarController');

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

  final _$animControllerAtom =
      Atom(name: '_SearchControllerBase.animController');

  @override
  AnimationController get animController {
    _$animControllerAtom.reportRead();
    return super.animController;
  }

  @override
  set animController(AnimationController value) {
    _$animControllerAtom.reportWrite(value, super.animController, () {
      super.animController = value;
    });
  }

  final _$animationAtom = Atom(name: '_SearchControllerBase.animation');

  @override
  Animation<num> get animation {
    _$animationAtom.reportRead();
    return super.animation;
  }

  @override
  set animation(Animation<num> value) {
    _$animationAtom.reportWrite(value, super.animation, () {
      super.animation = value;
    });
  }

  @override
  String toString() {
    return '''
searchBarController: ${searchBarController},
animController: ${animController},
animation: ${animation}
    ''';
  }
}
