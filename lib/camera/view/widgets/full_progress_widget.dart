import 'package:flutter/material.dart';

class FullProgressWidget extends StatelessWidget {
  const FullProgressWidget({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Дом осмотрен, отличная работа!",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(color: Colors.black87),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    // TODO uncomment the thing below
                    // Navigator.pop(context);
                  },
                  child: const Text("На главную"))
            ],
          ),
        ),
      );
}
