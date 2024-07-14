import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_app/internet_bloc/internet_bloc.dart';
import 'package:internet_connectivity_app/internet_bloc/internet_state.dart';
import 'package:internet_connectivity_app/internet_cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        //centerTitle: true,
        title: Text('Internet Connectivity using Bloc & Cubit'),
      ),
      //Using Cubit
      body: Center(
        child: BlocConsumer<InternetCubit, InternetCubitState>(
          builder: (context, state) {
            if(state == InternetCubitState.gained){
              return Text('Connected');
            }
            else if(state ==InternetCubitState.lost){
              return Text('Not Connected');
            }
            else{
               return Text('Loading...');
            }
          
        }, listener: (context, state) {
          if(state == InternetCubitState.gained){
            ScaffoldMessenger.of(context).showSnackBar(
              
              SnackBar(content: Text('Internet Connected'),
              backgroundColor: Colors.green,
      
              )
            );
          }
         else  if(state == InternetCubitState.lost){
            ScaffoldMessenger.of(context).showSnackBar(
              
              SnackBar(content: Text('Internet Not Connected'),
              backgroundColor: Colors.red,
      
              )
            );
          }
          
        },),
      )
  , //Using Bloc
    //   body: Center(
    //     child: BlocConsumer<InternetBloc, InternetState>(
    //       builder: (context, state) {
    //         if(state is InternetGainedState){
    //           return Text('Connected');
    //         }
    //         else if(state is InternetLostState){
    //           return Text('Not Connected');
    //         }
    //         else{
    //            return Text('Loading...');
    //         }
          
    //     }, listener: (context, state) {
    //       if(state is InternetGainedState){
    //         ScaffoldMessenger.of(context).showSnackBar(
              
    //           SnackBar(content: Text('Internet Connected'),
    //           backgroundColor: Colors.green,
      
    //           )
    //         );
    //       }
    //      else  if(state is InternetLostState){
    //         ScaffoldMessenger.of(context).showSnackBar(
              
    //           SnackBar(content: Text('Internet Not Connected'),
    //           backgroundColor: Colors.red,
      
    //           )
    //         );
    //       }
          
    //     },),
    //   )
     );
  }
}