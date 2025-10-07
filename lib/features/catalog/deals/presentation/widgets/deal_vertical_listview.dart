import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/catalog/deals/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
              SizedBox(width: 15,),
              Text('Para ti hoy!!',
              style: AppTextStyles.t1Bold.copyWith(
                              color: AppColors.rosaPrimario
                            ),
              // style: GoogleFonts.workSans(color: Color(0xFFFDFDFD), fontSize: 20),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,),
              Spacer(),
              TextButton(onPressed: () {  
              }, 
              child: Text('See all .. ', 
              style: AppTextStyles.t1Bold.copyWith(
                              color: AppColors.rosaPrimario)),),
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
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
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  const _Title({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Spacer(),
          if (title != null)
            Text(title!,
                style:  AppTextStyles.h1Bold.copyWith(
                  color: colors.secondary,
                )),
          const Spacer(),
        ],
      ),
    );
  }
}
