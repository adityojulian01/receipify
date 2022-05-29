// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:superapp/models/core/recipe.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:superapp/widgets/ingredient_tile.dart';
// import 'package:superapp/widgets/instruction_tile.dart';

// class RecipeDetailPage extends StatefulWidget {
//   final Recipe data;
//   RecipeDetailPage({required this.data});

//   @override
//   _RecipeDetailPageState createState() => _RecipeDetailPageState();
// }

// class _RecipeDetailPageState extends State<RecipeDetailPage>
//     with TickerProviderStateMixin {
//   late TabController _tabController; // for selecting through tabs (I THINK)
//   late ScrollController _scrollController; // for selecting through scroll (IDK)

//   @override
//   void initState() {
//     // BLOM NGERTI!!!
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _scrollController = ScrollController(initialScrollOffset: 0.0);
//     _scrollController.addListener(() {
//       changeAppBarColor(_scrollController);
//     });
//   }

//   Color appBarColor = Colors.transparent;

//   changeAppBarColor(ScrollController scrollController) {
//     if (scrollController.position.hasPixels) {
//       if (scrollController.position.pixels > 2.0) {
//         setState(() {
//           appBarColor = Theme.of(context).primaryColor;
//         });
//       }
//       if (scrollController.position.pixels <= 2.0) {
//         setState(() {
//           appBarColor = Colors.transparent;
//         });
//       }
//     } else {
//       setState(() {
//         appBarColor = Colors.transparent;
//       });
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60),
//         child: AnimatedContainer(
//           color: appBarColor,
//           duration: Duration(milliseconds: 200),
//           child: AppBar(
//             backgroundColor: Colors.transparent,
//             brightness: Brightness.dark,
//             elevation: 0,
//             centerTitle: true,
//             title: const Text('Search Recipe',
//                 style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16)),
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//         ),
//       ),
//       body: ListView(
//         controller: _scrollController,
//         shrinkWrap: true,
//         padding: EdgeInsets.zero,
//         physics: BouncingScrollPhysics(),
//         children: [
//           // SECTION 1 - RECIPE IMAGE
//           GestureDetector(
//             child: Container(
//               height: 280,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(widget.data.photo), fit: BoxFit.cover)),
//               child: Container(
//                 decoration: BoxDecoration(color: Colors.black),
//                 height: 280,
//                 width: MediaQuery.of(context).size.width,
//               ),
//             ),
//           ),
//           // SECTION 2 - RECIPE INFORMATION
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(top: 20, bottom: 30, left: 16, right: 16),
//             color: Colors.grey[200],
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // RECIPE SERVINGS AND TIME
//                 Row(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/icons/serving.svg',
//                       color: Colors.black,
//                       width: 16,
//                       height: 16,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 5),
//                       child: Text(
//                         widget.data.servings,
//                         style: TextStyle(color: Colors.black, fontSize: 12),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Icon(Icons.alarm, size: 16, color: Colors.black),
//                     Container(
//                       margin: EdgeInsets.only(left: 5),
//                       child: Text(
//                         widget.data.time,
//                         style: TextStyle(color: Colors.black, fontSize: 12),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // RECIPE TITLE
//                 Container(
//                   margin: EdgeInsets.only(bottom: 0, top: 16),
//                   child: Text(
//                     widget.data.title,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         fontFamily: 'MontserratBold'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // TAB BAR (INGREDIENTS | TUTORIAL)
//           Container(
//             height: 60,
//             width: MediaQuery.of(context).size.width,
//             color: Colors.grey[400],
//             child: TabBar(
//               controller: _tabController,
//               onTap: (index) {
//                 setState(() {
//                   _tabController.index = index;
//                 });
//               },
//               labelColor: Colors.black,
//               unselectedLabelColor: Colors.black.withOpacity(0.3),
//               labelStyle: TextStyle(
//                   fontFamily: 'MontserratBold', fontWeight: FontWeight.w500),
//               indicatorColor: Colors.black,
//               tabs: [
//                 Tab(
//                   text: 'Ingredients',
//                 ),
//                 Tab(
//                   text: 'Instructions',
//                 ),
//               ],
//             ),
//           ),
//           // INDEXEDSTACK BASED ON TABBAR INDEX
//           IndexedStack(
//             index: _tabController.index,
//             children: [
//               // INGREDIENTS
//               ListView.builder(
//                 shrinkWrap: true,
//                 padding: EdgeInsets.zero,
//                 itemCount: widget.data.ingredients.length,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return IngridientTile(
//                     data: widget.data.ingredients[index],
//                   );
//                 },
//               ),
//               // Tutorials
//               ListView.builder(
//                 shrinkWrap: true,
//                 padding: EdgeInsets.zero,
//                 itemCount: widget.data.tutorial.length,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return InstructionTile(
//                     data: widget.data.tutorial[index],
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp/models/core/recipe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp/models/core/recipeapi.dart';
import 'package:superapp/models/core/recipedetail_spoon.dart';
import 'package:superapp/widgets/ingredient_tile.dart';
import 'package:superapp/widgets/instruction_tile.dart';

class RecipeDetailPage extends StatefulWidget {
  final RecipeDetail data;
  RecipeDetailPage({required this.data});

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController; // for selecting through tabs (I THINK)
  late ScrollController _scrollController; // for selecting through scroll (IDK)

  @override
  void initState() {
    // BLOM NGERTI!!!
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _scrollController.addListener(() {
      changeAppBarColor(_scrollController);
    });
  }

  Color appBarColor = Colors.transparent;

  changeAppBarColor(ScrollController scrollController) {
    if (scrollController.position.hasPixels) {
      if (scrollController.position.pixels > 2.0) {
        setState(() {
          appBarColor = Theme.of(context).primaryColor;
        });
      }
      if (scrollController.position.pixels <= 2.0) {
        setState(() {
          appBarColor = Colors.transparent;
        });
      }
    } else {
      setState(() {
        appBarColor = Colors.transparent;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AnimatedContainer(
          color: appBarColor,
          duration: Duration(milliseconds: 200),
          child: AppBar(
            backgroundColor: Colors.transparent,
            brightness: Brightness.dark,
            elevation: 0,
            centerTitle: true,
            title: const Text('Search Recipe',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 16)),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      body: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: [
          // SECTION 1 - RECIPE IMAGE
          GestureDetector(
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(widget.data.image.toString()),
                fit: BoxFit.cover,
              )),
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                height: 280,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          // SECTION 2 - RECIPE INFORMATION
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 20, bottom: 30, left: 16, right: 16),
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // RECIPE SERVINGS AND TIME
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/serving.svg',
                      color: Colors.black,
                      width: 16,
                      height: 16,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        widget.data.servings.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.alarm, size: 16, color: Colors.black),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        widget.data.readyInMinutes.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                // RECIPE TITLE
                Container(
                  margin: EdgeInsets.only(bottom: 0, top: 16),
                  child: Text(
                    widget.data.title.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ],
            ),
          ),
          // TAB BAR (INGREDIENTS | TUTORIAL)
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[400],
            child: TabBar(
              controller: _tabController,
              onTap: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black.withOpacity(0.3),
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Ingredients',
                ),
                Tab(
                  text: 'Instructions',
                ),
              ],
            ),
          ),
          // INDEXEDSTACK BASED ON TABBAR INDEX
          IndexedStack(
            index: _tabController.index,
            children: [
              // INGREDIENTS
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: widget.data.extendedIngredients?.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return IngridientTile(
                    data: widget.data.extendedIngredients![index],
                  );
                },
              ),
              // Tutorials
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: widget.data.analyzedInstructions![0].steps!.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InstructionTile(
                    data: widget
                        .data.analyzedInstructions![0].steps![index].step!,
                    index: (index + 1).toString(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
