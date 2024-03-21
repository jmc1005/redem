import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../data/http/result.dart';
import '../../../../domain/models/article_data/article_data.dart';
import '../../../../domain/repository/article_repo.dart';
import '../../../global/widgets/app_bar_widget.dart';
import '../widgets/article_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  late final Future<Result<List<ArticleData>, int>> _future;

  @override
  void initState() {
    super.initState();
    final ArticleRepo repo = context.read();
    _future = repo.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        asset: 'assets/images/redem.png',
        leading: IconButton(
          onPressed: () {
            navigateTo(Routes.admin, context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.secondary,
          ),
        ),
        backgroundColor: Colors.blueGrey[100],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _future,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  final Result<List<ArticleData>, int> data = snapshot.data!;

                  final result = switch (data) {
                    Failure(exception: final exception) => exception,
                    Success(value: final List<ArticleData> articles) => articles
                  };

                  if (result is List<ArticleData>) {
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        return ArticleWidget(articleData: result[index]);
                      },
                      itemCount: result.length,
                    );
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                return const Text('Error');
              },
            ),
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
