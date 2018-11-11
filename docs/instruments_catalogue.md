

# EMA Instruments Catalogue {#ema-instruments-catalogue}

For conducting EMA studies, a variety of apps, online applications and wearable
devices are on the market. In this chapter, we list a selection of instruments
that we found to be in use in scientific studies within the APH consortium.

Table: (\#tab:14a) EMA Instruments.

| **Name**     | **Manufacturer**  | **URL**           | **Description**
|-------------:|------------------:|------------------:|-------------------------------|
| GENEActive   | activinsights     | activinsights.com | Wrist-worn accelerometer      |
| Ilumivu      | Ilumivu           | ilumivu.com       | Android / iOS EMA app         |
| Moodbuster   | ICT4D Consortium  | moodbuster.eu     | Android EMA app               |
| Movisens     | MoviSens          | www.movisens.com  | Android EMA app               |
| PsyMate      | PsyMate           | psymate.eu        | Android/iOS EMA app           |
| RoQua        | RoQua             | roqua.nl          | SMS / Browser-based active EMA|
| VU-AMS       | VU                | www.vu-ams.nl     | Wearable for autonomic nervous| 
|              |                   |                   | system assessments            |


## GENEActive
\index{GENEActive}

GENEActive, sold by UK-based company Activinsights (activinsights.com), is a
waterproof wrist-worn device with a high-precision, configurable 3-axial
accelerometer (range: +/- 8g), an ambient light sensor, a (near-body)
temperature sensor, and an event logger (a button that users can press to mark a
targeted event). GENEActive was developed to accurately assess human activity in
scientific studies. The device has a storage capacity of 0.5GB of raw data.
At 10Hz, the device can log activity up to one month. July 2018, the price for
one unit was approximately 250 euro.

GENEActive is used in a growing number of clinical studies to measure activity
and sleep-wake cycles, in natural conditions, over longer periods of time.
Dedicated R-packages to pre-process and analyze the raw data exist (see Chapter
\@ref(rcat)). Note, however, that no accompanying app exists with which study
participants can be provided feedback about their activity. This might
negatively affect wear-time and study compliance in research participants, who
are accustomed to consumer activity-sampling devices, such as Fitbit, where many
options for real-time feedback exist.

<div class="figure" style="text-align: center">
<img src="images/instruments/geneactive/geneactive-pack.png" alt="The GENEActive Accelerometer" width="100%" />
<p class="caption">(\#fig:geneactive)The GENEActive Accelerometer</p>
</div>

## Ilumivu
\index{Ilumivu}

Ilumivu (see <https://ilumivu.com/>) is an American commercial company
specialised in mobile EMA application development. It offers a cross-platform
(Android and IOS) smartphone app (mEMA) that researchers can use to collect data
from study participants. Researchers can define the assessment plan of their
study in an online back-office (i.e., without any assistance from Illumivu
staff).

The Ilumivu EMA toolbox library includes a rather complete set of survey
elements, survey logic branching tools, and survey scheduling options. Passive
EMA options include GPS tagging (of survey responses), GEO-fencing (triggering
surveys at specific locations) and smartphone sensor logging (light and noise
level, screen brightness, screen locked/unlocked, humidity, ambient temperature,
barometric pressure, phone/SMS activity log, and basic device information). a
limited number of smart watch devices can optionally be linked to the Ilumivu
app for further passive data collection. With the online back-office,
researchers can invite participants, monitor study compliance and download data
(in common data formats such as CSV). The company is open for custom
development, when studies require features that are not included in the default
app.

Current (July 2018) subscription plans range from 3.375 dollar (basic features)
to 12.000 dollar (all features), per year. Researchers, who are interested in
purchasing a license of the service, are advised to the 'Grant Writer's Guide'
of Ilumivu, which can be downloaded from the site of the company (at
<https://ilumivu.com/pricing/writing-a-grant/>).

Ilumivu's competitive advantage is that it has multi-platform support. It is,
however, not the cheapest EMA product on the market. Being an American company,
researchers should also consider EU regulations relating to personal data
privacy protection, since regulations are stricter when personal data of EU
citizens leave the EU.  

<div class="figure" style="text-align: center">
<img src="images/instruments/ilumivu/iv-app-1.png" alt="Ilumivu App Screenshots" width="25%" /><img src="images/instruments/ilumivu/iv-app-2.png" alt="Ilumivu App Screenshots" width="25%" /><img src="images/instruments/ilumivu/iv-app-3.png" alt="Ilumivu App Screenshots" width="25%" />
<p class="caption">(\#fig:ilumivu)Ilumivu App Screenshots</p>
</div>



## Moodbuster
\index{Moodbuster}

Moodbuster (<http://moodbuster.eu/>) is a web-based treatment platform with an
integrated EMA app. The platform was developed by an international non-profit
research consortium, including VU, VUmc and GGZ inGeest, in two major EU-funded
research projects: ICT4Depression (see ICT4Depression.eu; @warmerdam2012) and
E-COMPARED (see <http://e-compared.eu>; @Kleiboer2016; @VandeVen2017).

In the E-COMPARED trial, Moodbuster was used, in five EU-countries, to test
blended treatment of major depression. In this study, participants used the
smartphone app to rate mood and various other depression-related variables, in
the context of their treatment, over a period of up to 20 weeks. E-COMPARED EMA
data were used in several predictive machine learning studies [@mikus2018;
@rocha2018]. In addition, the EMA app was used in a satellite study designed to
assess the effects of long-term EMA [@VanBallegooijen2016]. Moodbuster will
also be used in the EU ImpleMentAll project (<http://www.implementall.eu>) and
in several other clinical trials that are in preparation.

Currently, EMA assessment protocols are hard-coded in the Moodbuster app. New
EMA assessments protocols can be implemented in collaboration with the
Moodbuster development team. An online back-office is in development. Previous
studies used an Android version of the EMA app. Cross-platform versions of the
app in development.

More information on Moodbuster can be obtained from prof. dr. Heleen Riper
(<h.riper@vu.nl>).

<div class="figure" style="text-align: center">
<img src="images/instruments/moodbuster/mb-app-home.png" alt="MoodBuster App Screenshots" width="25%" /><img src="images/instruments/moodbuster/mb-app-mood.png" alt="MoodBuster App Screenshots" width="25%" /><img src="images/instruments/moodbuster/mb-app-graph.png" alt="MoodBuster App Screenshots" width="25%" />
<p class="caption">(\#fig:moodbuster)MoodBuster App Screenshots</p>
</div>


## Movisens
\index{Movisens}

Movisens (<http://www.movisens.com>) is a German company that is specialized in
the development of hard- and software solutions for mobile sensing. The company
sells small wearable devices that contain several high-precision sensors,
including an accelerometer, gyroscope, barometer and thermometer. In addition,
the company has developed an (Android) app, called MovisensXS, which can be used
for active EMA research. The app can optionally be configured for smartphone
logging (e.g., to log music that a study participant listens this). The wearable
sensor can also be linked to the app, so that EMA questionnaires can be
triggered based on targeted activity or energy expenditure patterns, such as
extended periods of sedentary behavior. Specialized software to import,
pre-process and analyze raw sensor data is available for download.

Like Ilumivu, researchers can define EMA sample schedules for their study in a
web-based back-office (<https://xs.movisens.com>), using an online graphical
editor. Once defined, participants can be invited to the study , through the
back-office, to download the freely available Movisens App from Google Play
store. The back-office also allows researchers to monitor study compliance and
download data.

MoviSensXS EMA license costs vary from 500 to 10.000 euro's per year, depending
on the required number of 'credits' which are linked to the number of EMA
responses. Prospect users can test platform, without functional restrictions,
with a free test account. An EMA test-study can thus be set up and started in
less than a day. A current (November 2018) limitation of Movisens is the lack of
an iOS version of the EMA app. Study participants who own an iPhone have to be
excluded from studies, or will have to be provided with an Android phone.

<div class="figure" style="text-align: center">
<img src="images/instruments/movisens/movisens.png" alt="Movisens Sample scheme editor (left) and App Screenshots (right)" width="100%" />
<p class="caption">(\#fig:movisens)Movisens Sample scheme editor (left) and App Screenshots (right)</p>
</div>

## PsyMate
\index{PsyMate}

The PsyMate app (<http://www.psymate.eu>) was developed by the Department of
Psychiatry and Psychology at Maastricht University in the Netherlands to assess
psychological problems in daily life. The app has been validated for use in
depression, bipolar disorder, and psychosis, with new scales currently being
developed for a range of diseases including Parkinson's disease, pain,
cardiology, hypertension, diabetes and Irritable Bowel Syndrome. It was also
used in a EU-funded project to study gene-environment interaction in
schizophrenia (<http://www.eu-gei.eu/about-the-project/psymate>).

The app is free to download for iOS and Android devices on Apple and Google play
stores. PsyMate is available in five languages (English, French, German, Dutch,
Spanish). More translations are in preparation. Uses of the app include
self-monitoring of mood states, delivering professional support during
treatment, or conducting EMA-research.

The app can be customized to address specific client needs or research projects,
with expertise from the Psymate development team, which includes an active
working group that meets regularly to discuss and advise new projects.
Researchers have access to the raw data without having to go through the Psymate
development team. Communication from the Psymate back office to researchers
about updates and assistance with technical problems could be a point for
consideration for using this platform.

<div class="figure" style="text-align: center">
<img src="images/instruments/psymate/psymate-app1.jpg" alt="PsyMate App Screenshots" width="25%" /><img src="images/instruments/psymate/psymate-app3.jpg" alt="PsyMate App Screenshots" width="25%" /><img src="images/instruments/psymate/psymate-app4.jpg" alt="PsyMate App Screenshots" width="25%" />
<p class="caption">(\#fig:psymate)PsyMate App Screenshots</p>
</div>


## RoQua
\index{RoQua}

RoQua (<http://www.roqua.nl/>) is a web-based Routine Outcome Monitoring system,
developed and maintained by a Dutch non-profit development and service
organization that is funded by several by northern GGZ organizations and the
Department of Psychiatry, University Medical Center Groningen. RoQUA has a
sophisticated and user-friendly online back-office portal, with which
researchers can define assessment protocols and invite study participants -
through e-mail or SMS - to complete questionnaires online (on desktop or mobile
devices). By inviting study participants several times a day to complete a
questionnaire via the standard web browser of their mobile phone, active EMA an
be implemented. This approach was taken in several large-scale studies,
including 'NESDA' (<http://nesda.nl>; see also Chapter \@ref(catalogue)) and
'HowNutsAreTheDutch' (<http://www.hoegekis.nl>; see [@VanDerKrieke2017;
@VanDerKrieke2016]).

At present, RoQua does not support the collection of passive EMA data. However,
preliminary results have been reported with a system called 'Physiqual'
[@Blaauw2016], with which EMA data, collected with RoQUA, can be automatically
combined with wearable sensor data.


<div class="figure" style="text-align: center">
<img src="images/instruments/roqua/roqua_p1.jpg" alt="Screenshots of the participant feedback web-page of the 'HowNutsAreTheDutch' project, in which data is collected by the RoQua system" width="30%" /><img src="images/instruments/roqua/roqua_p2.jpg" alt="Screenshots of the participant feedback web-page of the 'HowNutsAreTheDutch' project, in which data is collected by the RoQua system" width="30%" /><img src="images/instruments/roqua/roqua_p3.jpg" alt="Screenshots of the participant feedback web-page of the 'HowNutsAreTheDutch' project, in which data is collected by the RoQua system" width="30%" />
<p class="caption">(\#fig:roqua)Screenshots of the participant feedback web-page of the 'HowNutsAreTheDutch' project, in which data is collected by the RoQua system</p>
</div>


### VU-AMS
\index{VU-AMS}

The VU University Ambulatory Monitoring System (VU-AMS;
<http://www.vu-ams.nl/>), developed by the department of Biological Psychology
and the Technical Department (ITM) of the Faculty of Psychology and Education,
allows ambulant recording of autonomic and cardiovascular activity. VU-AMS
measures heart rate, heart rate variability, Respiratory Sinus Arrhythmia,
Pre-Ejection Period, Left Ventricular Ejection Time, Respiration Rate, Stroke
Volume (SV) and Cardiac Output, Skin Conductance Level (SCL) and Skin
Conductance Responses (SCRs) and Tri-Axial Accelerometry (of Body Movement). For
the processing of VU-AMS data, a dedicated software suite called the 'Data
Analysis and Management Software' (VU-DAMS) is available (for Windows and Mac).

<div class="figure" style="text-align: center">
<img src="images/instruments/VU-AMS/VU_AMS.png" alt="VU-AMS device" width="100%" />
<p class="caption">(\#fig:vu-ams)VU-AMS device</p>
</div>

