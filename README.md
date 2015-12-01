# Figures from _Beekeeping_, by Everett Franklin Phillips, Ph.D.

This is a makefile that downloads [_Beekeeping_](https://archive.org/details/beekeepingdiscus01phil) from the Internet Archive, extracts relevant pages, crops and rotates all the figures, cleans them up, and exports as optimized PNG files.

## Installing and Running

You'll need to install [ImageMagick](http://www.imagemagick.org/script/index.php) with jp2 (JPEG-2000) support. On the Mac, using homebrew, you can run the following: `brew install imagemagick --with-jp2`. You'll also need `unzip`, `optipng`, `make`, and `curl` available.

The use of `mkdir -p` may cause issues on Windows, I hear. Sorry.

After that's sorted:

1. `git clone https://github.com/beardicus/bk-fig-phillips.git`
2. `cd bk-fig-phillips`
3. `make`

You'll end up with a bunch of `figure-###.png` PNGs in the `out` folder.
