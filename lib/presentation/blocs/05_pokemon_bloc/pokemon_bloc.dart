import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int id) _fetchPokemonName;
  PokemonBloc({required Future<String> Function(int id) fetchPokemon})
      : _fetchPokemonName = fetchPokemon,
        super(const PokemonState()) {
    on<PokemonAdded>((event, emit) {
      final newPokemos = Map<int, String>.from(state.pokemons);
      newPokemos[event.id] = event.name;
      emit(state.copyWith(pokemons: newPokemos));
    });
  }

  Future<String> fetchPokemonName(int id) async {
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }

    try {
      final pokemonName = await _fetchPokemonName(id);
      add(PokemonAdded(id: id, name: pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Failed to fetch pokemon');
    }
  }
}
