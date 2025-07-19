import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextRenderingHelper {
  // Tăng chất lượng text rendering
  static void enableHighQualityText() {
    // Bật subpixel rendering cho text
    RenderingFlutterBinding.ensureInitialized();
  }

  // Text widget với anti-aliasing tốt hơn
  static Widget smoothText(
    String text, {
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
  }) {
    return Text(
      text,
      style: (style ?? const TextStyle()).copyWith(
        // Cải thiện rendering
        height: 1.2, // Line height tốt hơn
        letterSpacing: 0.1, // Spacing nhẹ giữa các ký tự
        wordSpacing: 0.5, // Spacing giữa các từ
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      // Tối ưu rendering
      textScaleFactor: 1.0,
    );
  }

  // Rich text với anti-aliasing
  static Widget smoothRichText(
    List<TextSpan> spans, {
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return RichText(
      text: TextSpan(children: spans),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      textScaleFactor: 1.0,
    );
  }

  // Get optimized TextStyle
  static TextStyle getOptimizedTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily ?? 'Roboto',
      height: 1.2,
      letterSpacing: 0.1,
      wordSpacing: 0.5,
      // Cải thiện rendering quality
      decoration: TextDecoration.none,
      decorationThickness: 0,
    );
  }

  // Text với shadow nhẹ để làm mịn
  static Widget textWithShadow(
    String text, {
    required TextStyle style,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: style.copyWith(
        shadows: [
          Shadow(
            color: Colors.black.withValues(alpha: 0.01),
            blurRadius: 0.5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      textAlign: textAlign,
    );
  }
}
