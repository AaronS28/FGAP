import 'package:fgap/models/projectItemModel.dart';
import 'package:flutter/material.dart';

class ProjectHistorySummaryList extends StatefulWidget{
  ProjectHistorySummaryList({Key key, this.title, this.projectItems}) : super(key: key);
  final String title;
  final List<ProjectItemModel> projectItems;

    @override
  _ProjectHistorySummaryListState createState() => _ProjectHistorySummaryListState();
}

class _ProjectHistorySummaryListState extends State<ProjectHistorySummaryList> {

  List<ProjectItemModel> _projectItems = List<ProjectItemModel>(); 

  @override
  void initState() {
    super.initState();
    _populateprojects(); 
  }

  void _populateprojects() {
      setState(() => {
        _projectItems = widget.projectItems
      });
  }
 
  Card _buildItemsForListView(BuildContext context, int index) {
   return Card(
     elevation: 0,    
     child: _cardItembody(_projectItems[index]),
    );
  }

  ListTile _cardItembody(ProjectItemModel projectItem){
    return ListTile(
        contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        title: Row(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Align(
                alignment: Alignment.center,
                heightFactor: 0.75,
                widthFactor: 0.75,
                child: Image.network(projectItem.imageUrl, width: 130, height: 130),
                ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  projectItem.taskName, 
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xFF194B9C),
                    fontWeight: FontWeight.bold, 
                  )
                ),
                SizedBox(height: 5),
                Text(
                  'Description', 
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xFF111111),
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(height: 5),
                Text(
                  projectItem.description, 
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xFF707070)
                  )
                ),              
              ],
            )
          ]
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5,0,5,0),
      height: (_projectItems.length <= 3)? _projectItems.length * 133.33 : 480.00,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.grey)],
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Colors.white, 
      ),
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        itemCount: _projectItems.length,
        itemBuilder: _buildItemsForListView,
        separatorBuilder: (BuildContext context, int index){
          return Container (
            padding:  EdgeInsets.fromLTRB(5,0,5,0),
            child: Divider(height: 1, color: const Color(0xFFC7C7C7), thickness: 2)
            ); 
          },
        )
    );
  }

}