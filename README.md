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

## Debug function

If you need to debug/test something that relies on `index.py` or `preprocess_helpers.py`, easiest seems to be to run `faas build`, and then check the repo's folder - there should be a new ` build` folder. Inside there is a copy of the code in a more complete form, ready to run. Don't make changes inside the `build` folder though, they will be lost: just edit the normal source and rerun `faas build`. (If the Docker build step is taking any time, you should able to kill the command, and still find the `build` folder updated).


## Updating the templates

Either `rm -rf template`, or `faas template pull https://github.com/locational/faas-templates.git --overwrite`.

Check the `VERSION` file.
