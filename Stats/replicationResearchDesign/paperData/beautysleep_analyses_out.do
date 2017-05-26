use beautysleep_data , clear

/*
sd = sleep deprivation
r_id = rater id
f_id = face id
beauty = attractive
*/

xtmixed beauty sd || _all: R.r_id || _all: R.f_idxtmixed health sd || _all: R.r_id || _all: R.f_idxtmixed tired  sd || _all: R.r_id || _all: R.f_id

