import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';

class AddTaskUseCase {
  final LocalRepository localRepository;

  AddTaskUseCase({required this.localRepository});

  Future<void> call(TaskEntity task) {
    return localRepository.addTaskUseCase(task);
  }
}
