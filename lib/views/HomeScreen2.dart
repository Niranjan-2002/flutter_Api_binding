import 'dart:convert';

import 'package:api_binding/model/usermodel.dart';
import 'package:api_binding/views/informationscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;

class ComplexApi extends StatefulWidget {
  const ComplexApi({super.key});

  @override
  State<ComplexApi> createState() => _ComplexApiState();
}

class _ComplexApiState extends State<ComplexApi> {
  List<UserModel> userList=[];

  Future<List<UserModel>>getUserApi()async{
   final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
   
    var data = jsonDecode(response.body.toString());


   if(response.statusCode==200){

    for(Map i in data){
      userList.add(UserModel.fromJson(i));
    }
      return  userList;
   }
   else{
      return userList;
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("complex api Sceen")
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(), 
              builder: (context ,AsyncSnapshot<List<UserModel>> snapshot){

                  if(!snapshot.hasData){
                    return const  Center(
                      child:
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          Text("Fetching data from server"),
                          SizedBox(
                            height: 8,
                          ),
                           CircularProgressIndicator(),
                         ],
                       )
                       );
                  }else{
                    
                    return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context , index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push((context), MaterialPageRoute(
                              builder: (context)=> InfoScreen(address: snapshot.data![index].address!, name: snapshot.data![index].name.toString(),
                              )
                              )
                              );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Row(
                                      children: [
                                        const Text('Name :'),
                                      // Text("${snapshot.data!(index).name.toString()}")),
                                      const Spacer(),
                                          Text(snapshot.data![index].name.toString()),
                          
                                      ],
                                    ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Row(
                                       children: [
                                         const Text('Street :'),
                                         const Spacer(),
                                          Text(snapshot.data![index].address!.street.toString()),
                                       ],
                                     ),
                                                                             
                                   
                                 
                                           Row(
                                       children: [
                                         const Text('city :'),
                                         Spacer(),
                                   Text(snapshot.data![index].address!.city.toString())
                                       ],
                                     ),
                          
                                      
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }

              }
              
              )
            )
        ],
      ),
    );
  }
}