import 'package:flutter/material.dart';

class DetailBuilders extends StatefulWidget {
  const DetailBuilders({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  State<DetailBuilders> createState() => _DetailBuildersState();
}

class _DetailBuildersState extends State<DetailBuilders> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(widget.label)),
        Expanded(flex: 3, child: Text(widget.value)),
      ],
    );
  }
}
