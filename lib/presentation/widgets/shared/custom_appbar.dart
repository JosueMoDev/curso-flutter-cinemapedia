import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final fontTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_outlined, 
                color: colorTheme.primary,
              ),
              const SizedBox(width: 5),
              Text('CinemapeliSv', style : fontTheme.titleMedium),
              const Spacer(),
              IconButton(
                onPressed:() {
                }, 
                icon: const Icon(Icons.search_outlined)
              )
            ],
          )
        ),
      )
    );
  }
}