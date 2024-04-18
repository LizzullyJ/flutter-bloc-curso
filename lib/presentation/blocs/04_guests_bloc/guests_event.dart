part of 'guests_bloc.dart';

sealed class GuestsEvent {
  const GuestsEvent();
}

// final class SetAllFilterEvent extends GuestsEvent{}
// final class SetInvitedFilterEvent extends GuestsEvent{}
// final class SetNoInvitedFilterEvent extends GuestsEvent{}

final class SetCustomFilterEvent extends GuestsEvent{
  final GuestFilter newFilter;

  SetCustomFilterEvent({required this.newFilter});
}

final class  AddGuestEvent extends GuestsEvent{
  final String name;

  AddGuestEvent({required this.name});

}

final class ToggleGuestEvent extends GuestsEvent{
  final String id;

  ToggleGuestEvent({required this.id});
}