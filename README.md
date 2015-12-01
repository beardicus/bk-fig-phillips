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

## Example Output

These are shrunk by roughly half:

![figure-001.png](/../examples/figure-001.png?raw=true 'Figure 1')
![figure-002.png](/../examples/figure-002.png?raw=true 'Figure 2')

## Photoshop Script

I've included `crop-coords.jsx` a Photoshop script that I made to help me efficiently mark the crop coordinates for each figure and copy them over to the makefile. The basic operation is that you pull out 4 guides to create the bounding box of your crop, then run the script. You'll then have your `x`, `y`, `width`, and `height` information copied to the clipboard.

The easiest way to trigger the script is to record an action that runs the script. Then you just put your action pallet into "button mode" and click away.

## Why Use Make?

Please see [Mike Bostock's article, _Why Use Make_](http://bost.ocks.org/mike/make/). I mostly like the idea that – when I change my mind later about the settings I want to use (perhaps different level adjustments, or sharpening) – I can easily rerun the whole process, rather than heaping one lossy Photoshop batch job on top of another.
