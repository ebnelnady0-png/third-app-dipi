import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/home/home_cubit.dart';

Future<bool?>showEditDialog({
  required BuildContext context,
  required HomeCubit cubit,
  required String id,
  required Map<String,dynamic>student

}){
  return showDialog<bool>(
    context:context,
    builder:(dialogContext){

      cubit.nameControl.text = student['name'];
      cubit.ageControl.text = student['age'];
      cubit.gradeControl.text = student['grade'];

    return AlertDialog(
      title: Text("Edit Student"),
        content: Column(
          spacing: 12,
          children: [
            TextField(
              controller: cubit.nameControl,
              decoration: InputDecoration(hintText: 'Name',border: OutlineInputBorder()),

            ),
            TextField(
              controller: cubit.gradeControl,
              decoration: InputDecoration(hintText: 'Grade',border: OutlineInputBorder()),

            ),
            TextField(
              controller: cubit.ageControl,
              decoration: InputDecoration(hintText: 'Age',border: OutlineInputBorder()),

            ),
          ],
          
        ),
      
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(dialogContext,false);
        }, child: Text('Cancel')),
        ElevatedButton(onPressed: () async{
       if(cubit.nameControl.text.trim().isEmpty||
           cubit.gradeControl.text.trim().isEmpty||
           cubit.ageControl.text.trim().isEmpty
       ){
         ScaffoldMessenger.of(dialogContext).showSnackBar(

             SnackBar(
                 backgroundColor: Colors.red,
                 content: Text('Please fill the fields')));
         return ;
       }


       await cubit.updateStudent(id);
         if(!dialogContext.mounted);
         if(cubit.state is UpdateStudentSuccess){
         Navigator.pop(dialogContext,true);
       }
        }, child: Text('Save'))
      ],
    );
    
  },);
}