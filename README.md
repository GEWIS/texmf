
# GEWIS LaTeX Root
This is the GEWIS LaTeX root. This folder was created to allow GEWIS members to easily install all packages neccessary to compile the diverse GEWIS document templates. Currently, of all packages the latest version is installed.

> On GEWIS computers these packages are also available, next to the TU/e wide LaTeX packages. Users can also maintain their own packages, but cannot use a different version of a package already included in the TU/e installation. You can maintain separate versions of the packages in the GEWIS repository, but this will most likely break the 

## How to set the root in my MikTeX system
Start by cloning this repository on your local machine. For most use cases, the `main` branch suffices. You can also download a zip file, but cloning the repository allows for easy updates.

**Windows/Linux with desktop environment:**
1. Clone this repository:<br>`git clone git@github.com:GEWISstijl/texmf.git` or<br>`git clone https://github.com/GEWISstijl/texmf.git`<br>You can also use your favourite git GUI to clone the repository
2. Open the MikTeX Console<br>&gt; When installing for all users: Switch to administrator mode
3. Go to `Settings` > `Directories`
4. Add the `textroot` subfolder as a root in the settings. To guarantee you do not have local (system-wide or user-specific) conflicting versions, you can move it to the top

**Windows/Linux (headless):**
If you did not prepare your MikTeX system, please run the following steps:
1. `miktexsetup finish`
2. Enable the automatic installation of packages (optional):<br>`initexmf --set-config-value=[MPM]AutoInstall=yes`
3. Select the closest mirror as your repository:<br>`mpm --pick-repository-url`

To set the root, please perform the following steps:
1. Clone this repository:<br>`git clone git@github.com:GEWISstijl/texmf.git` or<br>`git clone https://github.com/GEWISstijl/texmf.git`
2. Set the `texroot` folder as a user root folder:<br>`initexmf --user-roots=$HOME/texmf/texroot/` (update the filepath to the location)<br>If you have any roots configured, you'll have to specify those here as well
3. Update the filename database to let MikTeX know where all files are located:<br>`initexmf --update-fndb=$HOME/texmf/texroot/`
4. Upgrade your MikTeX to the latest version and install all packages neccessary for the correct working of LaTeX:<br>`mpm --upgrade --package-level=essential`
5. Install updated versions of packages:<br>`mpm --update`
6. Pull the new list of packages from the remote repository URL (this step also checks locally installed packages; that is why it is needed here):<br>`mpm --update-db`

## How to update the root
1. Pull the new version of the repository:<br>`git pull`

Usually, updates are automatically processed. If not, you may want to update the filename database

## What packages are included?
Name|Version|Reason for inclusion|Source
----|-------|--------------------|------
amsmath|2020-10-04|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
arabi|2012-01-18|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
atbegshi|2019-12-06|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
atenddvi|2020-11-24|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
atveryend|2019-12-13|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
auxhook|2019-12-21|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
babel|2021-01-14|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
babel-dutch|2020-10-31|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
babel-english|2017-06-17|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
biber-linux-x86_64|2021-01-02|MikTeX for Linux|
biber-windows-x64|2021-01-02|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
bigintcalc|2019-12-20|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
bitset|2019-12-13|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
booktabs|2020-01-15|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
changepage|2009-10-21|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
cm|2014-01-24|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
datatool|2019-09-29|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
datetime2|2021-03-25|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
datetime2-dutch|2018-04-08|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
datetime2-english|2019-10-22|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
dvips|2020-02-05|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
ec|2001-06-23|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
enumitem|2019-06-24|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
epstopdf-pkg|2020-01-26|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
eso-pic|2020-12-05|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
etexcmds|2019-12-20|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
etoolbox|2020-10-07|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
eurosym|2009-04-04|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
everyshi|2020-12-05|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
fancyhdr|2021-01-30|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
fontawesome|2019-06-08|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
fontaxes|2020-07-27|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
fontname|2021-01-02|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
fp|2019-01-19|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
geometry|2020-01-03|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
gettitlestring|2019-12-20|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
GEWISAgenda|2021-04-15|Stijl|
GEWISAgendaMinutes|2021-04-15|Stijl|
GEWISDocument|2021-04-15|Stijl|
GEWISLetter|2020-05-09|Stijl|
graphics|2020-10-03|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
graphics-cfg|2016-11-04|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
graphics-def|2021-03-25|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
grfext|2019-12-05|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
hycolor|2020-01-30|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
hyperref|2021-03-03|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
iftex|2020-03-09|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
infwarerr|2019-12-15|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
intcalc|2019-12-20|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
kvdefinekeys|2019-12-20|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
kvoptions|2020-11-09|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
kvsetkeys|2019-12-20|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
l3backend|2021-03-25|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
l3kernel|2021-02-19|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
l3packages|2021-03-17|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
lastpage|2015-04-21|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
latex-firstaid|2021-03-17|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
latex-fonts|2009-06-30|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
latex-tools|2020-16-10|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
lato|2019-07-05|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
letltxmacro|2019-12-05|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
lineno|2011-02-17|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
lipsum|2021-03-06|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
listofitems|2019-08-22|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
ltxbase|2021-01-11|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
ltxcmds|2020-10-03|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
marginnote|2018-08-14|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
mathpazo|2006-09-29|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
metafont|2020-01-29|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
miktex-config-2.9|2021-03-18|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
miktex-dvips|2017-04-09|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
miktex-fontconfig|2016-11-04|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
miktex-latex|2021-03-18|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
miktex-metafont|2016-11-04|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
miktex-misc|2021-03-17|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
miktex-pdftex|2016-11-10|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
modes|2020-10-03|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
mptopdf|2020-02-06|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
multirow|2021-03-17|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
ncctools (manyfoot)|2019-08-05|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
ocg-p|2013-01-24|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
palatino|2006-09-28|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
pdfescape|2019-12-13|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
pdftexcmds|2020-06-29|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
psnfss (mathpazo)|2020-04-03|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
refcount|2019-12-20|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
rerunfilecheck|2019-12-09|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
substr|2009-10-12|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
tetex|2016-11-03|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
titlesec|2019-10-17|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
tracklang|2020-07-01|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
unicode-data|2020-10-27|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
uniquecounter|2019-12-20|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
url|2020-01-26|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
xcolor|2016-05-15|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
xfor|2009-02-07|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/
xkeyval|2020-11-25|TU/e installation|http://ctan.net/systems/win32/miktex/tm/packages/
zref|2020-10-10|GEWIS|https://anorien.csc.warwick.ac.uk/CTAN/systems/win32/miktex/tm/packages/

