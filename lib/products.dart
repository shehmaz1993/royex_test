import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:royex_test/Models/model_class.dart';
import 'package:royex_test/repository/repository.dart';

import 'Size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Repository repo=Repository();
  @override
  Widget build(BuildContext context) {
   //this is Size Configuration
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: Padding(
            padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*3.5,bottom: SizeConfig.blockSizeVertical*2),
            child: const FittedBox(child: Text('Products',style: TextStyle(color: Colors.black45),)),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Padding(
            padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*1.5,bottom: SizeConfig.blockSizeVertical*4),
            child: IconButton(
              onPressed: (){

              },
              icon:const Icon(Icons.arrow_back,color: Colors.lightBlue,) ,

            ),
          ),
        ),
      ),
     body:FutureBuilder<List<ModelOfProduct>>(
       future:repo.fetchProducts() ,
       builder: ( context,  snapshot) {

         if(snapshot.hasData){
           return ListView.builder(
               itemCount:snapshot.data!.length ,
               itemBuilder: (context,index){
                  return showProduct(
                      snapshot.data![index].productId.toString(),
                      snapshot.data![index].id.toString(),
                      snapshot.data![index].src.toString()
                  );
               }
           );

         }
         else{
           return const Center(
             child: CircularProgressIndicator(),
           );
         }

       },
     )
    );
  }
  Widget showProduct(String productId,String id,String image){
    return Card(
      elevation: 8,
      child: ListTile(
        title: Text('ProductId: $productId',style: const TextStyle(fontStyle: FontStyle.italic)),
        subtitle: Text('id: $id',style: const TextStyle(fontStyle: FontStyle.italic)),
        leading: SizedBox(
          height: SizeConfig.blockSizeVertical*10,
          width: SizeConfig.blockSizeHorizontal*30,
          child: Image.network(image),
        ),
      ),
    );
  }
}
