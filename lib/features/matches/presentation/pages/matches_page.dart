import 'package:flutter/material.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مباريات اليوم'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_events, size: 16, color: Colors.amber),
                      SizedBox(width: 6),
                      Text(
                        'الدوري الإسباني',
                        style: TextStyle(
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
                      const Expanded(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.sports_soccer, color: Colors.white),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'ريال مدريد',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      
                      // التوقيت / النتيجة
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '21:00',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),

                      // الفريق الثاني
                      const Expanded(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.sports_soccer, color: Colors.white),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'برشلونة',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.tv, size: 14, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('beIN Sports 1', style: TextStyle(fontSize: 11)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.mic, size: 14, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('حفيظ دراجي', style: TextStyle(fontSize: 11)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
