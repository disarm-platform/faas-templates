# faas-templates
Templates for new geospatial OpenFaas functions in R and Python:

Templates available:
- `python-geospatial` (includes `R` installation for use with `disarm-gears` package)
- `r-geospatial`

Both include some useful wrapper code.

## Create new function

1. `faas template pull https://github.com/disarm-platform/faas-templates.git`
2. `faas new --lang <template-name> <function-name>`

## Adapt existing function

1. `faas template pull https://github.com/disarm-platform/faas-templates.git`
1. Edit `stack.yml` or equivalent, to change the `lang` property to one of the templates available.


## Updating the templates

Either `rm -rf template`, or `faas template pull https://github.com/disarm-platform/faas-templates.git --overwrite`.

