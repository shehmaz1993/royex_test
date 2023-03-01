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

    @override
  void initState() {
     repo.fetchMap().then((value){
       if(map==null){
         setState(() {
           map=value;
         });
       }

     });
     // fetchMap();
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
                      FittedBox(child: Text(map!['vendor'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      const FittedBox(child: Text('M A R K E T',style: TextStyle(color: Colors.white,),)),
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

              },
              icon:Padding(
                padding: EdgeInsets.only(top:SizeConfig.blockSizeVertical*0.8),
                child: const Icon(Icons.arrow_back_ios,color: Colors.white,),
              ) ,

            ),
          ),
        ),
      ),
      body:map!=null? ListView(
        children: [
          Stack(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical*22,
                width: double.infinity,
                color: Colors.white,
                child: Image.network(img,height: SizeConfig.blockSizeVertical*3,),
              ),
              Padding(
                padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*34),
                child: Container(
                  height: SizeConfig.blockSizeVertical*8,
                  width: SizeConfig.blockSizeHorizontal*13,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      //shape: BoxShape.circle
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft:Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                  ),
                  child: Image.asset('assets/images/70per.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left:SizeConfig.blockSizeHorizontal*90,
                    top: SizeConfig.blockSizeVertical*10
                ),
                child: const Icon(Icons.share,color: Colors.black38,),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left:SizeConfig.blockSizeHorizontal*89,
                    top: SizeConfig.blockSizeVertical*3
                ),
                child: SizedBox(
                  height: SizeConfig.blockSizeVertical*4,
                  width: SizeConfig.blockSizeHorizontal*7,
                  child: Image.asset('assets/images/love.png'),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*23),
                child: Container(
                    height: SizeConfig.blockSizeVertical*31,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical*2,
                          left:SizeConfig.blockSizeHorizontal*4
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(top:SizeConfig.blockSizeHorizontal*13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(map!['title'],style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3.3,fontWeight: FontWeight.bold),),
                            SizedBox(height: SizeConfig.blockSizeVertical*1.7,),
                            Row(
                              children: [
                                Text('Model:',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                                SizedBox(width: SizeConfig.blockSizeHorizontal*2,),
                                Text(map!['id'].toString(),style: TextStyle(color: Colors.black38,fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),)
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
                                    child: Image.asset('assets/images/al.png',)
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Text("$s${map!['variants'][0]['price'].toString()} ",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                                SizedBox(width:SizeConfig.blockSizeHorizontal*8),
                                Text("IQD:",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                                SizedBox(width:SizeConfig.blockSizeHorizontal*1),
                                Text("${map!['variants'][0]['inventory_item_id'].toString()} ",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),)
                              ],
                            )

                          ],
                        ),
                      ),
                    )
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(
                  top:SizeConfig.blockSizeVertical*15.5,
                  left: SizeConfig.blockSizeHorizontal*16,
                  right: SizeConfig.blockSizeHorizontal*16,
                ),
                child: SizedBox(
                  height: SizeConfig.blockSizeVertical*15,
                  width: SizeConfig.blockSizeHorizontal*70,
                  //color: Colors.red,
                  child: fetchProductToShowTopForSweep(),
                ),
              ),

            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2,),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                showRelatedItems(img),
                showRelatedItems(img),
                showRelatedItems(img),
                showRelatedItems(img),
                //showRelatedItems(img)
                //showRelatedItems(img)
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*3,),
          Padding(
            padding:  EdgeInsets.only( left:SizeConfig.blockSizeHorizontal*5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    if(count>=1){
                      setState(() {
                        count--;
                      });
                    }
                  },
                  child: Container(
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
                    child: Text(count.toString(),style: TextStyle(color: Colors.black,fontSize: SizeConfig.blockSizeVertical*3,),),
                  ),
                ),
                //SizedBox(width: SizeConfig.blockSizeHorizontal*3,),
                GestureDetector(
                  onTap: (){
                    if(count>=1){
                      setState(() {
                        count++;
                      });
                    }
                  },
                  child: Container(
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
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal*1,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    color: Colors.green[700],
                    height:SizeConfig.blockSizeVertical*6,
                    width:SizeConfig.blockSizeHorizontal*28,
                    child:  Center(
                      child: Text('Buy Now',style: TextStyle(color: Colors.white,fontSize: SizeConfig.blockSizeVertical*2,),),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal*1,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    color: Colors.yellow[900],
                    height:SizeConfig.blockSizeVertical*6,
                    width:SizeConfig.blockSizeHorizontal*28,
                    child:  Center(
                      child: Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: SizeConfig.blockSizeVertical*2,),),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*3,)
        ],
      ):const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  Widget fetchProductToShow(){
    return  FutureBuilder<List<ModelOfProduct>>(
      future:repo.fetchProducts() ,
      builder: ( context, snapshot) {

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
    Widget fetchProductToShowTopForSweep(){
      return  FutureBuilder<List<ModelOfProduct>>(
        future:repo.fetchProducts() ,
        builder: ( context,  snapshot) {

          if(snapshot.hasData){
            return Swiper(
                control:  SwiperControl(color: Colors.black38),
                viewportFraction: 0.4,
                itemHeight: SizeConfig.blockSizeVertical*5,
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

      return  SizedBox(
        height: SizeConfig.blockSizeVertical*20,
        width: SizeConfig.blockSizeHorizontal*80,
        child: GestureDetector(
          onTap:(){
            setState(() {
              img=image;
            });
          },
          child: Card(
            elevation: 10,
            child:Image.network(image,fit: BoxFit.fill,),
          ),
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
    Widget fetchProductToShowRelatedItems(){
      return  FutureBuilder<List<ModelOfProduct>>(
        future:repo.fetchProducts() ,
        builder: ( context,  snapshot) {

          if(snapshot.hasData){
            return ListView.builder(

                scrollDirection: Axis.vertical,
                itemCount:snapshot.data!.length ,
                itemBuilder: (context,index){
                  return showRelatedItems(
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
    Widget showRelatedItems(String img1){
      return Padding(
        padding:  EdgeInsets.only(
            left:SizeConfig.blockSizeHorizontal*7,
            //right: SizeConfig.blockSizeHorizontal*30
        ),
        child: Container(
            height: SizeConfig.blockSizeVertical*41,
            width: SizeConfig.blockSizeHorizontal*60,
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
                child: Image.network(img1),
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
                padding:  EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*2,top: SizeConfig.blockSizeVertical*1.5),
                child: Text(map!['title'],style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.8,fontWeight: FontWeight.bold,color: Colors.orange),),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left:SizeConfig.blockSizeHorizontal*5,
                    top: SizeConfig.blockSizeVertical*1
                ),
                child: Row(
                  children: [
                    Text("$s${map!['variants'][0]['price'].toString()} ",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                    SizedBox(width:SizeConfig.blockSizeHorizontal*8),
                   // Text("IQD:",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),),
                   // SizedBox(width:SizeConfig.blockSizeHorizontal*1),
                  //  Text("${map!['variants'][0]['inventory_item_id'].toString()} ",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*1,),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(
                        left:SizeConfig.blockSizeHorizontal*2
                    ),
                    child: Container(
                      color: Colors.green,
                      height: SizeConfig.blockSizeVertical*6,
                      width: SizeConfig.blockSizeHorizontal*27,
                      child: const Center(
                        child: Text('Buy now',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*1,),
                  Container(
                    color: Colors.yellow[900],
                    height: SizeConfig.blockSizeVertical*6,
                    width: SizeConfig.blockSizeHorizontal*27,
                    child: const Center(
                      child: Text('Add to cart',style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      );
    }
}
