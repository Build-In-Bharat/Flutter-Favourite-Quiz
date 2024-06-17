import 'package:flutter/material.dart';


Text headingH1({required String heading, required ThemeData theme}) {
    return Text(
      heading,
      style: theme.textTheme.headlineSmall
    );
  }