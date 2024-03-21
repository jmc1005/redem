import '../../../../data/services/local/session_service.dart';
import '../../../../domain/models/article_data/article_data.dart';
import '../../../../domain/repository/article_repo.dart';
import '../../../global/state_notifier.dart';

class ArticleController extends StateNotifier<ArticleData?> {
  ArticleController({
    required this.articleRepo,
    required this.sessionService,
  }) : super(null);

  final ArticleRepo articleRepo;
  final SessionService sessionService;

  set article(ArticleData articleData) {
    state = articleData;
    onlyUpdate(state);
  }
}
