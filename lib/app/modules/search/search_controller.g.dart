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

  final _$pageFocusAtom = Atom(name: '_SearchControllerBase.pageFocus');

  @override
  FocusNode get pageFocus {
    _$pageFocusAtom.reportRead();
    return super.pageFocus;
  }

  @override
  set pageFocus(FocusNode value) {
    _$pageFocusAtom.reportWrite(value, super.pageFocus, () {
      super.pageFocus = value;
    });
  }

  @override
  String toString() {
    return '''
searchBarController: ${searchBarController},
pageFocus: ${pageFocus}
    ''';
  }
}
