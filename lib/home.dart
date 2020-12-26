import 'package:flutter/material.dart';
import 'package:flutterdesign/model/listvalues.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = PageController(viewportFraction: 1 / 1.2);
  int currentPageValue = 0;
  MaterialColor backcolor = listofvalue[0].color;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page.toInt();
        backcolor = listofvalue[currentPageValue].color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [backcolor[300], backcolor[800]])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topWidget(),
              SizedBox(
                height: 60,
              ),
              centerwidget(),
              bottomlist(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget centerwidget() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: backcolor[300],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: backcolor[600], spreadRadius: 5),
                ]),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: backcolor[300],
                radius: 20,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Hello, Pilojan",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Looks like feel good",
              style: TextStyle(fontSize: 14, color: Colors.white60),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "You have 3 Tasks to do today",
              style: TextStyle(fontSize: 14, color: Colors.white60),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "TODAY:DECEMBER 26,2020",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    ));
  }

  Widget topWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {}),
          Text("TODO"),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget bottomlist(PageController controller) {
    return Expanded(
        child: PageView.builder(
            itemCount: listofvalue.length,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return itemcard(listofvalue[index], context);
            }));
  }

  Widget itemcard(ListValues listValues, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.person),
                Expanded(
                    child: Center(
                  child: Image.asset(listValues.imagepath),
                )),
                Text(
                  "${listValues.taskcount} Tasks",
                  style: TextStyle(color: Colors.black45, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  listValues.value,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                percentagebar(listValues, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  percentagebar(listValue, BuildContext context) {
    double sizeofwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 5,
              width: sizeofwidth,
              child: Container(
                color: Colors.grey,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(listValue.color),
                  value: listValue.percentage / sizeofwidth * 3,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "${listValue.percentage} %",
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
    );
  }
}
