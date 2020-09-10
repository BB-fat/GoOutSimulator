import 'package:flutter/material.dart';

import 'content/form_preview.dart';
import 'content/processing_form.dart';
import 'content/view_process.dart';

class PageResult extends StatefulWidget {
  final Map<String,String> data;

  PageResult(this.data);

  @override
  _PageResultState createState() => _PageResultState();
}

class _PageResultState extends State<PageResult>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = ["处理表单", "表单预览", "查看流程"];

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            TabBar(
              controller: _tabController,
              labelColor: Color(0xff32a0db),
              unselectedLabelColor: Color(0xff8a8a8a),
              indicatorColor: Color(0xff32a0db),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              tabs: _tabs
                  .map((e) => Tab(
                text: e,
              ))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ProcessingForm(widget.data),
                  FormPreview(),
                  ViewProcess(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
