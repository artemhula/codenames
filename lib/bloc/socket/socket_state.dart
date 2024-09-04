part of 'socket_bloc.dart';

sealed class SocketState extends Equatable {
  const SocketState();
  
  @override
  List<Object> get props => [];
}

final class SocketInitial extends SocketState {}

final class SocketConnected extends SocketState {}

final class SocketDisconnected extends SocketState {}

final class SocketFailure extends SocketState {
  final String errorMessage;
  const SocketFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


