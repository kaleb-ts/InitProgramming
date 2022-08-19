import 'dart:io';

List mono = [
  "አንድ",
  "ሁለት",
  "ሶስት",
  "አራት",
  "አምስት",
  "ስድስት",
  "ሰባት",
  "ስምንት",
  "ዘጠኝ",
];

List duo = [
  "አስር",
  "ሃያ",
  "ሰላሳ",
  "አርባ",
  "ሀምሳ",
  "ስልሳ",
  "ሰባ",
  "ሰማኒያ",
  "ዘጠና",
  "መቶ",
  "ሺ",
  "አስርሺ",
  "መቶሺ",
  "ሚሊዮን",
  "አስሚሊዮን",
  "መቶሚሊዮን",
];

List num = [
  10,
  20,
  30,
  40,
  50,
  60,
  70,
  80,
  90,
  100,
  1000,
  10000,
  100000,
  1000000
];
void main() {
  print("enter your number");
  int input = int.parse(stdin.readLineSync() ?? '0');
  // int input = 500;

  int l = input.toString().length;
  if (l == 1) {
    print(mono[input - 1]);
  } else if (num.contains(input)) {
    int i = int.parse(input.toString()[0]);
    print("${mono[i - 1]}${duo[num.indexOf(input)]}");
  } else if (input
          .toString()
          .split("")
          .where((element) => element != "0")
          .length ==
      1) {
    int d = int.parse(input.toString().replaceAll("000", ""));
    int f = int.parse(d.toString()[0]) - 1;
    print(
        "${d.toString().length == 2 ? duo[f] : d.toString().length == 1 ? mono[f] : "${mono[f]} ${duo[l + 6]}"} ${d.toString().length == 3 ? "" : d.toString().length == 2 ? duo[l + 5] : duo[l + 6]}");
  } else {
    if (l == 2) {
      print(getDuo(input));
    } else if (l == 3) {
      int i1 = int.parse(input.toString().split("").first) - 1;
      String v = getDuo(int.parse(input.toString().substring(1, l)));
      print("${mono[i1]} ${duo[9]} $v");
    } else if (l == 4) {
      int i1 = int.parse(input.toString().split("").first) - 1;
      int i2 = int.parse(input.toString().split("")[1]);
      String v = getDuo(int.parse(input.toString().substring(2, l)));
      print("i am here 2 $v");
      int c = i2 != 0 ? i2 - 1 : 0;
      print(
          "${mono[i1]}${duo[10]}${c != -1 ? " ${mono[c]}" : "meto"}${c != -1 ? " ${duo[9]}" : ""} $v");
    } else if (l == 5) {
      var i1 = getDuo(int.parse(input.toString().substring(0, 2)));
      int i2 = int.parse(input.toString().split("")[2]);
      String v = getDuo(int.parse(input.toString().substring(3, l)));
      print(
          "${i1}${duo[10]} ${i2 != 0 ? " ${mono[i2 - 1]}" : ""}${input.toString()[2] == "0" ? "" : " ${duo[9]}"} $v");
    } else if (l == 6) {
      print("${get100k(input)}");
    } else if (l == 7) {
      int v = int.parse(input.toString().substring(1, l));
      print(
          "${mono[int.parse(input.toString()[0]) - 1]} ${duo[13]} ${get100k(v)}");
    } else if (l == 8) {
      int v = int.parse(input.toString().substring(1, l));
      print(
          "${mono[int.parse(input.toString()[0]) - 1]} ${duo[13]} ${get100k(v)}");
    }
  }
}

getDuo(int input) {
  int i1 = int.parse(input.toString().split("").first) - 1;
  if (input != 00) {
    if (input.toString().length == 1) {
      return "${mono[input - 1]}";
    } else if (input.toString().split("").last != "0" &&
        input.toString().split("").first != "0") {
      return "${i1 == 0 ? "አስራ" : duo[i1]} ${mono[int.parse(input.toString().split("").last) - 1]}";
    } else {
      return "${duo[i1]}";
    }
  } else {
    return "";
  }
}

get100k(int input) {
  var i1 = getDuo(int.parse(input.toString().substring(1, 3)));
  int i2 = int.parse(input.toString().split("")[3]);
  int i = int.parse(input.toString()[0]);
  String v =
      getDuo(int.parse(input.toString().substring(4, input.toString().length)));
  return "${mono[i - 1]} ${duo[9]} ${i1}${duo[10]}${i2 != 0 ? " ${mono[i2 - 1]}" : ""}${input.toString()[3] == "0" ? "" : " ${duo[9]}"} $v";
}




















// extension on int {
//   int get removeZeros {
//     final numberString = toString();
//     final numberDigits = List.from(numberString.split(''));
//     int index = numberDigits.length - 3;
//     while (index > 0) {
//       numberDigits.removeWhere((element) => element == "000");
//       index -= 3;
//     }
//     return int.parse(numberDigits.join());
//   }
// }
