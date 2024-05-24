import 'package:yes_no_app/src/features/presentation/MainCoordinator/MainCoordinator.dart';

abstract class Coordinator {
  late List<Coordinator> childCoordinators;
}

abstract class ChildCoordinator {
  late MainCoordinator parentCoordinator;
}