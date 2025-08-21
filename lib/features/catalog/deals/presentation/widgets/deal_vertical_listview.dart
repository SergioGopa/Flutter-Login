import 'package:eisty/features/catalog/deals/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/deal.dart';

class DealVerticalListview extends StatefulWidget {
  final List<Deal> deals;
  final String? title;
  final VoidCallback? loadNextPage;
  final bool isLastPage;

  const DealVerticalListview(
      {super.key,
      required this.deals,
      this.title,
      this.loadNextPage,
      this.isLastPage = false});

  @override
  State<DealVerticalListview> createState() => _DealVerticalListviewState();
}

class _DealVerticalListviewState extends State<DealVerticalListview> {
  // final scrollController = ScrollController();
  // bool _isRequestInProgress = false;
  // 

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(
  //     () {
  //       if (widget.loadNextPage == null) return;

  //       if ((scrollController.position.pixels + 200) >=
  //           scrollController.position.maxScrollExtent) {
  //         if (_isRequestInProgress) return;

  //         _isRequestInProgress = true;
  //         widget.loadNextPage!();

  //         if (widget.isLastPage) {
  //           scrollController.animateTo(0,
  //               duration: const Duration(
  //                 milliseconds: 400,
  //               ),
  //               curve: Curves.easeInOut);
  //         }

  //         Future.delayed(const Duration(milliseconds: 500), () {
  //           _isRequestInProgress = false;
  //         });
  //       }
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final visibleDeals = widget.deals.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          _Title(
            title: widget.title,
          ),
        if(widget.deals.length >5)
          Row(
            children: [
              SizedBox(width: 10,),
              Text('Para ti hoy!!',style: GoogleFonts.workSans(color: Color(0xFFFDFDFD), fontSize: 20),overflow: TextOverflow.ellipsis,maxLines: 1,),
              Spacer(),
              TextButton(onPressed: () {  
              }, 
              child: const Text('See all .. ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
            ],
          ),

        ...visibleDeals.map(
          (deal) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 3),
              child: DealPromoCard(deal: deal, index: widget.deals.indexOf(deal)),
            );
          },
        ),

        // Expanded(
        //     child: ListView.builder(
        //   controller: scrollController,
        //   scrollDirection: Axis.vertical,
        //   physics: const BouncingScrollPhysics(),
        //   itemCount: widget.deals.length,
        //   itemBuilder: (context, index) {
        //     return DealPromoCard(
        //       deal: widget.deals[index],
        //       index: index,
        //     );
        //   },
        // ))
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  const _Title({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Spacer(),
          if (title != null)
            Text(title!,
                style: GoogleFonts.montserratAlternates(
                    color: Color(0xFFFCD73D),
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          const Spacer(),
        ],
      ),
    );
  }
}
