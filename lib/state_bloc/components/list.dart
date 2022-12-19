import 'package:flutter/material.dart';
import 'package:state_research/models/detail.dart';
import 'package:state_research/widgets/content.dart';

class BlocListWidget extends StatelessWidget {
  final List<Data>? data;
  const BlocListWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data?.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: StateContents(data: data?[index]),
        );
      },
    );
  }
}
