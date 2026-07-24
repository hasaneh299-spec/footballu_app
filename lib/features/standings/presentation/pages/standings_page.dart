import 'package:flutter/material.dart';

class StandingsPage extends StatelessWidget {
  const StandingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جدول الترتيب'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(35), // الترتيب
            1: FlexColumnWidth(),   // الفريق
            2: FixedColumnWidth(35), // لعب
            3: FixedColumnWidth(35), // +/-
            4: FixedColumnWidth(40), // النقاط
          },
          border: TableBorder.all(color: Colors.grey.shade300, width: 1),
          children: [
            // رأس الجدول
            TableRow(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              children: const [
                Padding(padding: EdgeInsets.all(8.0), child: Text('#', fontWeight: FontWeight.bold, textAlign: TextAlign.center)),
                Padding(padding: EdgeInsets.all(8.0), child: Text('الفريق', fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.all(8.0), child: Text('ل', fontWeight: FontWeight.bold, textAlign: TextAlign.center)),
                Padding(padding: EdgeInsets.all(8.0), child: Text('GD', fontWeight: FontWeight.bold, textAlign: TextAlign.center)),
                Padding(padding: EdgeInsets.all(8.0), child: Text('ن', fontWeight: FontWeight.bold, textAlign: TextAlign.center)),
              ],
            ),
            // صفوف الفرق
            _buildTableRow('1', 'ريال مدريد', '20', '+30', '50', isTop: true),
            _buildTableRow('2', 'برشلونة', '20', '+22', '45'),
            _buildTableRow('3', 'أتلتيكو مدريد', '20', '+15', '41'),
            _buildTableRow('4', 'جيرونا', '20', '+10', '38'),
            _buildTableRow('5', 'أتلتيك بلباو', '20', '+5', '35'),
          ],
        ),
      ),
    );
  }

  static TableRow _buildTableRow(String rank, String team, String played, String gd, String points, {bool isTop = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isTop ? Colors.green.shade50 : Colors.white,
      ),
      children: [
        Padding(padding: const EdgeInsets.all(8.0), child: Text(rank, textAlign: TextAlign.center, style: TextStyle(fontWeight: isTop ? FontWeight.bold : FontWeight.normal))),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(team, style: TextStyle(fontWeight: isTop ? FontWeight.bold : FontWeight.normal))),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(played, textAlign: TextAlign.center)),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(gd, textAlign: TextAlign.center)),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(points, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }
}
