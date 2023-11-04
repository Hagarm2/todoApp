class TaskModel {
  String id;
  String? tasktitle;
  String? descrip;
  int date;
  bool isDone;
  String userId;


  TaskModel({this.id = '',
    required this.tasktitle,
    required this.descrip,
    required this.date,
    required this.userId,
    this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic>json) :this
      (tasktitle: json["tasktitle"],
        descrip: json['description'],
        date: json['date'],

        isDone: json['isdone'],
        userId: json['userId'],id: json['id']);


  Map<String, dynamic>toJson() {
    return {
    "tasktitle": tasktitle,
    'description': descrip,
    'date': date,
    "isdone":isDone,
      "id": id,
      "userId": userId,
  };

  }
}
