import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rikaz/core/helper/sqldb.dart';
import 'package:rikaz/data/model/student_model.dart';
part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataLoading());

  List<Student> students = [];

  void getData() async {
    SqlDb db = SqlDb();
    List<Map<String, dynamic>> data =
        await db.readData("SELECT * FROM students");
    students = data.map((e) => Student.fromMap(e)).toList();
    emit(DataLoaded(students));
  }
}
