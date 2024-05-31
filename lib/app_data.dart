
class AppData {
  AppData._();

  static const List<int> weeklyExtraAll = [
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
    DateTime.saturday,
    DateTime.sunday,
  ];
  static const List<int> weeklyDaysStartSaturday = [
    DateTime.saturday,
    DateTime.sunday,
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
  ];
  static const List<int> weeklyDaysStartSunday = [
    DateTime.sunday,
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
    DateTime.saturday,
  ];
  static const monthlyExtraAll = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
  ];
  //7F27FF
  static const List<String> colors = [
    '0xFF006E1C',
    '0xFFFF8000',
    '0xFF6D23F9',
    '0xFF4049E0',
    '0xFF005DB7',
    '0xFF6420AA',
    '0xFF006783',
    '0xFF5356FF',
    '0xFF355CA8',
    '0xFFA23956',
    '0xFFD0A2F7',
    '0xFFB91D20',
    '0xFFFE7A36',
    '0xFFFF9843',
    '0xFF7F27FF',
    '0xFFFF0000',
    // '0xFF005DB7',
    // '0xFF4755B6',
  ];

  static const List<String> colors2 = [
    '0xff800080',
    '0xffFF00FF',
    '0xff000080',
    '0xff0000FF',
    '0xff008080',
    '0xff00FFFF',
    '0xff008000',
    '0xff00FF00',
    '0xff808000',
    '0xffFFFF00',
    '0xff800000',
    '0xffFF0000',
    '0xffDFFF00',
    '0xffFFBF00',
    '0xffFF7F50',
    '0xffDE3163',
  ];
  static Map<DateTime, int> datasets() {
    final Map<DateTime, int> myData = {};
    //Random().nextInt(2)
    // DateTime endDate = DateTime.now().toYMD;
    DateTime startDate = DateTime.now().subtract(const Duration(days: 364));
    for (int i = 0; i < 365; i++) {
      DateTime d = startDate.add(Duration(days: i)).toYMD;
      myData[d] = 0;
    }
    return myData;
  }
}

extension TDay on DateTime {

  DateTime get toYMD {
    DateTime date = DateTime(year, month, day);
    return date;
  }
}
