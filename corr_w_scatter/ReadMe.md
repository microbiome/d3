Image of correlation matrix with a linked scatterplot
----------------------------------------------------------------------

See it in action [here](http://roihu.info/temp/D3/).

The left panel is an image of a correlation matrix, with blue = -1 and
red = +1.  Hover over a pixel to see the correponding correlation
value.  Click on a pixel to see the corresponding scatterplot on the
right. Based on a similar example by <a
href="http://www.biostat.wisc.edu/~kbroman/D3/corr_w_scatter">kbroman</a>.


How to use
----------

Converting example data matrix into JSON format with (change R path if needed):
~/bin/r CMD BATCH main.R

Open the index.html file.


Possibly needed
---------------

Install dependencies: 
sudo apt-get install coffeescript

If necessary, produce the file 'corr_w_scatter.js' with:
coffee -c corr_w_scatter.coffee



