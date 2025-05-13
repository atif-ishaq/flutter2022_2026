import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';

class UpdateTaskUseCase {
  final LocalRepository localRepository;

  UpdateTaskUseCase({required this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.updateTaskUseCase(task);
  }
}
