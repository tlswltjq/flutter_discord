
import 'package:flutter/material.dart';
import 'package:flutter_discord/domain/Channel.dart';

class ChannelList extends StatelessWidget{
  final List<Channel>? channelList;

  ChannelList({this.channelList});

  @override
  Widget build(BuildContext context){
    if (channelList == null || channelList!.isEmpty){
      return Center(child: Text('No channel available :('),);
    }

    return ListView.builder(
      itemCount: channelList!.length,
      itemBuilder: (context, index){
        return ListTile(title: Text(channelList![index].name),);
      },
    );
  }
}