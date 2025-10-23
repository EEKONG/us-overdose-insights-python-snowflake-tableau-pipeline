DROP TABLE "accident_deaths_data"

CREATE TABLE "accident_deaths_data" (
    "event_date" TIMESTAMP,
    "date_type" VARCHAR,
    "age" INTEGER,
    "sex" VARCHAR,
    "race" VARCHAR,
    "ethnicity" VARCHAR,
    "residence_city" VARCHAR,
    "residence_county" VARCHAR,
    "residence_state" VARCHAR,
    "injury_city" VARCHAR,
    "injury_county" VARCHAR,
    "injury_state" VARCHAR,
    "death_city" VARCHAR,
    "location" VARCHAR,
    "cause_of_death" VARCHAR,
    "manner_of_death" VARCHAR,
    "heroin" INTEGER,
    "cocaine" INTEGER,
    "fentanyl" INTEGER,
    "fentanyl_analogue" INTEGER,
    "oxycodone" INTEGER,
    "oxymorphone" INTEGER,
    "ethanol" INTEGER,
    "hydrocodone" INTEGER,
    "benzodiazepine" INTEGER,
    "methadone" INTEGER,
    "methamphetamine" INTEGER,
    "amphet" INTEGER,
    "tramad" INTEGER,
    "hydromorphone" INTEGER,
    "morphine_not_heroin" INTEGER,
    "xylazine" INTEGER,
    "gabapentin" INTEGER,
    "opiate_nos" INTEGER,
    "heroinmorphcodeine" INTEGER,
    "any_opioid" INTEGER,
    "rc_latitude" FLOAT,
    "rc_longitude" FLOAT,
    "ic_latitude" FLOAT,
    "ic_longitude" FLOAT,
    "dc_latitude" FLOAT,
    "dc_longitude" FLOAT,
    "event_year" INTEGER
);

SELECT * FROM "accident_deaths_data";


-- create a sumamarized view that would make visualizing with Tableau easier
CREATE OR REPLACE VIEW ACCIDENTAL_DEATH_SUMMARY AS 
SELECT

    /* --- time --- */
    "event_year",
    "event_date",
    EXTRACT(MONTH FROM "event_date") AS "event_month",
    "date_type",
    
    /* --- demographics --- */
    "sex",
    "race",
    "ethnicity",
    AVG("age") AS avg_age,


    /* --- location --- */
    "residence_city",
    "residence_county",
    "residence_state",
    "injury_city",
    "injury_county",
    "injury_state",
    "death_city",
    "location",
    
    /* --- substance aggregates --- */
    sum("any_opioid") AS total_opioid_cases,
    sum("fentanyl") AS total_fentanyl_cases,
    sum("heroin") AS total_heroin_cases,
    sum("cocaine") AS total_cocaine_cases,
    sum("methamphetamine") AS total_meth_cases,
    sum("ethanol") AS total_ethanol_cases,

    /* --- other drugs --- */
    sum("oxycodone") AS total_oxycodone,
    sum("oxymorphone") AS total_oxymorphone,
    sum("hydrocodone") AS total_hydrocodone,
    sum("benzodiazepine") AS total_benzo,
    sum("methadone") AS total_methadone,
    sum("tramad") AS total_tramad,
    sum("amphet") AS total_amphet,
    sum("xylazine") AS total_xylazine,
    sum("gabapentin") AS total_gabapentin,
    sum("morphine_not_heroin") AS total_morphine,
    sum("heroinmorphcodeine") AS total_heroinmorphcodeine,
    
    /* --- death details --- */
    "cause_of_death",
    "manner_of_death",
    
    /* --- geo averages (for mapping) --- */
    avg("rc_latitude") AS avg_residence_lat,
    avg("rc_longitude") AS avg_residence_long,
    avg("ic_latitude") AS avg_injury_lat,
    avg("ic_longitude") AS avg_injury_long,
    avg("dc_latitude") AS avg_death_lat,
    avg("dc_longitude") AS avg_death_long,

    /* --- counts --- */
    count(*) AS total_cases

FROM "accident_deaths_data"
GROUP BY
    "event_year", "event_date", EXTRACT(MONTH FROM "event_date"), "date_type",
    "sex", "race", "ethnicity",
    "residence_city", "residence_county", "residence_state",
    "injury_city", "injury_county", "injury_state",
    "death_city", "location",
    "cause_of_death", "manner_of_death";



SELECT * FROM ACCIDENTAL_DEATH_SUMMARY
-- SELECT * FROM "accident_deaths_data" where "residence_city" = 'Zionsville'


CREATE OR REPLACE VIEW DRUG_SUM_SUMMARY AS
SELECT 
"event_year",
    /* --- substance aggregates --- */
   sum("any_opioid") AS total_opioid_cases,
    sum("fentanyl") AS total_fentanyl_cases,
    sum("heroin") AS total_heroin_cases,
    sum("cocaine") AS total_cocaine_cases,
    sum("methamphetamine") AS total_meth_cases,
    sum("ethanol") AS total_ethanol_cases,

    /* --- other drugs --- */
   sum("oxycodone") AS total_oxycodone,
    sum("oxymorphone") AS total_oxymorphone,
    sum("hydrocodone") AS total_hydrocodone,
    sum("benzodiazepine") AS total_benzo,
    sum("methadone") AS total_methadone,
    sum("tramad") AS total_tramad,
    sum("amphet") AS total_amphet,
    sum("xylazine") AS total_xylazine,
    sum("gabapentin") AS total_gabapentin,
    sum("morphine_not_heroin") AS total_morphine,
    sum("heroinmorphcodeine") AS total_heroinmorphcodeine,,
FROM "accident_deaths_data"
GROUP BY "event_year"


SELECT * FROM DRUG_SUM_SUMMARY