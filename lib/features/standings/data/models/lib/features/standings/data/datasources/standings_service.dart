import '../models/standings_model.dart';

class StandingsService {
  Future<List<StandingsModel>> getLeagueStandings() async {
    await Future.delayed(const Duration(milliseconds: 800)); // محاكاة وقت التحميل

    return [
      StandingsModel(rank: 1, teamName: 'ريال مدريد', played: 20, points: 52),
      StandingsModel(rank: 2, teamName: 'برشلونة', played: 20, points: 48),
      StandingsModel(rank: 3, teamName: 'أتلتيكو مدريد', played: 20, points: 41),
      StandingsModel(rank: 4, teamName: 'جيرونا', played: 20, points: 38),
      StandingsModel(rank: 5, TeamName: 'أتلتيك بلباو', played: 20, points: 35),
    ];
  }
}
