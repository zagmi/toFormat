library to_format;

import 'dart:math';

class ToFormat {
  static Map<String, dynamic> defaultFormat = {
    'decimalSeparator': '.',
    'groupSeparator': ',',
    'groupSize': 3,
    'secondaryGroupSize': 0,
    'fractionGroupSeparator': null,
    'fractionGroupSize': 0,
  };

  num _value;
  late Map<String, dynamic> format;

  ToFormat(this._value, {Map<String, dynamic>? format})
      : format = {...defaultFormat, ...(format ?? {})};

  num get value => _value;

  String _toFixed(int fractionDigits, {int? round}) {
    if (_value.isNaN || _value.isInfinite) return _value.toString();
    if (round != null) {
      _value =
          (_value * pow(10, fractionDigits)).round() / pow(10, fractionDigits);
    }
    return _value.toStringAsFixed(fractionDigits);
  }

  String toFormat({int? dp, int? rm, Map<String, dynamic>? fmt}) {
    if (_value.isNaN || _value.isInfinite) return _value.toString();
    List<String> arr = _toFixed(dp ?? 0, round: rm ?? 0).split('.');
    String intp = arr[0];
    String fracp = arr.length > 1 ? arr[1] : '';
    String intd = _value.sign < 0 ? intp.substring(1) : intp;
    int nd = intd.length;

    String dsep = fmt?['decimalSeparator'] ?? format['decimalSeparator'];
    String gsep = fmt?['groupSeparator'] ?? format['groupSeparator'];
    int gsize = fmt?['groupSize'] ?? format['groupSize'];
    int sgsize = fmt?['secondaryGroupSize'] ?? format['secondaryGroupSize'];
    String fgsep =
        fmt?['fractionGroupSeparator'] ?? format['fractionGroupSeparator'];
    int fgsize = fmt?['fractionGroupSize'] ?? format['fractionGroupSize'];

    if (gsize == 0) gsize = format['groupSize'];
    if (sgsize == 0) sgsize = format['secondaryGroupSize'];

    int g1, g2, i;
    if (sgsize > 0) {
      g1 = sgsize;
      g2 = gsize;
      nd -= g2;
    } else {
      g1 = gsize;
      g2 = sgsize;
    }

    if (g1 > 0 && nd > 0) {
      i = nd % g1;
      intp = intd.substring(0, i);
      for (; i < nd; i += g1) {
        intp += gsep + intd.substring(i, min(i + g1, nd));
      }
      if (g2 > 0) intp += gsep + intd.substring(i);
      if (_value.sign < 0) intp = '-$intp';
    }

    if (fgsize == 0) fgsize = format['fractionGroupSize'];
    if (fgsize > 0) {
      fracp = RegExp('\\d{$fgsize}\\B')
              .allMatches(fracp)
              .map((m) => m[0]! + fgsep)
              .join() +
          fracp.substring(max(fracp.length - fgsize, 0));
    }

    return fracp.isNotEmpty ? '$intp$dsep$fracp' : intp;
  }
}
