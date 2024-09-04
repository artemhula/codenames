part of 'socket_bloc.dart';

sealed class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object> get props => [];
}

final class Connect extends SocketEvent {}

final class Disconnect extends SocketEvent {}
