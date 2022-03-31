import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GridViewBean.dart';
import 'log_utils.dart';

import 'GridViewItemWidget.dart';


main() {
  runApp(MaterialApp(
    home: GridViewDemoPage(),
  ));
}

///代码清单
class GridViewDemoPage extends StatefulWidget {
  @override
  _GridViewDemoPageState createState() => _GridViewDemoPageState();
}

class _GridViewDemoPageState extends State<GridViewDemoPage> {
  //数据源
  List<GridBean> _list = [];

  @override
  void initState() {
    super.initState();

    GridBean gridBean = new GridBean(title: "XJTLU");
    GridBean gridBean2 = new GridBean(title: "男生");
    GridBean gridBean3 = new GridBean(title: "女生");
    GridBean gridBean4 = new GridBean(title: "ics专业");
    GridBean gridBean5 = new GridBean(title: "20岁");
    GridBean gridBean6 = new GridBean(title: "文星公寓");
      _list.add(gridBean);
      _list.add(gridBean2);
    _list.add(gridBean3);
    _list.add(gridBean4);
    _list.add(gridBean5);
    _list.add(gridBean6);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Who's here"),
        actions: [
          TextButton(
            onPressed: () {
              //获取完成的数据
              //获取选中的数据
              List<String> selectList = [];

              //筛选数据
              _list.forEach((GridBean element) {
                //选中标识
                if(element.isSelect){
                  selectList.add(element.title);
                }
              });

              LogUtils.e("${selectList.toString()}");

            },
            child: Text(
              "确定我的tag",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: GridView.builder(
        //子Item的个数
        itemCount: _list.length,
        //子布局构建器
        itemBuilder: (BuildContext context, int index) {
          //取出每个数据
          GridBean bean = _list[index];

          return GridViewItemWidget(bean:bean);
        },
        //子布局排列方式
        //按照固定列数来排列
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //主方向的Item间隔 竖直方向
          mainAxisSpacing: 12,
          //次方向的Item间隔
          crossAxisSpacing: 12,
          //子Item 的宽高比
          childAspectRatio: 2.1,
          //每行4列
          crossAxisCount: 4,
        ),
      ),
    );
  }
}