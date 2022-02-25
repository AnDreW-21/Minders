import 'dart:io';

void startSystem() {
  print('1-add User');
  print('2-delete User');
  print('3-search by id');
  print('4-search by name');
  print('5-print all');
}

Map addUser(var id, String name, int age, String faculty) {
  Map user = {'id': id, 'name': name, 'age': age, 'faculty': faculty};
  return user;
}

int searchForID(List<Map> lists, var size, int id) {
  if (size < 0) {
    return -1;
  } else if (lists[size]['id'] == id) {
    return size;
  } else {
    return searchForID(lists, size - 1, id);
  }
}

void printALL(List<Map> lists) {
  for (int i = 0; i < lists.length; i++) {
    print(lists[i]);
  }
}

void deleteMember(int id, List<Map> person) {
  person.removeWhere((item) => item['id'] == id);
}

List<Map> selectionSort(List<Map> person, int n) {
  List<Map> list = List.from(person);
  int min;
  for (int i = 0; i < n - 1; i++) {
    min = i;
    for (var j = i + 1; j < n; j++) {
      if (list[j]['id'] < list[min]['id']) {
        min = j;
      }
    }
    Map dummy = list[min];
    list[min] = list[i];
    list[i] = dummy;
  }
  return list;
}

int binarySearch(List<Map> person,int left,int right, String name) {
  if (right >= left) {
    int mid = (left + (right - left) / 2).toInt();
    if (name == (person[mid]['name'])) {
      return mid;
    }
    if ({person[mid]['name'].compareTo(name)}==1) {
      return binarySearch(person, left, mid - 1, name);
    }
    return binarySearch(person, mid + 1, right, name);
  }
  return -1;
}

void main(List<String> arguments) {
  List<Map> person = [
    {'id': 3, 'name': 'andrew', 'age': '20', 'faculty': 'FCAI'},
    {'id': 2, 'name': 'nossa', 'age': '22', 'faculty': 'AUC'}
  ];
  while (true) {
    startSystem();
    int x = int.parse(stdin.readLineSync()!);
    switch (x) {
      case 1:
        print("Enter your ID");
        var id = int.parse(stdin.readLineSync()!);
        print("Enter your name");
        String name = stdin.readLineSync()!;
        print("Enter your age");
        int age = int.parse(stdin.readLineSync()!);
        print("Enter your faculty");
        String faculty = stdin.readLineSync()!;
        person.add(addUser(id, name, age, faculty));
        break;
      case 2:
        print("Enter your ID");
        var id = int.parse(stdin.readLineSync()!);
        deleteMember(id, person);
        break;
      case 3:
        print("Enter your ID");
        var id = int.parse(stdin.readLineSync()!);
        int index = searchForID(person, person.length - 1, id);
        if (index < 0) {
          print('Not Found');
        } else {
          print(person[index]);
        }
        break;
      case 4:
        print("Enter your name");
        String name = stdin.readLineSync()!;
        List<Map> sortedList=List.from(selectionSort(person, person.length));
        int index = binarySearch(
            sortedList,0,person.length-1, name);
        if (index == -1) {
          print("NOT FOUND");
        } else {
          print(sortedList[index]);
        }
        break;
      case 5:
        print('1-sorted');
        print('2-unsorted');
        String state = stdin.readLineSync()!;
        if (state == '1') {
          printALL(selectionSort(person, person.length));
        } else {
          printALL(person);
        }
        break;
      default:
        print('ERROR NOT FOUNd');
    }
    print('want to do anything else?(y/n)');
    String state = stdin.readLineSync()!;
    if (state.toLowerCase() == 'n') break;
  }
  print('Thank you \u2764');
}
