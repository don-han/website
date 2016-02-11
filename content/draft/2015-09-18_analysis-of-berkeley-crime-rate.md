Title: Analysis of Berkeley Crime Rate for Fall 2015
Slug: analysis-of-berkeley-crime-rate
Date: 2015-10-18
Tags: analysis, berkeley
Status: draft


During the first couple of months of the Fall 2015 semester, there have been an
increasing number of public service announcements (PSAs) in regards to the
crimes happening around the UC Berkeley campus. Most of the PSAs took place in
*Free & For Sales* Facebook group for UC Berkeley students, and many were
first-hand reports of encounters from the victims.

Eventually, many students expressed their concerns over saftey, and many
unsubstantiated claims in regards to Berkeley crimes took place. In this
article, I analyzed the
["Crime incidents" dataset](https://data.cityofberkeley.info/Public-Safety/Crime-Incidents/k2nh-s5h5)
provided by the [City of Berkeley](http://www.ci.berkeley.ca.us/Home.aspx) to
shed some light on the situation to hopefully ease the confusion.

First, I looked at the frequencies of crimes happening in Berkeley.
Unfortunately, the dataset only ranges for the past five months, so I could not
conclude whether Berkeley in Fall 2015 is more dangerous than Berkeley in
Fall 2014. I have sent out an email to City of Berkeley for more data, but I
have not heard back yet. If I finally do get data that ranges over a year, I
will make sure to update.

# include it in the behind-the-scene article (did not include due to its obviousness and lack of data range)
#![Line chart of plotting crime vs. month](/images/crime_per_month.png)

While I did not have enough data to figure out the year-long trend in crime
rates, I wanted to figure out the most dangerous hours of the day since that is
a piece of information that students can actively use by possibly choosing less
dangerous hours to go outside.

![Line chart of plotting crim vs. hour](/images/crime_per_hour.png)

Counter-intuitively, the lowest number of crimes happen from 1AM to 7AM, which
is the hours we typically regard as the most dangerous hours since it's dark
out. However, note that this graph plots absolute frequencies, so the difference
of crime frequencies could just be the difference of population roaming outside
at those specific hours, drastically changing the potential number of victims
and perpetrators. To reflect the invidual interest of a student, we need to
examine the ratio between the number of crimes and the number of people outside
per hour.

Before doing so, I divided the types of crimes into two categories: the personal
offences and the property offences.

![Stacked area chart of personal offences](/images/charted1.png)
![Stacked area chart of property offences](/images/charted2.png)

Since we are only interested in finding out how a student can stay safe, I
decided to only include personal offences.


Now that we have divided the types of crimes that matter to us, I used the
dataset that collected the number of pedestrians at specific ranges of hours.

TODO: make a bar graph that maps the number of pedestrians

TODO: make a plot that maps the number of pedestrians to my graph
----

The plots were created using R, using the [dataset](https://data.cityofberkeley.info/Public-Safety/Crime-Incidents/k2nh-s5h5) provided by the [City of Berkeley](http://www.ci.berkeley.ca.us/Home.aspx).
