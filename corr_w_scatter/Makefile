all: corr_w_scatter.js data.json

corr_w_scatter.js: corr_w_scatter.coffee
	coffee -c corr_w_scatter.coffee

data.json: main.R
	~/bin/r CMD BATCH main.R

clean:
	*.Rout
