import 'dart:io';

//note User dengan Map {Nama:Pin}
var userMap = {"Bambang": 123456, "Sumini": 654321};

//note Uang User
var balanced = [10000, 25000];

void menu(String name, int balance, int i) {
  print("Selamat datang");

  print(
      "Silahkan Pilih menu dibawah\n 1. Ambil Uang\n 2.Tranfer\n 3.Setor Tunai\n 4.Keluar");
  int pilihan = int.parse(stdin.readLineSync()!);

  switch (pilihan) {
    case 1:
      print("Silahkan masukan jumlah uang yang ditarik");
      int tarik = int.parse(stdin.readLineSync()!);
      if (balance < tarik) {
        print("Maaf Saldo anda kurang, Harap isi terlebih dahulu");
        return menu(name, balance, i);
      } else {
        balance = balance - tarik;
        balanced[i] = balance;
        print("Saldo anda saat ini adalah ${balanced[i]}");
        return menu(name, balanced[i], i);
      }
    case 2:
      print("Tranfer\n Silahkan Masukan Jumlah Tranfer");
      int tranfer = int.parse(stdin.readLineSync()!);
      if (balance < tranfer) {
        print("Maaf Saldo anda kurang, Harap isi terlebih dahulu");
        return menu(name, balance, i);
      } else {
        var nameTf = name == "Bambang" ? "Sumini" : "Bambang";
        print("Anda akan TF ke ${nameTf} Sejumlah ${tranfer}");
        balance = balance - tranfer;
        balanced[i] = balance;
        i == 0 ? balanced[1] -= balance : balanced[0] -= balance;
        print("Saldo Saat ini adalah ${balanced[i]}");
        return menu(name, balanced[i], i);
      }
    case 3:
      print("Setor Tunai\n Silahkan masukan uang setor");
      int setor = int.parse(stdin.readLineSync()!);
      balanced[i] += setor;
      print("Saldo anda saat ini adalah ${balanced[i]}");
      return menu(name, balanced[i], i);
    case 4:
      print("Out");
      break;

    default:
      print("Salah Pilih Menu");
      break;
  }
}

void main() {
  bool status = false;

  print("Silahkan masukan PIN Anda:");
  int number = int.parse(stdin.readLineSync()!);
  userMap.forEach((name, pin) {
    if (pin == number) {
      status = !status;
      return menu(name, name == "Bambang" ? balanced[0] : balanced[1],
          name == "Bambang" ? 0 : 1);
    }
  });
  print(status);
}
