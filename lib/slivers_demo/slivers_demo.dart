import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './sliver_header.dart';

class SliversDemo extends StatefulWidget {
  const SliversDemo({Key? key}) : super(key: key);

  @override
  _SliversDemoState createState() => _SliversDemoState();
}

class _SliversDemoState extends State<SliversDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final List<String> _names = [];

  _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF2F8),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            snap: false,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: null,
            ),
            title: Text(
              'Slivers Demo',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.deepOrange,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  "https://images.unsplash.com/photo-1603785608232-44c43cdc0d70?ixlib=rb-1.2.1&"
                  "ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDY4fEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&"
                  "fit=crop&w=500&q=60",
                  fit: BoxFit.cover),
            ),
          ),
          SliverHeader(
              title: 'Sliver Persistent Header 1',
              backgroundColor: Colors.pink),
          SliverHeader(
              title: 'Sliver Persistent Header 2',
              backgroundColor: Colors.purpleAccent),
          SliverHeader(
              title: 'Sliver Persistent Header 3',
              backgroundColor: Colors.blueGrey),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate([
              _buildFixedList(Colors.cyan, "Cyan"),
              _buildFixedList(Colors.amber, "Amber"),
              _buildFixedList(Colors.blueGrey, "Blue Grey"),
              _buildFixedList(Colors.deepOrange, "Deep Orange"),
            ]),
            itemExtent: 40,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text('Add Name'),
                      _buildNameField(),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(onPressed: _submit, child: Text('Submit'))
                    ],
                  ),
                ),
              )
            ]),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                padding: EdgeInsets.all(8),
                color: _randomColor(index),
                child: Center(
                  child: Text(
                    _names[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              );
            },
                childCount: _names.length),
          )
        ],
      ),
    );
  }

  _buildFixedList(MaterialColor backgroundColor, String title) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  _buildNameField() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
          labelText: 'Name',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            gapPadding: 0.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            gapPadding: 0.0,
          ),
        ),
        validator: (input) {
          if (input!.isEmpty) {
            return "Name is required";
          }
          return null;
        },
        onSaved: (input) {
          setState(() {
            _names.add(input!);
          });
        },
      ),
    );
  }

  Color _randomColor(int index) {
    if (index % 4 == 0) {
      return Colors.blue;
    } else if (index % 4 == 1) {
      return Colors.orange;
    }else if(index % 4 == 2){
      return Colors.cyan;
    }
    return Colors.red;
  }
}
