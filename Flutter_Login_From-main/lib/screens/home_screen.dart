import 'package:amazon_clone/widgets/home_Carouse_image.dart';
import 'package:amazon_clone/widgets/home_address_box.dart';
import 'package:amazon_clone/widgets/home_deal_of_day.dart';
import 'package:amazon_clone/widgets/home_top_categories.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget {
  static const String routeName = '/home_screen';
  const Home_Screen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Increase the height to accommodate the profile picture and name
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                 height: 42,
                 margin: const EdgeInsets.only(left: 15),
                  child: Material(
                   borderRadius: BorderRadius.circular(7),
                   elevation: 1,
                   child: TextFormField(

                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: (){},
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 6),
                            child: Icon(Icons.search,color: Colors.black,size: 23,),
                            ),
                            
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(top: 10),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7),),
                        borderSide: BorderSide.none,
                      ),
                     enabledBorder:const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                          ),
                        borderSide: BorderSide(
                          color: Colors.black38,width: 1,
                          ),
                    ),
                    hintText: 'Search Shopping.in',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                   ),
                  ),
                ),
              ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic,color: Colors.black,size: 25,),
              ),
            ],
          ),
         
        ),
      ),
body:  SingleChildScrollView(
  child:   Column(
  
    children: [
  
      const AddressBox(),
  
      const SizedBox(height: 10,),
  
      TopCategories(),
  
       const SizedBox(height: 10,),
  
       const CarouselImage(),
  
       const DealOfDay(),
  
    ], 
  
  
  
  
  
  ),
),
    );
  }
}
