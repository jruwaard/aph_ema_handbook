

# Activity {#activity}
\index{EMA!Passive EMA}
\index{Actigraphy} 
\index{Geotracking} 

The objective study of human physical activity is one of the exciting
opportunities created by passive EMA [@Marszalek2014]. Through technological
advances in mobile sensing, we are now able to continuously monitor
(in-)activity of participants in every-day life, with little to no participant
burden.

While questions remain with regard to the validity, reliability and clinical
utility of passive EMA of specific activities, such as (disturbed) sleep,
sedentary behavior, and energy expenditure [see, e.g., @Feehan2018;
@Gomersall2016], an increasing number of mental health studies are including
activity tracking devices to better understand sleep habits, circadian rhythm
disorders and depression [see, e.g., @Cornet2017; @Saeb2015; @Saunders2016;
@Tahmasian2013].

In this chapter, we will discuss two passive EMA methods to assess physical
activity: actigraphy and geotracking. Of these two, actigraphy has been used
most in human clinical research. However, due to the massive adoption of
smartphones, researchers increasingly collect geolocation data as well, inspired
perhaps by the elaborate geolocation data analysis techniques that have been
developed in the past decades in wildlife telemetry research
[@tomkiewicz2010global].


<div class="figure" style="text-align: center">
<img src="activity_files/figure-html/accgps-1.png" alt="Actigraphy (left) and Geotracking (right): two methods for passive ecological momentary assessment of activity." width="95%" />
<p class="caption">(\#fig:accgps)Actigraphy (left) and Geotracking (right): two methods for passive ecological momentary assessment of activity.</p>
</div>

## Actigraphy
\index{Actigraphy} 
\index{Accelerometer} 
\index{GENEActiv} 

Accelerometers are micro electro-mechanical systems (MEMS) that measure changes
in acceleration forces (i.e., both static forces - earth's gravity - and dynamic
forces - caused by movement), typically simultaneously on the vertical (Y),
horizontal right-left (X) and horizontal front-back axis (Z). Through
actigraphy, we study the frequency, duration, and intensity of physical
activity. Figure \@ref(fig:genea-one-hour) shows one hour of data collected from
a wrist-worn GENEActiv accelerometer. As can be seen, three accelerometers (X,
Y, Z) were simultaneously providing data. Data were sampled with a frequency
of 30 Hertz (Hz; thirty measurements per second - which is common), but
sub-sampled here to 0.1Hz (one measurement every 10 seconds), for practical
reasons. If we would have plotted the data at 30Hz, the plot would have
included 108.000 data points. At 0.1Hz, this reduces to 360 points.

<div class="figure" style="text-align: center">
<img src="activity_files/figure-html/genea-one-hour-1.png" alt="One hour of raw data collected with a wrist-worn GENEActiv accelerometer, sub-sampled to 10-second epochs (0.1 Hz)" width="100%" />
<p class="caption">(\#fig:genea-one-hour)One hour of raw data collected with a wrist-worn GENEActiv accelerometer, sub-sampled to 10-second epochs (0.1 Hz)</p>
</div>

Data shown are included in package `emaph`, and the R-code to reproduce the plot
is listed below. Use this to familiarize yourself with actigraphy data. If you
want to see how sub-sampling affects the number of points to plot, for example,
you can set different values in the `round_date` function. For example, to get
a point for each five seconds (0.2Hz), you would set the argument of this
function to `5 seconds`.


```r
# Plot one hour of emaph accelerometer data (of person 1).
library(dplyr)
library(ggplot2)
d <-  subset(emaph::geneactiv, timestamp > "2018-06-01 13:00" &
                           timestamp < "2018-06-01 14:00" &
                           id == 1)
d$timestamp <- lubridate::round_date(d$timestamp, "10 seconds")
d <- d %>% group_by(timestamp) %>% summarise_all(.funs = mean) %>% 
  tidyr::gather(key = "sensor", value = "value", x, y, z)

ggplot(d, aes(timestamp, value)) + geom_line() + 
  geom_hline(yintercept = 0, linetype = 2) + facet_grid(rows = vars(sensor) , scales = "free_y")
```


### Data cleaning
\index{Datamanagement!Data cleaning}
\index{GGIR}
\index{GENEAread}

Raw accelerometer data need to be cleaned before analyses can be run. Typical
data import work-flows include re-calibration [to reduce systematic measurement
error; @VanHees2014], the detection of non-wear periods (to ensure that
non-informative data are removed or imputed), sub-sampling (reducing the sample
rate to reduce analysis time) and filtering/aggregation (to smoothen the signal
and reduce the impact of outliers, measurement error and occasional missing
values). Study results can be highly dependent on these initial steps, which,
unfortunately, are also complex and time-consuming. Specialized R-packages exist
to help you with this (see, for example, package `GGIR` and `GENEAread`, which
are described in more detail in Chapter \@ref(rcat)).


### Feature Extraction
\index{ENMO}
\index{SVM}

Properties of the signals that are of interest are highly dependent on the focus
of the study. Highly detailed analysis of local peaks in the signal might be
needed, for instance to reveal an association between activity and reported
events. But analyses can also be more global, for instance when accelerometer
data are used to study circadian rhythms in activity. Several approaches exist
to combine the X, Y, Z measurements into a single meaningful
metric. Two popular metrics are the 'Signal Vector Magnitude' (SVM) and the
'Euclidean Norm Minus One' (ENMO). Validation studies suggest that ENMO should be
the preferred metric [@VanHees2014; @VanHees2015], although recent findings
also suggest that alternative metrics should perhaps be considered when
sedentary and light activities are of interest [@Bai2016].

SVM and ENMO are closely related. SVM is the magnitude of the raw tri-axial
signals (the Euclidean distance in the three-dimensional space), i.e. *SVM =
sqrt(x^2 + y^2 + z^2)*. ENMO is the corrected SVM: the vector magnitude
remaining after removing one Earth Standard Gravitational unit (1g = 9.81
m/s^2), with negative values rounded to 0, i.e. *ENMO = max(SVM - 1, 0)*. The
metrics can, in principle, be calculated for each {x, y, z}-data point in the
raw series. Typically, however, the metrics are calculated for time-windows
(called *epochs*), in which case the mean can be used to characterize the
overall activity in each epoch.

Figure \@ref(fig:genea-one-day) shows the development of ENMO over one day, as
sampled by GENEActiv accelerometers that were worn by a young adult (top) and a
middle-aged person (bottom). This figure is much easier to interpret than the
plot of the raw x-y-z values in Figure \@ref(fig:genea-one-hour). Activity levels
over the day follow a similar pattern, but the activity levels in the two plots
are strikingly different. Age appears to matter here: activity levels of the
middle-aged person are consistently lower than those of the young adult.

<div class="figure" style="text-align: center">
<img src="activity_files/figure-html/genea-one-day-1.png" alt="One day of data of the two persons in the GENEA data set of package 'emaph', summarised with ENMO, in 10-minute epochs" width="100%" />
<p class="caption">(\#fig:genea-one-day)One day of data of the two persons in the GENEA data set of package 'emaph', summarised with ENMO, in 10-minute epochs</p>
</div>

\index{MVPA}

For SVM and ENMO, cut-off values for various activity classes have been
determined [@Dasilva2014; @Hildebrand2014; @Kim2017; @Rowlands2016]. Although
these cut-offs vary somewhat from study to study, a suggested pragmatic ENMO
cut-off for Moderate-to-Vigorous-Physical-Activity (MVPA) is 0.125g (125
milligravity units; Femke Lamers, personal communication, 15 november 2018). The
dotted line in Figure \@ref(fig:genea-one-day) marks this cut-off.



With this cut-off, we can summarize the two series shown in Figure
\@ref(fig:genea-one-day) by the number of times on which ENMO is higher than the
MVPA cut-off. The daily MVPA-count for the young adult is 17. For the
middle-aged person, this is 5: considerably lower.

You should be aware that the choice of the width of the epoch matters when
MVPA-counts are calculated. By averaging values in each window, ENMO acts as a
smoother, which may prevent you from the detection of short bursts of activity
when the window is large. If we would have used a 5-second window to generate
Figure \@ref(fig:genea-one-day), for example, the MVPA-counts would go up
considerably for each person.


## Geotracking
\index{Geotracking} 

### The Geographic Coordinate System
\index{Geographic Coordinate system}
\index{Longitude} \index{Latitude}

In the geographic coordinate system, each location on the earth is uniquely
represented by two numbers: *Latitude* and *Longitude*. Latitude marks the
north–south position of a point on the earth's surface, and longitude marks
the east-west position (see Figure \@ref(fig:longlat)). The center of Amsterdam,
for example, is {latitude: 52.37022; longitude: 4.89517}, which can be verified
by punching these numbers in [Google maps](https://tinyurl.com/ybxxk99a).


<div class="figure" style="text-align: center">
<img src="images/activity/Latitude_and_Longitude_of_the_Earth.png" alt="Latitude and Longtitude of the Earth (source: WikiPedia)." width="75%" />
<p class="caption">(\#fig:longlat)Latitude and Longtitude of the Earth (source: WikiPedia).</p>
</div>


### The Global Positioning System
\index{GPS}

The Global Positioning System (GPS) is a satellite-based radio-navigation system
that provides geolocation and time information. With GPS-receivers, latitude and
longitude can be determined, to track geographical locations and movement. Due
to the increasing ease with which GPS-data can be collected via modern
smartphones, recent years have witnessed a marked increase in the use of
GPS-based activity measures in the study of mental health.

Figure \@ref(fig:fourweekgps) shows GPS-data of two people, collected over a
period of four weeks, via the Google timeline smartphone app. Data can be found
in the `emaph` package (see `?locations`). 


```r
# Plot four-week location history of emaph location data
library(ggplot2)
library(emaph)

d <- subset(locations,
            accuracy <= 50 &
              lon >=  4.80 & lon <=  5.00 &
              lat >= 52.25 & lat <= 52.50) %>% 
  sample_n(4000)
  
ggplot(d, aes(lon, lat)) +
  geom_point(alpha = .2,  shape = 21, size = 3) +
  xlab("longitude") + ylab("latitude") + 
  facet_wrap(~ id)
```

<div class="figure" style="text-align: center">
<img src="activity_files/figure-html/fourweekgps-1.png" alt="Four-week location history of two people, collected with Google Timeline." width="100%" />
<p class="caption">(\#fig:fourweekgps)Four-week location history of two people, collected with Google Timeline.</p>
</div>

Data-points are superposed, using transparent colors, to make a distinction
between locations that were visited once (light areas) and places that were
visited many times (darker areas). From the plot, we learn that these two
people both lived and worked in the Amsterdam area (latitude and longitude are
close to the coordinates of Amsterdam center). We also see that they shared a
frequently visited location (they were co-workers, working in the same
building). Locations of person 1 reveal that this person's home was probably in
Amsterdam, while the locations of person 2 show that this person's home was
probably located in an Amsterdam suburb. Commuting patterns (i.e., the recurrent
traveling between the place of residence and place of work) are clearly visible.

It should be noted, though, that person 1 contributed much less data (n =
722) than person 2 (n = 14031). This
can be explained by the different devices that were used by both: Person 1 used
an iPhone (with standard GPS-settings) and Person 2 used a Sony Z1 Android (with
high-precision GPS features enabled). This device-related variability in GPS
sample rates and accuracy is one of the primary challenges of naturalistic EMA
research and EMI applications.

The problem with the (in)accuracy of GPS-data is further illustrated by Figure
\@ref(fig:nightcrawl), in which all data points are plotted that were registered
by the smartphone of person 2 between 02:00 and 06:00, At those hours, the
person was sleeping, in the bedroom of his house. He did not move. Yet, if we
would take the GPS-data for granted, he regularly took a nightly random walk in the
park. The red dot in the figure marks the median coordinate. This coordinate is
very accurate: it marks the bedroom. All individual data points, however, fail
to identify this location.

<div class="figure" style="text-align: center">
<img src="activity_files/figure-html/nightcrawl-1.png" alt="Nightly GPS-fluctuations, revealing inaccurate location measurements" width="100%" />
<p class="caption">(\#fig:nightcrawl)Nightly GPS-fluctuations, revealing inaccurate location measurements</p>
</div>


### GPS-based Activity Measures

Raw GPS-data reflect series of locations rather than activity per se. However,
measures of activity can be extracted from these data. 

Table \@ref(tab:GPSfeatures) shows some of the measures that were derived from
GPS data in a small (n = 28) study exploring the correlation between passive EMA
data and depression, conducted by researchers of Northwestern University
[@Saeb2015]. The researchers calculated total distance, location variance, the
number of places visited by the participants during the study [using the K-means clustering algorithm, @Hartigan1979, which is implemented in R as `kmeans`), the percentage of
time spent at home (defined as a top 3 place which was most frequently visited
between 24:00 and 6:00), and circadian movement - the consistency of location
visits based on a 24-hour period. Circadian movement and location variance were
found to be correlated with PHQ-9 scores in this study, but not - however - in a
follow-up study, which included more participants [@Saeb2017].

Table: (\#tab:GPSfeatures) Activity measures that can be derived from a GPS data set.

| **Name**                         | **Formula**                                                  | 
|:---------------------------------|:-------------------------------------------------------------|
| Total distance between locations | $\sum(distance((lat_{t}, lon_{t}), (lat_{t-1}, lon_{t-1})$   |
| Location variance                | $log(\sigma_{lon}^2 + \sigma_{lat}^2)$                       | 
| N Places                         | kmeans(loc, lat)                                             | 
| Home Stay                        | time(cluster[home]) / time(clusters[j])                      |
| Circadian Movement               | $\sum(psd(f_i) / (i1 - i2)$                                  |


