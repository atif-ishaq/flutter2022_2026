import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';

class TurnOnNotificationsUseCase {
  final LocalRepository localRepository;

  TurnOnNotificationsUseCase({required this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.turnOnNotificationUseCase(task);
  }
}
