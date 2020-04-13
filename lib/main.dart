import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather/model/WeatherModel.dart';
import 'package:flutter_weather/components/weather/WeatherInfoItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '明日天气',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: '明日天气'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherModel>(
        create: (context) => WeatherModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => WeatherInfoItem(
              title:"昨日", 
              icon: "昨日",
              location: "东城区/北京",
              temperature: "5~12",
              weatherDesc: "多云转晴",
              updateTime: "最后更新: 1月21号",
            ),
          ),
          floatingActionButton: Consumer<WeatherModel>(
            builder: (context, model, child) {
              return FloatingActionButton(
                tooltip: '添加城市',
                child: Icon(Icons.add),
                onPressed: () => model.requestWeatherInfo(),
              );
            },
          )
        )
    );
  }
}
