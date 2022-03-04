jQuery(function() {

  // var prng = new Xorshift03();
  var rand_words, rand_values = [];

  var size = 600;
  var p = new PNGlib(size, size, 256); // constructor takes height, weight and color-depth
  var background = p.color(0, 0, 0, 0); // set the background transparent

  var i, j, k, l, w;
  for (i = 0; i < size; i++) {
    rand_words = sjcl.random.randomWords(size);
    // convert random words to floats (0..1), by multiplying the unsigned value by 2^-32
    for (l = 0; l < rand_words.length; l++) {
      rand_values.push((rand_words[l] >>> 0) * 2.3283064365386963e-10);
    }
    for (j = 0; j < size; j++) {
      j = Math.floor(rand_values.pop() * size);
      k = Math.floor(rand_values.pop() * size);
      p.buffer[p.index(j, k)] = p.color(0x00, 0x00, 0x00);
    }
  }

  $('#main').append($('<img src="data:image/png;base64,'+p.getBase64()+'">'));

});
