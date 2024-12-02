{smcl}
{* *! version 1.1.5 29 November 2024}{...}
{cmd: help agrm}
{hline}


{title:Title}

{pstd}
{bf:agrm} {hline 2} Calculate measure of agreement "A".


{title:Syntax}

{pstd}
[by {varlist}:] {cmd:agrm} {varlist} {ifin} {weight} [{cmd:,} {cmdab:gen:erate(}{it:newvar}{cmd:)} {cmdab:cat:egories(}{it:integer}{cmd:)} {cmdab:bou:nds(}{it:numlist}{cmd:)} {cmdab:m:issing(}{it:numlist}{cmd:)} {cmdab:d:etail} {cmdab:noprint}]


{title:Installation}

{p 4 4 2}
You can install the latest version of {bf:agrm} by executing the following code:

{p 4 4 2}
{cmd:. net install agrm, from("https://raw.githubusercontent.com/eckerale/agrm/master")}


{title:Description}

{p 4 4 2} 
{cmd:agrm} calculates Cees van der Eijk's (2001) alternative measure of agreement "A".
This measure is a weighted average of the degree of agreement among respondents that exists in the simple component parts – layers – into which any frequency distribution can be disaggregated.
It is especially useful when calculating agreement in ordered rating scales and easily interpretable, ranging from -1 (perfect bimodality) to +1 (perfect unimodality).


{title:Options}

{p 4 4 2} 
{cmd:generate(}{it:newvar}{cmd:)} creates a new variable {it:newvar} which returns the according value of "A".

{p 4 4 2}
{cmd:categories(}{it:integer}{cmd:)} specifies the number of total categories. 
It allows to calculate the measure of agreement regardless of empty categories.

{p 4 4 2}
{cmd:bounds(}{it:numlist}{cmd:)} customizes the lower and upper bounds of the measure of agreement.

{p 4 4 2} 
{cmd:missing(}{it:numlist}{cmd:)} specifies the numeric values of missing values.

{p 4 4 2} 
{cmd:detail} displays additional statistics.

{p 4 4 2} 
{cmd:noprint} suppresses the output.


{title:Remarks}

{p 4 4 2}
The measure of agreement is highly sensitve to the number of categories of the ordered rating scale. 
In order to mitigate the risk of miscounting the number of categories the {cmd:agrm} command takes advantage of all the information provided in the data set (e.g. value labels). 
The output window reports the number of categories used to calculate the measure of agreement. 
Please double-check with the actual length of the ordered rating scale. 
If necessary, use the {cmd:categories(}{it:integer}{cmd:)} option to manually adjust the number of categories. 

{p 4 4 2}
Please note that the {cmd:agrm} command is unable to handle both negative category values and noninteger category values. 
If you encounter such data in your data set, use the {help recode} command to obtain an ordered rating scale with positive and integer category values.

{p 4 4 2}
For more detailed information on the measure of agreement, see van der Eijk (2001).


{title:Examples}

{p 4 4 2}
The examples below are based on left-right placements of political parties in a subset of the 2019 EES voter study (Schmitt et al. 2022).

{p 4 4 2}
{cmd:. import delimited "EES_2019_subset.csv", clear}

{p 4 4 2}
{cmd:. bysort countrycode: agrm q13_1, missing(96 98)}

{p 4 4 2}
{cmd:. agrm q13_1 q13_2, generate(agreement) missing(96 98)}

{p 4 4 2}
{cmd:. agrm q13_5, missing(96 98) cat(13)}

{p 4 4 2}
{cmd:. bysort countrycode: agrm q13_1, bounds(0 1) missing(96 98) detail}


{title:Saved results}

{p 4 4 2}
{cmd:agrm} saves the following in {cmd:r()}:

{synoptset 12 tabbed}{...}
{synopt:{cmd:r(mean)}}mean{p_end}
{synopt:{cmd:r(min)}}minimum{p_end}
{synopt:{cmd:r(max)}}maximum{p_end}
{synopt:{cmd:r(sd)}}standard deviation{p_end}
{synopt:{cmd:r(A)}}measure of agreement "A"{p_end}

{title:References}

{p 4 4 2}
van der Eijk, Cees. 2001. "Measuring Agreement in Ordered Rating Scales." {it:Quality and Quantity} 35 (3): 325-341.

{p 4 4 2}
Schmitt, Hermann, Sara B. Hobolt, Wouter van der Brug and Sebastian A. Popa. 2022. "European Parliament Election Study 2019, Voter Study." {it:GESIS, Cologne. ZA7581 Data file Version 2.0.1}, {browse "https://doi.org/10.4232/1.13846"}.

{title:Author}

{p 4 4 2}
A. Ecker, Institute of Political Science, Heidelberg University. Please email to {browse "mailto:alejandro.ecker@uni-heidelberg.de":alejandro.ecker@uni-heidelberg.de} if you observe any problems.


{title:How to cite}

{p 4 4 2}
Thanks for citing this Stata module as follows: Ecker, Alejandro. 2011. agrm: Stata module to calculate van der Eijk's measure of agreement. Available from {browse "https://github.com/eckerale/agrm"}.

