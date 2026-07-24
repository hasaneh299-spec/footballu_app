class MatchModel {
  final String id;
  final String homeTeam;
  final String awayTeam;
  final String time;
  final String league;
  final String channel;
  final String commentator;

  MatchModel({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.time,
    required this.league,
    required this.channel,
    required this.commentator,
  });

  // دالة لتحويل البيانات القادمة من JSON
  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json['id'] ?? '',
      homeTeam: json['homeTeam'] ?? '',
      awayTeam: json['awayTeam'] ?? '',
      time: json['time'] ?? '',
      league: json['league'] ?? '',
      channel: json['channel'] ?? '',
      commentator: json['commentator'] ?? '',
    );
  }

  // تحويل البيانات إلى JSON (عند الحاجة)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'time': time,
      'league': league,
      'channel': channel,
      'commentator': commentator,
    };
  }
}
