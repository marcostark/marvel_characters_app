// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersList on CharacterBase, Store {
  final _$charactersAtom = Atom(name: 'CharacterBase.characters');

  @override
  Future<CharacterDataWrapper> get characters {
    _$charactersAtom.context.enforceReadPolicy(_$charactersAtom);
    _$charactersAtom.reportObserved();
    return super.characters;
  }

  @override
  set characters(Future<CharacterDataWrapper> value) {
    _$charactersAtom.context.conditionallyRunInAction(() {
      super.characters = value;
      _$charactersAtom.reportChanged();
    }, _$charactersAtom, name: '${_$charactersAtom.name}_set');
  }

  final _$charactersLimitAtom = Atom(name: 'CharacterBase.charactersLimit');

  final _$CharacterBaseActionController =
      ActionController(name: 'CharacterBase');

  @override
  dynamic fetchData() {
    final _$actionInfo = _$CharacterBaseActionController.startAction();
    try {
      return super.fetchData();
    } finally {
      _$CharacterBaseActionController.endAction(_$actionInfo);
    }
  }
}
