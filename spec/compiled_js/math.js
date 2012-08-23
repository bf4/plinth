(function() {

  Math.fib = function(n) {
    var s;
    s = 0;
    if (n === 0) {
      return s;
    }
    if (n === 1) {
      return s += 1;
    } else {
      return Math.fib(n - 1) + Math.fib(n - 2);
    }
  };

  Math.uuid = function() {
    var chars, digit, r, random, uuid, _i, _results;
    chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
    uuid = new Array(36);
    random = 0;
    _results = [];
    for (digit = _i = 0; _i <= 36; digit = ++_i) {
      switch (digit) {
        case 8:
        case 13:
        case 18:
        case 23:
          _results.push(uuid[digit] = '-');
          break;
        case 14:
          _results.push(uuid[digit] = '4');
          break;
        default:
          if (random <= 0x02) {
            random = 0x2000000 + (Math.random() * 0x1000000) | 0;
          }
          r = random & 0xf;
          random = random >> 4;
          uuid[digit] = chars[digit === 19 ? (r & 0x3) | 0x8 : r];
          _results.push(uuid.join(''));
      }
    }
    return _results;
  };

}).call(this);
