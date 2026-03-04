import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/news_response.dart';

class Articleitem extends StatelessWidget {
  Articles article;

  Articleitem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF171717)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
                article.urlToImage ?? '',
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
              ),
          ),
          Text(
            article.title ?? '',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF171717),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'By : ${article.author ?? ''}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA0A0A0),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Text(
                article.publishedAt?.substring(0, 10) ?? '',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFA0A0A0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
