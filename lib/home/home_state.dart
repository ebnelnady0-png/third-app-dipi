part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeFailure extends HomeState {
  final String msg;
  HomeFailure(this.msg);
}



//get success
class GetStudentSuccess extends HomeState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> students;
  GetStudentSuccess(this.students);
}

// add success
class AddStudentSuccess extends HomeState {}

//update success
class UpdateStudentSuccess extends HomeState {}

//delete success
class DeleteStudentSuccess extends HomeState {}