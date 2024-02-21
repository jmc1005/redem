import 'package:flutter/material.dart';

// import '../../domain/repository/user_repo.dart';

class Injector extends InheritedWidget {
  const Injector({
    super.key,
    required super.child,
    //required this.userRepo,
  });

  //final UserRepo userRepo;

  @override
  bool updateShouldNotify(_) => false;

  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();

    assert(injector != null, 'The injector doesn\'t exist');
    return injector!;
  }
}
