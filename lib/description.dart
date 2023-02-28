import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:royex_test/Size.dart';
import 'package:royex_test/repository/repository.dart';

import 'Models/model_class.dart';
class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
    String img='https://cdn.shopify.com/s/files/1/0557/6890/7820/products/DHA-99KWR-back.webp?v=1673169002';
    Repository repo=Repository();
    Map<String,dynamic>? map;
    //=<String, dynamic>{};

    String s = "\$";
    int count=1;
    loadMap()async{
      map= await repo.fetchMap();
       setState(() {

       });
      print("map is $map");
      return map;
    }

    @override
  void initState() {
     setState(() {
       loadMap();
     });
     // fetchMap();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
     // appBar: AppBar(title: Text('description'),),
      body: ListView(
        children: [
           Padding(
             padding:  EdgeInsets.only(
                 left: SizeConfig.blockSizeHorizontal*5,
                 right: SizeConfig.blockSizeHorizontal*5,
             ),
             child: Container(
               color: Colors.white70,
               height: SizeConfig.blockSizeVertical*80,
               width: SizeConfig.blockSizeHorizontal*50,
               child:fetchProductToShow(),
             ),
           ),
          Padding(
            padding:  EdgeInsets.only(
              top: SizeConfig.blockSizeVertical*5,
              left: SizeConfig.blockSizeHorizontal*5.5,
              right: SizeConfig.blockSizeHorizontal*5.5,
            ),
            child: Container(
              height: SizeConfig.blockSizeVertical*40,
              width: SizeConfig.blockSizeHorizontal*70,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12)
              ),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical*2.5,
                        left: SizeConfig.blockSizeHorizontal*5
                    ),
                    child: Row(
                      children: [
                        Text('Ratings',style:  TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                        SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                        const Icon(Icons.star,color: Colors.orange,),
                        Text('4.8',style:  TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                        SizedBox(width: SizeConfig.blockSizeHorizontal*12,),
                        Text('320 Ratings >',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5),),
                      ],
                    ),
                  ),
                 Padding(
                   padding: EdgeInsets.only(
                       top: SizeConfig.blockSizeVertical*2.5,
                       left: SizeConfig.blockSizeHorizontal*5
                   ),
                   child: Column(
                     children: [
                       showRatings(),
                       SizedBox(height: SizeConfig.blockSizeVertical*2,),
                       showRatings(),
                       SizedBox(height: SizeConfig.blockSizeVertical*2,),
                       showRatings(),
                       SizedBox(height: SizeConfig.blockSizeVertical*2,),
                       showRatings(),
                     ],
                   )
                 ),

                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
                     top: SizeConfig.blockSizeVertical*3,
                     bottom: SizeConfig.blockSizeVertical*3,
                     left: SizeConfig.blockSizeHorizontal*35,
                     right: SizeConfig.blockSizeHorizontal*35,
                   ),
            child: Text('View all',style:  TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold,color: Colors.orange),),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal*6,
            ),
            child: Row(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Related Items',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                SizedBox(width: SizeConfig.blockSizeHorizontal*22,),
                Text('view more',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold,color: Colors.orange),)
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2,),
          showRelatedItems(),
          SizedBox(height: SizeConfig.blockSizeVertical*10,)
        ],
      ),
    );
  }
  Widget fetchProductToShow(){
    return  FutureBuilder<List<ModelOfProduct>>(
      future:repo.fetchProducts() ,
      builder: ( context,  snapshot) {

        if(snapshot.hasData){
          return ListView.builder(

              scrollDirection: Axis.vertical,
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
    );
  }
    Widget showProduct(String productId,String id,String image){

      return  SizedBox(
        height: SizeConfig.blockSizeVertical*20,
        width: SizeConfig.blockSizeHorizontal*80,
        child: Card(
          elevation: 10,
          child:Image.network(image,fit: BoxFit.fill,),
        ),
      );
    }

    Widget showRatings(){
      return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Irfan A.-08 Jan 2022',style:  TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5,fontWeight: FontWeight.bold),),
              Text('Color Family blue',style:  TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5,color: Colors.black12),),


            ],
          ),
           SizedBox(width: SizeConfig.blockSizeHorizontal*4,),
           Padding(
             padding: EdgeInsets.only(bottom:SizeConfig.blockSizeVertical*2),
             child: Row(
               children: const [
                 Icon(Icons.star,color: Colors.orange,),
                 Icon(Icons.star,color: Colors.orange,),
                 Icon(Icons.star,color: Colors.orange,),
                 Icon(Icons.star,color: Colors.orange,),
                 Icon(Icons.star,color: Colors.orange,)
               ],
             ),
           )
        ],
      );
    }
    Widget showRelatedItems(){
      return Padding(
        padding:  EdgeInsets.only(
            left:SizeConfig.blockSizeHorizontal*10,
            right: SizeConfig.blockSizeHorizontal*30
        ),
        child: Container(
            height: SizeConfig.blockSizeVertical*35,
            width: SizeConfig.blockSizeHorizontal*30,
            decoration: BoxDecoration(
               // color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26)
        ),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: SizeConfig.blockSizeVertical*15,
                width: double.infinity,
                child: Image.network(img),
              ),
              Padding(
                padding:  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*15),
                child: Row(
                  children: [
                    Container(
                      color: Colors.white,
                        height: SizeConfig.blockSizeVertical*5,
                        width: SizeConfig.blockSizeHorizontal*10,
                        child: Image.asset('assets/images/al.png')
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal*10,),
                    Container(
                        color: Colors.white,
                        height: SizeConfig.blockSizeVertical*5,
                        width: SizeConfig.blockSizeHorizontal*10,
                        child: Image.asset('assets/images/star.png')
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*2),
                child: Text(map!['title'],style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.8,fontWeight: FontWeight.bold,color: Colors.orange),),
              ),
              Padding(
                padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*2),
                child: Row(
                  children: [
                    Text("$s${map!['variants'][0]['price'].toString()} ",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                    SizedBox(width:SizeConfig.blockSizeHorizontal*8),
                   // Text("IQD:",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                   // SizedBox(width:SizeConfig.blockSizeHorizontal*1),
                  //  Text("${map!['variants'][0]['inventory_item_id'].toString()} ",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),)
                  ],
                ),
              )

            ],
          ),
    ),
      );
    }
}
