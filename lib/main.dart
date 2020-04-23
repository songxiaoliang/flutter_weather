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
      title: 'Love天气',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Love天气'),
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

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    weatherModel.requestWeatherInfo();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherModel>(
        create: (context) => weatherModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Consumer<WeatherModel>(
            builder: (context, model, child) {
              return model.weatherDetailModel != null ? (
                ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => WeatherInfoItem(
                    title: model.weatherDetailModel.basic.location, 
                    icon: "今天",
                    temperature: "${model.weatherDetailModel.nowInfo.tmp}℃",
                    weatherDesc: model.weatherDetailModel.nowInfo.condtxt,
                    updateTime: "最后更新: ${model.weatherDetailModel.updateInfo.loc}",
                  ),
                )
              ): Container();
            },
          ),
          floatingActionButton: Consumer<WeatherModel>(
            builder: (context, model, child) {
              return FloatingActionButton(
                tooltip: '添加城市',
                child: Icon(Icons.add),
                onPressed: () => model.addCity(),
              );
            },
          )
        )
    );
  }
}
