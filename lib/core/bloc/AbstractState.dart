import 'package:equatable/equatable.dart';

abstract class AbstractState extends Equatable {
  AbstractState();

  @override
  List<Object> get props => [];
  dynamic name();
}