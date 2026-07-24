import '../models/match_model.dart';

class MatchService {
  // دالة لجلب مباريات اليوم (بيانات تجريبية احترافية قابلة للربط مع API لاحقاً)
  Future<List<MatchModel>> getTodayMatches() async {
     await Future.delayed(const Duration(milliseconds: 800)); // محاكاة وقت التحميل
     
     return [
       MatchModel(
         id: '1',
         homeTeam: 'ريال مدريد',
         awayTeam: 'برشلونة',
         time: '21:00',
         league: 'الدوري الإسباني',
         channel: 'beIN Sports 1',
         commentator: 'حفيظ دراجي',
       ),
       MatchModel(
         id: '2',
         homeTeam: 'مانشستر سيتي',
         awayTeam: 'ليفربول',
         time: '18:30',
         league: 'الدوري الإنجليزي الممتاز',
         channel: 'beIN Sports 2',
         commentator: 'خالد الحدي',
       ),
       MatchModel(
         id: '3',
         homeTeam: 'بايرن ميونخ',
         awayTeam: 'بروسيا دورتموند',
         time: '19:30',
         league: 'الدوري الألماني',
         channel: 'beIN Sports 3',
         commentator: 'عصام الشوالي',
       ),
     ];
  }
}
