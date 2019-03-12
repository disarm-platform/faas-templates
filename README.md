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


## Versioning the templates

This is important, so that any functions built on top of them are aware of the version they were built against.

There is a `set_version` script in the root. It might need `chmod +x set_version` to run it.

### Get version
Run without any arguments to get the content of the VERSION file: i.e. `./set_version`

### Set version
Run with either a `v0.0.1` or `0.0.1` style argument, to set the current version: e.g `./set_version v0.0.1`

 This will:
1. Update the VERSION file in the main repo
2. Find and update all the TEMPLATE_VERSION files in the `template` folders
3. Commit these changes
4. Add a matching `git tag`