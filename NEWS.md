## version 3.0.0
- Breaking change: Rollback the `PercentageFit` parameter in the `CHull` and `MultiCHull` functions now accepts values ranging from 0 to 1. So revert to 1.x.y behavior. [jdurieux]
- Breaking change: Set `plottype='static'` as the default plot type [jdurieux]

## version 2.0.0
- Breaking change: The `PercentageFit` parameter in the `CHull` and `MultiCHull` functions now accepts values ranging from 0 to 100, representing percentages, as opposed to the previous range of 0 to 1, which represented percentages on a scale of 0% to 100% [jdurieux]
- A variable named `st` containing the scree test values was added to the output dataframe of CHull [jdurieux]
- Added the option to have multiple complexities to MultiCHull [jdurieux]
- Updated ShinyApp [jdurieux]
- Example datasets were added [jdurieux]
- Added option to show interactive `plotly` graphs which is now the default. Static plots can be produced by adding the `plottype='static'` parameter to the plot function for the `CHull` and `MultiCHull` objects [jdurieux]

## version 1.0.1
- Fixed compatibility with igraph 1.4.0 and up.
