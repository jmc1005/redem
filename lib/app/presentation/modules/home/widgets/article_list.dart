import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final List<String> entries = <String>[
      faker.lorem.sentence(),
      faker.lorem.sentence(),
      faker.lorem.sentence(),
      faker.lorem.sentence(),
      faker.lorem.sentence(),
      faker.lorem.sentence(),
      faker.lorem.sentence(),
    ];

    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Center(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 150,
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Article $index',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(entries[index]),
                            )
                          ],
                        ),
                      ),
                    ));
              },
              itemCount: entries.length,
              separatorBuilder: (_, __) => const SizedBox(
                width: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
