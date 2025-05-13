import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';
import 'package:sembast/sembast.dart';

class OpenDatabaseUseCase {
  final LocalRepository localRepository;

  OpenDatabaseUseCase({required this.localRepository});
  Future<Database> call() {
    return localRepository.openDatabseUseCase();
  }
}
