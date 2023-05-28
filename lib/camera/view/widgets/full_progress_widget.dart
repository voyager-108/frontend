import 'package:flutter/material.dart';

class FullProgressWidget extends StatelessWidget {
  const FullProgressWidget({super.key});

  // TODO make it show the progress too
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
                    Navigator.pop(context);
                  },
                  child: const Text("На главную"))
            ],
          ),
        ),
      );
}
