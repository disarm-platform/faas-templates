# faas-templates
Templates for new geospatial OpenFaas functions in R and Python:

Templates available:
- `python-geospatial` (includes `R` installation for use with `disarm-gears` package)
- `r-geospatial`

Both include some useful wrapper code.

## Create new function

1. `faas template pull https://github.com/locational/faas-templates.git`
2. `faas new --lang <template-name> <function-name>`


## Updating the templates

Either `rm -rf template`, or `faas template pull https://github.com/locational/faas-templates.git --overwrite`.

