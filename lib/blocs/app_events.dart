import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoadEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
