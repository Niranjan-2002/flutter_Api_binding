
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/postmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postList = [] ;

  Future<List<PostsModel>> getPostApi ()async{
    final resposne = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')) ;
    var data = jsonDecode(resposne.body.toString());
    if(resposne.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList ;
    }else {
      return postList ;
    }
  }

  // @override
  // void initState() {
  //   getPostApi();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
      return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const InkWell(
            child: Text('Api Course')),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context , snapshot){
                if(!snapshot.hasData){
                    return const  Center(
                      child:
                       Column(
                         children: [
                          Text("Fetching data from server"),
                           CircularProgressIndicator(),
                         ],
                       ));
                 
                }else {
                  return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('Title' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                SizedBox(height: 3,),
                                Text(postList[index].title.toString()),
                                SizedBox(height: 5,),
                                Text('Description' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                SizedBox(height: 3,),
                                Text('Description\n'+postList[index].body.toString() , style: Theme.of(context).textTheme.bodyText1)
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
}}
  