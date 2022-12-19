import 'package:flutter/material.dart';

class GetXEmptyWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const GetXEmptyWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Fetch Data'),
        ),
        const Center(
          child: Text('Press the button to fetch data'),
        ),
      ],
    );
  }
}
