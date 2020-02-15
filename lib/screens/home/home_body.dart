import 'package:flutter/material.dart';
import 'package:municippa/screens/popular/popular.dart';
import 'package:municippa/screens/recent/recent.dart';
import 'package:municippa/screens/near_me/near_me.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:municippa/services/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municippa/services/db.dart';

import 'package:municippa/bloc/bloc.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser>(context);
    //TODO: check user state

    return MultiBlocProvider(
      providers: [

        BlocProvider<RecentPostBloc>(
          create: (context) =>
          RecentPostBloc(db: DbService())..add(FetchRecent()),
        ),

        BlocProvider<PopularPostBloc>(
          create: (context) =>
          PopularPostBloc(db: DbService())..add(FetchPopular()),
        )
      ],

      child: Column(
        children: <Widget>[
          TabBar(

            tabs: [
              Tab(text: "Popular"),
              Tab(text: "Recent" ),
              Tab(text: "Near Me"),
            ],
            labelColor: Colors.black,

          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                Popular(),
                Recent(),
                NearMe(),
              ],
            ),
          )
        ],
      ),
    );
  }
}