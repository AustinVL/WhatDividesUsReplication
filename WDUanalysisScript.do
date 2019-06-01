clear all

import delimited "C:\Users\Austin\OneDrive - Leland Stanford Junior University\3rd Year\GameGameAmerica_dyad_data.csv"

drop v1

gen id = _n
reshape long agree_, i(id) j(task)

***PRE-REGISTERED ANALYSES***

*First order

est clear

eststo m1: quiet clus_nway fracreg logit agree_1 same_party, vce(cluster i j)
eststo m2: quiet clus_nway fracreg logit agree_1 same_region, vce(cluster i j)
eststo m3: quiet clus_nway fracreg logit agree_1 same_relig, vce(cluster i j)
eststo m4: quiet clus_nway fracreg logit agree_1 same_party same_region same_relig, vce(cluster i j)

estout m*, cells(b(star fmt(3)) se(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(N, fmt(0) label(N))

*Second order - Republicans

est clear

eststo m1: quiet clus_nway fracreg logit agree_3 same_party, vce(cluster i j)
eststo m2: quiet clus_nway fracreg logit agree_3 same_region, vce(cluster i j)
eststo m3: quiet clus_nway fracreg logit agree_3 same_relig, vce(cluster i j)
eststo m4: quiet clus_nway fracreg logit agree_3 same_party same_region same_relig, vce(cluster i j)

estout m*, cells(b(star fmt(3)) p(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(bic, fmt(1) label(BIC))

*Second order - Democrats
   
est clear

eststo m1: quiet clus_nway fracreg logit agree_2 same_party, vce(cluster i j)
eststo m2: quiet clus_nway fracreg logit agree_2 same_region, vce(cluster i j)
eststo m3: quiet clus_nway fracreg logit agree_2 same_relig, vce(cluster i j)
eststo m4: quiet clus_nway fracreg logit agree_2 same_party same_region same_relig, vce(cluster i j)

estout m*, cells(b(star fmt(3)) p(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(bic, fmt(1) label(BIC))
   
*Third order

est clear

eststo m1: clus_nway fracreg logit agree_4 same_party, vce(cluster i j)
eststo m2: clus_nway fracreg logit agree_4 same_region, vce(cluster i j)
eststo m3: clus_nway fracreg logit agree_4 same_relig, vce(cluster i j)
eststo m4: clus_nway fracreg logit agree_4 same_party same_region same_relig, vce(cluster i j)

estout m*, cells(b(star fmt(3)) p(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(bic, fmt(1) label(BIC))

***EXPLORATORY***

*Education

est clear

eststo m1: quiet clus_nway fracreg logit agree_1 diff_educ_cont, vce(cluster i j)
eststo m2: quiet clus_nway fracreg logit agree_1 mean_educ_cont, vce(cluster i j)
eststo m3: quiet clus_nway fracreg logit agree_1 diff_educ_cont mean_educ_cont, vce(cluster i j)

estout m*, cells(b(star fmt(3)) p(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(bic, fmt(1) label(BIC))

   
est clear

eststo m1: quiet clus_nway fracreg logit agree_3 diff_educ_cont, vce(cluster i j)
eststo m2: quiet clus_nway fracreg logit agree_3 mean_educ_cont, vce(cluster i j)
eststo m3: quiet clus_nway fracreg logit agree_3 diff_educ_cont mean_educ_cont, vce(cluster i j)

estout m*, cells(b(star fmt(3)) p(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(bic, fmt(1) label(BIC))
 
est clear
 
eststo m1: quiet clus_nway fracreg logit agree_2 diff_educ_cont, vce(cluster i j)
eststo m2: quiet clus_nway fracreg logit agree_2 mean_educ_cont, vce(cluster i j)
eststo m3: quiet clus_nway fracreg logit agree_2pubs diff_educ_cont mean_educ_cont, vce(cluster i j)

estout m*, cells(b(star fmt(3)) p(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(bic, fmt(1) label(BIC))
   
est clear

eststo m1: quiet clus_nway fracreg logit agree_4 diff_educ_cont, vce(cluster i j)
eststo m2: quiet clus_nway fracreg logit agree_4 mean_educ_cont, vce(cluster i j)
eststo m3: quiet clus_nway fracreg logit agree_4 diff_educ_cont mean_educ_cont, vce(cluster i j)

estout m*, cells(b(star fmt(3)) p(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(bic, fmt(1) label(BIC))
   
eststo m1: quiet clus_nway fracreg logit agree_1 diff_educ_cont, vce(cluster i j)
eststo m2: quiet clus_nway fracreg logit agree_1 mean_educ_cont, vce(cluster i j)
eststo m3: quiet clus_nway fracreg logit agree_1 diff_educ_cont mean_educ_cont, vce(cluster i j)

estout m*, cells(b(star fmt(3)) p(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(bic, fmt(1) label(BIC))
   
********************************


est clear

eststo m1: quiet clus_nway reg agree_1 same_party, vce(cluster i j)
eststo m2: quiet clus_nway reg agree_1 same_region, vce(cluster i j)
eststo m3: quiet clus_nway reg agree_1 same_relig, vce(cluster i j)
eststo m4: quiet clus_nway reg agree_1 same_party same_region same_relig, vce(cluster i j)

estout m*, cells(b(star fmt(3)) p(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(bic, fmt(1) label(BIC))

   
 
