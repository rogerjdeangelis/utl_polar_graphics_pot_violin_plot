
Polar graphics flower violin plot

output graphic
https://tinyurl.com/yb2pkejo
https://github.com/rogerjdeangelis/utl_polar_graphics_pot_violin_plot/blob/master/utl_polar_graphics_pot_violin_plot.png

github
https://tinyurl.com/yc6o82q5
https://github.com/rogerjdeangelis/utl_polar_graphics_pot_violin_plot

see StackOverflow
https://tinyurl.com/y9a8wtp2
https://stackoverflow.com/questions/51275955/ggplot2-theme-to-color-inside-of-polar-plot


INPUT
=====

 SD1.HAVE total obs=600

   SPOKE        X

     1       1.24067
     2      -0.53532
     3      -1.01394
     4       0.68965
     5      -0.32458
     6      -1.71788
     1      -0.67680
     2      -2.18728
     3       0.38988
   ....

PROCESS (Working Code)
=======================

 have %>%
  ggplot(aes(x = SPOKE, fill=SPOKE, y = X)) +
  geom_violin() +
  coord_polar() +
  theme(
    plot.background = element_rect(fill = "darkblue"),
    panel.background = element_rect(fill = "lightblue",
                                  colour = "lightblue"));

OUPUT
=====

 https://tinyurl.com/yb2pkejo

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
 call streaminit(4321);
 do rec=1 to 100;
    do spoke=1 to 6;
       x=rand('normal');
       output;
    end;
 end;
 drop rec;
run;quit;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

%utlfkil(d:/png/utl_polar_graphics_pot_violin_plot.png);

%utl_submit_wps64('
libname sd1 "d:/sd1";
options set=R_HOME "C:/Program Files/R/R-3.3.2";
libname wrk  sas7bdat "%sysfunc(pathname(work))";
proc r;
submit;
source("C:/Program Files/R/R-3.3.2/etc/Rprofile.site", echo=T);
library(haven);
library(dplyr);
library(ggplot2);
have<-read_sas("d:/sd1/have.sas7bdat");
png("d:/png/utl_polar_graphics_pot_violin_plot.png");
have$SPOKE=as.factor(have$SPOKE);
have %>%
  ggplot(aes(x = SPOKE, fill=SPOKE, y = X)) +
  geom_violin() +
  coord_polar() +
  theme(
    plot.background = element_rect(fill = "darkblue"),
    panel.background = element_rect(fill = "lightblue",
                                    colour = "lightblue"));

dev.off();
endsubmit;
run;quit;
');
