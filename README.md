# agrm. 
Stata module to calculate van der Eijk's measure of agreement.
***
<br>

## Description
`agrm` calculates Cees van der Eijk's (2001) alternative measure of agreement 'A'.  This measure is a weighted average of the degree of agreement among respondents that exists in the simple component parts – layers – into which any frequency distribution can be disaggregated.  It is especially useful when calculating agreement in ordered rating scales and easily interpretable, ranging from -1 (perfect bimodality) to +1 (perfect unimodality).

## Installation
You can install the latest version of `agrm` by executing the following code:
```Stata
net install agrm, from("https://raw.githubusercontent.com/eckerale/agrm/master")
```

## Syntax
```Stata
[by:varlist] agrm varlist [if] [in] [weight] [, generate(newvar) categories(integer) bounds(numlist) missing(numlist) detail noprint]
```

## Options
`generate(newvar)` creates a new variable newvar which returns the according value of 'A'.<br>

`categories(integer)` specifies the number of total categories. It allows to calculate the measure of agreement regardless of empty categories.<br>

`bounds(numlist)` customizes the lower and upper bounds of the measure of agreement.<br>

`missing(numlist)` specifies the numeric values of missing values.<br>

`detail` displays additional statistics.<br>

`noprint` suppresses the output.

## Remarks
The measure of agreement is highly sensitve to the number of categories of the ordered rating scale. In order to mitigate the risk of miscounting the number of categories the `agrm` command takes advantage of all the information provided in the data set (e.g. value labels). The output window reports the number of categories used to calculate the measure of agreement.  Please double-check with the actual length of the ordered rating scale.  If necessary, use the `categories(integer)` option to manually adjust the number of categories.

Please note that the `agrm` command is unable to handle both negative category values and noninteger category values. If you encounter such data in your data set, use the `recode` command to obtain an ordered rating scale with positive and integer category values.

For more detailed information on the measure of agreement, see van der Eijk (2001).

## Examples

    . bysort country: agrm socsec

    . agrm tax environment, generate(agreement)

    . agrm socsec, categories(5)

    . agrm tax, bounds(0 1) missing(99) detail

## Saved results
`agrm` saves the following in r():

**r(mean)**   mean

**r(min)**    minimum

**r(max)**    maximum

**r(sd)**     standard deviation

**r(A)**      measure of agreement 'A'

## Refereces
van der Eijk, Cees. 2001. 'Measuring Agreement in Ordered Rating Scales.' *Quality and Quantity* 35 (3): 325-341.

## Author
A. Ecker<br>
Mannheim Centre for European Social Research, University of Mannheim.<br>
Please email to alejandro.ecker@mzes.uni-mannheim.de if you observe any problems.

## How to cite
Thanks for citing this Stata module as follows:<br>
Ecker, Alejandro. 2011. agrm: Stata module to calculate van der Eijk's measure of agreement. Available from "https://github.com/eckerale/agrm".
