import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyOrderTrackerPage extends StatefulWidget {
  const MyOrderTrackerPage({super.key});

  @override
  State<MyOrderTrackerPage> createState() => _MyOrderTrackerPageState();
}

class _MyOrderTrackerPageState extends State<MyOrderTrackerPage> {
  String firstV='first';
  List<String> dropdos=['first','second','thired'];
  final ImagePicker picker=ImagePicker();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController pricecontroller=TextEditingController();
  XFile? image;

  Future getImage() async{
    var image=await picker.pickImage(source: ImageSource.camera);
    setState(() {
     // image=image.path;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.only(left: 24,right: 23),
        child: Column(  
          children: [
            SizedBox(height: 20,)
            ,
            SizedBox(height: 30,),
          //  image==null?
            Center(child:Material(
              elevation: 5,
              child: Container(  
                width: 150,height: 150,
                decoration: BoxDecoration(
                 // image: DecorationImage(image: AssetImage(assetName)),
                  border: Border.all(color:Colors.black),
                  borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                    onPressed: (){
                      getImage();
                    },
                    icon: Icon(Icons.camera_alt_outlined,color:Colors.black )),
              ),
            ),)
            //:Image.file(image,fit: BoxFit.cover,),
            ,
            Container(  
              
              padding: EdgeInsets.only(left: 13,right: 13),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color:Colors.black,width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(  
                controller: namecontroller,
                decoration: InputDecoration(
                  hintText: 'enter image name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text('Item price'),
            Container(  
              
              padding: EdgeInsets.only(left: 13,right: 13),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color:Colors.black,width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(  
                controller: pricecontroller,
                decoration: InputDecoration(
                  hintText: 'enter item price',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                   )
                ),
              ), 
            ),
            Container(  
              child: DropdownButton<String>(
                value: firstV,
                items: dropdos.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value));
              }).toList(), 
              onChanged: (String? value){
                setState(() {
                  firstV=value!;
                });
              }),
            )
          ],
        ),
      )),
    );
  }
}