part of 'guests_bloc.dart';

enum GuestFilter {
  all,
  invited,
  noInvited,
}

class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> guests;
  const GuestsState({
    this.filter = GuestFilter.all,
    this.guests = const [],
  });

  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) =>
      GuestsState(
        filter: filter ?? this.filter,
        guests: guests ?? this.guests,
      );

  int get howManyGuests => guests.length;
  List<Todo> get filteredGuest {
    switch (filter) {
      case GuestFilter.invited:
        return guests.where((guest) => guest.done).toList();
      case GuestFilter.noInvited:
        return guests.where((guest) => !guest.done).toList();
      case GuestFilter.all:
        return guests;
      default:
        throw Exception('Filter value not valid');
    }
  }

  int get howManyFilteredGuests => filteredGuest.length;

  @override
  List<Object> get props => [
        filter,
        guests,
      ];
}
