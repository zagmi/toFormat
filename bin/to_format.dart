import 'package:to_format/to_format.dart';

void main() {
  final value = 123456789.123456789;
  final formatter = ToFormat(value, format: {
    'decimalSeparator': ',',
    'groupSeparator': '.',
    'groupSize': 3,
    'fractionGroupSeparator': '-',
    'fractionGroupSize': 2,
  });
  final formattedValue = formatter.toFormat(dp: 2, rm: 0);
  print(formattedValue); 
}
