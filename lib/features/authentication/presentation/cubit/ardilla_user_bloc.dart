import 'package:ardilla/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ardilla_user_bloc.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updated({
    required User user,
  }) = UserEventUpdated;
}

class ArdillaUserBloc extends Bloc<UserEvent, User?> {
  ArdillaUserBloc({
    User? user,
  }) : super(user) {
    /// [ArdillaUserBloc] events = impl
    on<UserEvent>(
      (event, emit) => {
        event.when(
          updated: (user) {
            emit(user);
          },
        )
      },
    );

    /// add default event
    if (user != null) {
      add(
        UserEvent.updated(
          user: user,
        ),
      );
    }
  }
}
