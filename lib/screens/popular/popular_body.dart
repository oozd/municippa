import 'package:flutter/material.dart';
import 'package:municippa/posts/image_post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:municippa/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:municippa/widgets/bottom_loader.dart';
import 'package:municippa/widgets/post_widget.dart';

class PopularBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text(
              "Popular Posts",
            )
        )
    );
  }
}
