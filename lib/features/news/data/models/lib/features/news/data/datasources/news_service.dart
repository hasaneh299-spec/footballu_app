import '../models/news_model.dart';

class NewsService {
  Future<List<NewsModel>> getLatestNews() async {
    await Future.delayed(const Duration(milliseconds: 800)); // محاكاة وقت التحميل

    return [
      NewsModel(
        id: '1',
        title: 'رسمياً: ريال مدريد يعلن التعاقد مع نجم خط الوسط',
        description: 'أعلن نادي ريال مدريد اليوم عن ضم اللاعب الشاب وسط ترقب كبير من الجماهير لمشواره مع الفريق الملكي.',
        imageUrl: 'https://images.unsplash.com/photo-1508098682722-e99c43a406b2?w=500',
        time: 'منذ ساعتين',
      ),
      NewsModel(
        id: '2',
        title: 'برشلونة يستعد لكلاسيكو الأرض بصفوف مكتملة',
        description: 'يخوض نادي برشلونة تدريباته الأخيرة استعداداً للمواجهة المرتقبة وسط عودة جميع اللاعبين المصابين.',
        imageUrl: 'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=500',
        time: 'منذ 4 ساعات',
      ),
      NewsModel(
        id: '3',
        title: 'صراع القمة اشتعل في الدوري الإنجليزي الممتاز',
        description: 'تعادل مثير يغير صدارة جدول ترتيب البريميرليج ويشعل المنافسة بين الأندية الكبرى.',
        imageUrl: 'https://images.unsplash.com/photo-1518091043644-c1d4457512c6?w=500',
        time: 'منذ 6 ساعات',
      ),
    ];
  }
}
