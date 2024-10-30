import 'package:flutter/material.dart';
import 'package:unit_converter/first.dart';
import 'package:unit_converter/history.dart';
import 'package:unit_converter/power.dart';
import 'package:unit_converter/tempreture.dart';
import 'package:unit_converter/wight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> icons = [
    "asset/images/a.png",
    "asset/images/b.png",
    "asset/images/c.png",
    "asset/images/e.png"
  ];
  List<String> names =['Length','Power','Tempreture','Weight'];
  Color backcolor= Color(0xff121212); 
  List<data> History=[];

  

  @override
  Widget build(BuildContext context) {
    void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SizedBox(
            height: 600,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                children: [
                  Center(child: Text('History',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                  Container(
                    height: 450,
                    child: ListView.builder(
                      itemCount: History.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${History[index].unitfrom} -> ${History[index].unitto}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ),),
                          subtitle: Text('${History[index].value} -> ${History[index].result}',style: TextStyle(fontSize: 16,color: Colors.grey ),),
                          );
                    },),
                  ),
                ],
              )
            ),
          );
        });
  }

    return Scaffold(
      backgroundColor: backcolor,
     
      body: Padding(
        padding: EdgeInsets.only(right: 16, top: 48,left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            // Text("Welcome to",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Unit Converter",
                      style: TextStyle(
                          color: Color.fromRGBO(112, 103, 220, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
            Text(
              "get your desired unit",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w200),
            ),
                  ],
                ),
               IconButton(onPressed: (){
                setState(() {
                  _showModalSheet();
                });
               }, icon: Icon(Icons.history,color: Colors.white,size: 35,))
              ],
            ),

            Container(
             
              padding: EdgeInsets.symmetric(vertical: 100),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.8,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (index==0){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>First(items: History,)));

                        } else if(index==1){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>power(items: History)));
                        }else if(index==2){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>temp(items: History)));
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Wight(items: History)));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('${icons[index]}'),
                                    fit: BoxFit.cover),
                              ),
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${names[index]}',
                              style: TextStyle(
                                  color: Color.fromRGBO(112, 103, 220, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
