import 'package:flutter/material.dart';
import '../../data/datasources/match_service.dart';
import '../../data/models/match_model.dart';
import 'match_detail_page.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  final MatchService _matchService = MatchService();
  late Future<List<MatchModel>> _matchesFuture;

  @override
  void initState() {
    super.initState();
    _matchesFuture = _matchService.getTodayMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مباريات اليوم'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<MatchModel>>(
        future: _matchesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد مباريات اليوم'));
          }

          final matches = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchDetailPage(match: match),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // اسم الدوري
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.emoji_events, size: 16, color: Colors.amber),
                            const SizedBox(width: 6),
                            Text(
                              match.league,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 20),
                        
                        // تفاصيل المباراة والفرق
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // الفريق الأول
                            Expanded(
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.grey,
                                    child: Icon(Icons.sports_soccer, color: Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    match.homeTeam,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            
                            // التوقيت
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                match.time,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),

                            // الفريق الثاني
                            Expanded(
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.grey,
                                    child: Icon(Icons.sports_soccer, color: Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    match.awayTeam,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 12),
                        
                        // القناة الناقلة والمعلق
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.tv, size: 14, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(match.channel, style: const TextStyle(fontSize: 11)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.mic, size: 14, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(match.commentator, style: const TextStyle(fontSize: 11)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
