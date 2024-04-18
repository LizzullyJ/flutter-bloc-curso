import 'dart:async';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ])) {
    // on<SetInvitedFilterEvent>((SetInvitedFilterEvent event, Emitter emit) {
    //   emit(state.copyWith(filter: GuestFilter.invited));
    // });
    // on<SetNoInvitedFilterEvent>((SetNoInvitedFilterEvent event, Emitter emit) {
    //   emit(state.copyWith(filter: GuestFilter.noInvited));
    // });
    // on<SetAllFilterEvent>((SetAllFilterEvent event, Emitter emit) {
    //   emit(state.copyWith(filter: GuestFilter.all));
    // });
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
    on<AddGuestEvent>(_addGuestHandler);
    on<ToggleGuestEvent>(_toggleGuestHandler);
  }

  void changueFilter(GuestFilter newFilter) {
    add(SetCustomFilterEvent(newFilter: newFilter));
    // switch (newFilter){
    //   case GuestFilter.all:
    //   add(SetAllFilterEvent());
    //   break;
    //   case GuestFilter.invited:
    //   add(SetInvitedFilterEvent());
    //   break;
    //   case GuestFilter.noInvited:
    //   add(SetNoInvitedFilterEvent());
    //   break;
    // }
  }

  void addGuest(String name) {
    add(AddGuestEvent(name: name));
  }

  void toggleGuest(String id) {
    add(ToggleGuestEvent(id: id));
  }

  void _addGuestHandler(AddGuestEvent event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v4(), description: event.name, completedAt: null);
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _toggleGuestHandler(ToggleGuestEvent event, Emitter<GuestsState> emit) {
    final newGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(
            completedAt: guest.completedAt == null ? DateTime.now() : null);
      }
      return guest;
    }).toList();
    emit(state.copyWith(guests: newGuests));
  }
}
