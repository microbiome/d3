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

Convert your data matrix into JSON format in R, and save this in a file named 'data.json' ([example](main.R)).

Copy the following files in the same directory with the data.json file
that you generated at the first step:
[corr_w_scatter.css](corr_w_scatter.css);
[corr_w_scatter.js](corr_w_scatter.js); [d3.js](d3.js);
[index.html](index.html)

Navigate to the working directory and open the index.html file.


Possibly needed
---------------

Install dependencies: 
sudo apt-get install coffeescript

If necessary, produce the file 'corr_w_scatter.js' with:
coffee -c corr_w_scatter.coffee



