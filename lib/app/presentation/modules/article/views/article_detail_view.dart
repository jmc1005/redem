import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../global/widgets/app_bar_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';

class ArticleDetailView extends StatefulWidget {
  const ArticleDetailView({super.key});

  @override
  State<ArticleDetailView> createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {
  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBarWidget(
        asset: 'assets/images/redem.png',
        leading: IconButton(
          onPressed: () {
            navigateTo(Routes.articles, context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.secondary,
          ),
        ),
        backgroundColor: Colors.blueGrey[100],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x33000000),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1541167760496-1628856ab772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3437&q=80',
                            width: double.infinity,
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: Text(
                          'Product Name',
                          style: TextStyle(
                            color: Color(0xFF0F1113),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0,
                          0,
                          16,
                          0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat('dd-MM-yyyy').format(DateTime.now()),
                              style: const TextStyle(
                                color: Color(0xFF57636C),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        indent: 16,
                        endIndent: 16,
                        color: Color(0xFFDBE2E7),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: TextStyle(
                            color: Color(0xFF0F1113),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
              child: SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    navigateTo(Routes.startUp, context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                  ),
                  child: Text(language.guardar),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
