# faas-templates
Templates for new geospatial OpenFaas functions in R and Python:

Templates available:
- `python-geospatial`
- `r-geospatial`

Both include some useful wrapper code.

## Create new function

1. `faas template pull https://github.com/locational/faas-templates.git`
2. `faas new --lang <template-name> <function-name>`

For a single-function repo, you can rename the `<function-name>.yml` file to `stack.yml`.


## Updating the templates

Either `rm -rf template`, or `faas template pull https://github.com/locational/faas-templates.git --overwrite`.

Check the `VERSION` file.
