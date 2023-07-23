# To Format

Adds a `toFormat` instance method to `num`.

## Install

```sh
$ dart pub add to_format
```

## Use

```dart
import 'package:to_format/to_format.dart';

void main() {
  num x = 1234567.89;
  String formatted = x.toFormat(dp: 2, fmt: {'groupSeparator': ' '});
  print(formatted); // 1 234 567.89
}
```

## Licence

[BSD](LICENCE)
