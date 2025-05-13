import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';

class GetAllTasksUseCase {
  final LocalRepository localRepository;

  GetAllTasksUseCase({required this.localRepository});
  Future<List<TaskEntity>> call() {
    return localRepository.getAllTasksUseCase();
  }
}
