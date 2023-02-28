import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:royex_test/repository/repository.dart';
import 'Models/model_class.dart';
import 'Size.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repo=Repository();
  Map<String,dynamic> map=<String, dynamic>{};
  String img='';
  String s = "\$";
  loadMap()async{
    map= await repo.fetchMap();
    setState(() {
      map;
    });
    print("map is $map");
  }
  @override
  void initState() {
    loadMap();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: Padding(
            padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*4.5,bottom: SizeConfig.blockSizeVertical*2,right: SizeConfig.blockSizeHorizontal*14),
            child:Row(
             // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_basket_outlined,size: SizeConfig.blockSizeVertical*6,),
                SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                     FittedBox(child: Text(map['vendor'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                     FittedBox(child: Text('M A R K E T',style: TextStyle(color: Colors.white,),)),
                  ],
                )
              ],
            )
          ),
          backgroundColor: Colors.yellow[900],
          centerTitle: true,
          leading: Padding(
            padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*1.5,bottom: SizeConfig.blockSizeVertical*4),
            child: IconButton(
              onPressed: (){
               // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>OrderRev()));
                //  Navigator. of(context). pop();
              },
              icon:const Icon(Icons.arrow_back_ios,color: Colors.white,) ,

            ),
          ),
        ),
      ),
      body:ListView(
        children: [
          Stack(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical*22,
                width: double.infinity,
                color: Colors.green,
               // child: Image.network(img!),
              ),
              Padding(
                padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*30),
                child: Container(
                  height: SizeConfig.blockSizeVertical*26,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical*2,
                        left:SizeConfig.blockSizeHorizontal*4
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(map['title'],style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3.3,fontWeight: FontWeight.bold),),
                        SizedBox(height: SizeConfig.blockSizeVertical*1.7,),
                        Row(
                          children: [
                            Text('Model:',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                            SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                            Text(map['id'].toString(),style: TextStyle(color: Colors.black38,fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical*1.1,),
                        Row(
                          children: [
                             Container(
                                height: SizeConfig.blockSizeVertical*4,
                                width: SizeConfig.blockSizeHorizontal*20,
                               // color: Colors.yellow[900],
                               // margin: EdgeInsets.all(100.0),
                                decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    //shape: BoxShape.circle
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft:Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                                    const Icon(Icons.star,color: Colors.white,),
                                    SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                                    Text('4.8',style: TextStyle(color: Colors.white,fontSize: SizeConfig.blockSizeVertical*2.5),)


                                  ],
                                ),
                              ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal*42,),
                            Text('Brand :',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                            SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                            SizedBox(
                                height: SizeConfig.blockSizeVertical*7,
                                width: SizeConfig.blockSizeHorizontal*8,
                                child: Image.asset('assets/images/al.png')
                            ),

                          ],
                        ),
                       Row(
                         children: [
                           Text("$s${map['variants'][0]['price'].toString()} ",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                           SizedBox(width:SizeConfig.blockSizeHorizontal*8),
                           Text("IQD:",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                           SizedBox(width:SizeConfig.blockSizeHorizontal*1),
                           Text("${map['variants'][0]['inventory_item_id'].toString()} ",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),)
                         ],
                       )

                      ],
                    ),
                  )
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*15.5,),
                child: SizedBox(
                  height: SizeConfig.blockSizeVertical*15,
                  width: double.infinity,
                  //color: Colors.red,
                  child: fetchProductToShow(),
                ),
              ),

            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*3,),
          Padding(
            padding:  EdgeInsets.only( left:SizeConfig.blockSizeHorizontal*3),
            child: Row(
              children: [
                Container(
                  color: Colors.orange,
                  height:SizeConfig.blockSizeVertical*6,
                  width:SizeConfig.blockSizeHorizontal*30,
                  child: const Center(
                    child: Text('Description',style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal*3,),
                Container(
                  color: Colors.white,
                  height:SizeConfig.blockSizeVertical*6,
                  width:SizeConfig.blockSizeHorizontal*30,
                  child: const Center(
                    child: Text('Specification',style: TextStyle(color: Colors.black),),
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal*3,),
                Container(
                  color: Colors.white,
                  height:SizeConfig.blockSizeVertical*6,
                  width:SizeConfig.blockSizeHorizontal*30,
                  child: const Center(
                    child: Text('Downloads',style: TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2,),
          Padding(
            padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*3,right:SizeConfig.blockSizeHorizontal*3 ),
            child: Container(
              color: Colors.black,
              height: SizeConfig.blockSizeVertical*4,
              width: SizeConfig.blockSizeHorizontal*70,
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2,),
          Padding(
            padding:  EdgeInsets.only( left:SizeConfig.blockSizeHorizontal*3),
            child: Row(
              children: [
                Container(
                 // color: Colors.orange,
                  height:SizeConfig.blockSizeVertical*6,
                  width:SizeConfig.blockSizeHorizontal*12,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12)
                  ),
                  child: Center(
                    child: Text('-',style:TextStyle(color: Colors.black,fontSize: SizeConfig.blockSizeVertical*5,),),
                  ),
                ),
               // SizedBox(width: SizeConfig.blockSizeHorizontal*3,),
                Container(
                 // color: Colors.white,
                  height:SizeConfig.blockSizeVertical*6,
                  width:SizeConfig.blockSizeHorizontal*12,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12)
                  ),
                  child:  Center(
                    child: Text('1',style: TextStyle(color: Colors.black,fontSize: SizeConfig.blockSizeVertical*3,),),
                  ),
                ),
                //SizedBox(width: SizeConfig.blockSizeHorizontal*3,),
                Container(
                 // color: Colors.white,
                  height:SizeConfig.blockSizeVertical*6,
                  width:SizeConfig.blockSizeHorizontal*12,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12)
                  ),
                  child:  Center(
                    child: Text('+',style: TextStyle(color: Colors.black,fontSize: SizeConfig.blockSizeVertical*3,),),
                  ),
                ),
                Container(
                   color: Colors.green[700],
                  height:SizeConfig.blockSizeVertical*6,
                  width:SizeConfig.blockSizeHorizontal*30,
                  child:  Center(
                    child: Text('Buy Now',style: TextStyle(color: Colors.white,fontSize: SizeConfig.blockSizeVertical*2,),),
                  ),
                ),
                Container(
                  color: Colors.green[700],
                  height:SizeConfig.blockSizeVertical*6,
                  width:SizeConfig.blockSizeHorizontal*30,
                  child:  Center(
                    child: Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: SizeConfig.blockSizeVertical*2,),),
                  ),
                ),
              ],
            ),
          ),

        ],
      )

    );
  }
  Widget fetchProductToShow(){
    return  FutureBuilder<List<ModelOfProduct>>(
      future:repo.fetchProducts() ,
      builder: ( context,  snapshot) {

        if(snapshot.hasData){
          return Swiper(

              itemHeight: SizeConfig.blockSizeVertical*10,
              itemWidth: SizeConfig.blockSizeHorizontal*50,
              scrollDirection: Axis.horizontal,
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

    return Card(
      elevation: 10,
      child: SizedBox(
        height: SizeConfig.blockSizeVertical*10,
        width: SizeConfig.blockSizeHorizontal*30,
        child: Image.network(image,fit: BoxFit.fill,),
      ),
    );
  }
}
