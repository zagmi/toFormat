## To Format

<div style="display: flex; justify-content: center;">

  <img src="https://img.shields.io/pub/v/to_format?color=green">

  <img src="https://img.shields.io/pub/points/to_format">

  <img src="https://img.shields.io/pub/popularity/to_format?color=green">

  <img src="https://img.shields.io/badge/maintenance%20status-actively%20developed-brightgreen">

  <img src="https://img.shields.io/badge/coverage-92%25-orange">

</div>
<br/>

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
