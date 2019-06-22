#!/usr/bin/env bash

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

if [[ ! -f "/etc/yum.repos.d/elasticsearch.repo" ]]; then
    touch /etc/yum.repos.d/elasticsearch.repo

    echo "[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md" >> /etc/yum.repos.d/elasticsearch.repo

fi

yum -y install elasticsearch
service elasticsearch start
chkconfig elasticsearch on
systemctl enable elasticsearch.service
service elasticsearch start



# Data import (existing documents will be updated)
curl -XPOST 'localhost:9200/_bulk?pretty' -H 'Content-Type: application/json' -d'
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 1 } }
{ "first_name": "Jenkins", "last_name": "Gavin", "activity": [ ], "aom" : [ { "name" : "Orthopaedics" }, { "name" : "General Surgery" } ], "authorship" : "N", "badge_investigator" : null, "board_certification" : "Dont Know", "brand_champion" : [ ], "business_city" : "Boston", "clinical_trials" : [ ], "conditions_treated" : [ ], "mdm_country" : "USA", "credentials" : "M.D.", "default_language" : "English", "email_status" : { "mdm_non_limited" : 1, "mdm_limited_valid" : 1, "mdm_limited_expired" : 0, "vendor_enabled" : 4 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : false, "franchise_champion" : [ ], "gender" : "Female", "group_practice" : [ ], "group_practice_stats" : { "type" : { "hospital" : 1, "group_practice" : 0, "solo_practice" : 0 } }, "hospitals" : [ ], "hospital_stats" : { "type" : { "community" : 0, "teaching" : 0 } }, "hospital_type" : "Community", "idn_1" : null, "idn_2" : null, "idn_3" : null, "idn_4" : null, "industry_affinity" : null, "institution" : [ "weill cornellrockefellersloan kettering tri institutional md phd program", "Columbia Hospital", "Columbia University" ], "journals" : [ ], "languages" : [ { "name" : "English" }, { "name" : "Spanish" } ], "languages_spoken_1" : "Spanish", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000002", "107218314" ], "linked_national_ids" : [ { "nid" : "1184773996", "nid_type" : "NPI" } ], "location" : [ { "country" : "Canada", "metro_city" : null }, { "country" : "USA", "metro_city" : "Boston" } ], "location_setting" : "Large metropolitan", "master_specialties" : [ "Orthopaedic Surgery", "Sports Medicine" ], "medical_school" : [ { "name" : "WEILL CORNELL MEDICAL COLLEGE OF CORNELL UNIVERSIT" } ], "lima_metropolitan_city" : "Boston", "practice" : "Hospital", "profession" : [ "Physician" ], "pharma_affinity" : "shy", "recent_publication_date" : null, "scope" : null, "urban_suburban_rural" : null, "nationalid" : "1184773996", "nationalid_type" : "NPI", "pubmed_ids" : [ ], "specialties" : [ { "name" : "Sports Medicine" }, { "name" : "Orthopaedic Surgery" } ], "state_abbr" : "MA", "workplace" : [ { "address" : "Water Street", "city" : "Milford", "state" : "MA", "country" : "USA", "postal_code" : "01757", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : null, "validated" : true }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 2 } }
{ "first_name": "Dedric", "last_name": "Champlin", "activity" : { "day" : { "friday" : 1, "wednesday" : 3 }, "device" : { "Desktop" : 2 }, "os" : { "Windows" : 2 }, "time" : { "11" : 2, "14" : 1, "18" : 1 } }, "aom" : [ { "name" : "Oncology" } ], "authorship" : "Y", "badge_investigator" : null, "board_certification" : "Dont Know", "brand_champion" : [ { "gen_drug" : "nab-paclitaxel" } ], "business_city" : "Sanger", "clinical_trials" : [ ], "conditions_treated" : [ ], "mdm_country" : "USA", "credentials" : "M.D.", "default_language" : "English", "email_status" : { "mdm_non_limited" : 4, "mdm_limited_valid" : 1, "mdm_limited_expired" : 1, "vendor_enabled" : 3 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : true, "franchise_champion" : [ "Celgene Corporation", "EMD Serono, Inc.", "Halozyme Inc" ], "gender" : "Male", "group_practice" : [ { "id" : "64149", "members" : 1239, "org_name" : "UNIVERSITY OF TEXAS M. D. ANDERSON CANCER CENTER", "org_state" : "TX" }, { "id" : "347506", "members" : 1355, "org_name" : "The University of Texas MD Anderson Cancer Center", "org_state" : "TX" }, { "id" : "35007", "members" : 1239, "org_name" : "M. D. ANDERSON CANCER CENTER", "org_state" : "TX" }, { "id" : "26828", "members" : 1334, "org_name" : "PHYSICIANS REFERRAL SERVICE", "org_state" : "TX" }, { "id" : "331230", "members" : 1355, "org_name" : "M D Anderson Cancer Center", "org_state" : "TX" } ], "group_practice_stats" : { "type" : { "hospital" : 2, "group_practice" : 5, "solo_practice" : 0 } }, "hospitals" : [ { "id" : "450076", "beds" : 667 }, { "id" : "340030", "beds" : 891 } ], "hospital_stats" : { "type" : { "community" : 1, "teaching" : 1 } }, "hospital_type" : "Teaching", "idn_1" : "University of Texas Health System", "idn_2" : null, "idn_3" : null, "idn_4" : null, "industry_affinity" : null, "institution" : [ "center for health services research in primary care durham va medical center", "University of Texas MD Anderson Cancer Center Baylor College of Medicine Houston Texas", "WOODLANDS HOSPITAL" ], "journals" : [ { "name" : "Journal of the National Cancer Institute", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "Investigational new drugs", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "Journal of gastrointestinal surgery : official journal of the Society for Surgery of the Alimentary Tract", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "Cancer medicine", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "Endocrinology", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "Cancer chemotherapy and pharmacology", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "Molecular cancer research : MCR", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "Journal of oncology practice / American Society of Clinical Oncology", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "Journal of clinical oncology : official journal of the American Society of Clinical Oncology", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : true, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "International journal of radiation oncology, biology, physics", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : true, "member_aom" : "Oncology", "same_aom" : false }, { "name" : "Molecular pharmaceutics", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Oncology", "same_aom" : true }, { "name" : "Oncotarget", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : true, "member_aom" : "Oncology", "same_aom" : true } ], "languages" : [ { "name" : "English" } ], "languages_spoken_1" : "English", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000011", "103880374" ], "linked_national_ids" : [ { "nid" : "1134233224", "nid_type" : "NPI" } ], "location" : [ { "country" : "USA", "metro_city" : "Houston" }, { "country" : "Canada", "metro_city" : null } ], "location_setting" : "Large metropolitan", "master_specialties" : [ "Oncology" ], "medical_school" : [ { "name" : "UNIVERSITY OF CHICAGO, PRITZKER SCHOOL OF MEDICINE" } ], "lima_metropolitan_city" : "Houston", "practice" : "Group Practice", "profession" : [ "Physician" ], "pharma_affinity" : "champion", "recent_publication_date" : "2017-04-04", "scope" : "National Leader", "urban_suburban_rural" : "Urban Cluster", "nationalid" : "1134233224", "nationalid_type" : "NPI", "pubmed_ids" : [ 23129736, 23134473, 23260327, 23300339, 23340292, 23397153, 23408126, 23645398, 23728494, 23776098, 23776447, 23821538, 24051705, 24111684, 24129825, 24139211, 24168499, 24241967, 24279986, 24362026, 24401634, 24418153, 24418850, 24443736, 24614108, 24746206, 24815863, 24982449, 25427073, 25936695, 26062928, 26126726, 26275671, 26304898, 26693076, 26725729, 26759461, 26934122, 26951228, 27690692, 27778257, 27986802, 28376157, 28507210 ], "specialties" : [ { "name" : "Oncology" } ], "state_abbr" : "TX", "workplace" : [ { "address" : "Holcombe Boulevard", "city" : "Houston", "state" : "TX", "country" : "USA", "postal_code" : "77030", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : 40, "validated" : false }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 3 } }
{ "first_name": "Kirlin", "last_name": "Octavia", "activity" : [ ], "aom" : [ { "name" : "Oncology" }, { "name" : "Haematology" }, { "name" : "Haematology-Oncology" } ], "authorship" : "N", "badge_investigator" : null, "board_certification" : "Dont Know", "brand_champion" : [ ], "business_city" : "Williamsport", "clinical_trials" : [ ], "conditions_treated" : [ ], "mdm_country" : "USA", "credentials" : "MD", "default_language" : "English", "email_status" : { "mdm_non_limited" : 1, "mdm_limited_valid" : 1, "mdm_limited_expired" : 0, "vendor_enabled" : 0 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : false, "franchise_champion" : [ ], "gender" : "Male", "group_practice" : [ { "id" : "268991", "members" : 58, "org_name" : "DIVINE PROVIDENCE HOSPITAL OF THE SISTERS OF CHRISTIAN CHARITY", "org_state" : "PA" }, { "id" : "173043", "members" : 58, "org_name" : "DIVINE PROVIDENCE HOSPITAL OF THE SISTERS OF CHRISTIAN CHARITY", "org_state" : "PA" }, { "id" : "32114", "members" : 58, "org_name" : "DIVINE PROVIDENCE HOSPITAL OF THE SISTERS OF CHRISTIAN CHARITY", "org_state" : "PA" }, { "id" : "50655", "members" : 65, "org_name" : "CANCER TREATMENT ASSOCIATES, PC", "org_state" : "PA" }, { "id" : "92896", "members" : 58, "org_name" : "DIVINE PROVIDENCE HOSPITAL OF THE SISTERS OF CHRISTIAN CHARITY", "org_state" : "PA" }, { "id" : "293030", "members" : 58, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "27817", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "315960", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "60819", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "263728", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "49264", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "331182", "members" : 58, "org_name" : "JOHN V CALCE MD PC", "org_state" : "PA" }, { "id" : "277916", "members" : 58, "org_name" : "DIVINE PROVIDENCE HOSPITAL OF THE SISTERS OF CHRISTIAN CHARITY", "org_state" : "PA" }, { "id" : "101311", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "288473", "members" : 58, "org_name" : "DIVINE PROVIDENCE HOSPITAL OF THE SISTERS OF CHRISTIAN CHARITY", "org_state" : "PA" }, { "id" : "219737", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "222571", "members" : 58, "org_name" : "MARCUS RIEDHAMMER, MD, PC", "org_state" : "PA" }, { "id" : "8279", "members" : 58, "org_name" : "DIVINE PROVIDENCE HOSPITAL OF THE SISTERS OF CHRISTIAN CHARITY", "org_state" : "PA" }, { "id" : "227573", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "324453", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "86867", "members" : 65, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" }, { "id" : "126173", "members" : 58, "org_name" : "SUSQUEHANNA PHYSICIAN SERVICES", "org_state" : "PA" } ], "group_practice_stats" : { "type" : { "hospital" : 0, "group_practice" : 22, "solo_practice" : 0 } }, "hospitals" : [ ], "hospital_stats" : { "type" : { "community" : 0, "teaching" : 0 } }, "hospital_type" : "Community", "idn_1" : null, "idn_2" : null, "idn_3" : null, "idn_4" : null, "industry_affinity" : null, "institution" : [ "WILLIAMSPORT HOSPITAL", "WILLIAMSPORT HOSPITAL AND MEDICAL CENTER", "Pine Creek Internal Medicine" ], "journals" : [ ], "languages" : [ { "name" : "English" }, { "name" : "Spanish" } ], "languages_spoken_1" : "Spanish", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000020", "100493535", "103989097" ], "linked_national_ids" : [ { "nid" : "1861451759", "nid_type" : "NPI" } ], "location" : [ { "country" : "USA", "metro_city" : "Philadelphia" }, { "country" : "Canada", "metro_city" : null } ], "location_setting" : "Large metropolitan", "master_specialties" : [ "Oncology", "Haematology" ], "medical_school" : [ ], "lima_metropolitan_city" : "Philadelphia", "practice" : "Group Practice", "profession" : [ "Physician" ], "pharma_affinity" : "shy", "recent_publication_date" : null, "scope" : null, "urban_suburban_rural" : "Urbanized Area", "nationalid" : "1861451759", "nationalid_type" : "NPI", "pubmed_ids" : [ ], "specialties" : [ { "name" : "Haematology-Oncology" }, { "name" : "Oncology" } ], "state_abbr" : "PA", "workplace" : [ { "address" : "Grampian Boulevard", "city" : "Williamsport", "state" : "PA", "country" : "USA", "postal_code" : "17701", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : null, "validated" : true }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 4 } }
{ "first_name": "Forn", "last_name": "Harris", "activity" : { "day" : { "friday" : 2, "tuesday" : 1 }, "device" : { "Desktop" : 1, "Tablet" : 1 }, "os" : { "iOS" : 1, "Windows" : 1 }, "time" : { "21" : 1, "7" : 2 } }, "aom" : [ { "name" : "Nephrology" } ], "authorship" : "Y", "badge_investigator" : "Lead Investigator", "board_certification" : "No", "brand_champion" : [ ], "business_city" : "Charlottesville", "clinical_trials" : [ { "study_id" : 210602, "title" : "Determine the Safety/Efficacy of Ticagrelor for Maintaining Patency of Arterio-Venous Fistulae Created for Hemodialysis", "enrollment_date" : "2014-12-01", "role" : "Lead Investigator", "investigators" : [ { "name_degree" : "Emaad M Abdel-Rahman, MD, PhD", "role" : "Principal Investigator" }, { "name_degree" : "Jane Bopp, RN, FNP", "role" : "Sub-Investigator" }, { "name_degree" : "Rasheed A Balogun, MD", "role" : "Sub-Investigator" }, { "name_degree" : "Sharon F Johnson, BA, CCRC", "role" : "Sub-Investigator" }, { "name_degree" : "Warren K Bolton, MD", "role" : "Sub-Investigator" } ] } ], "conditions_treated" : [ ], "mdm_country" : "USA", "credentials" : null, "default_language" : "English", "email_status" : { "mdm_non_limited" : 1, "mdm_limited_valid" : 0, "mdm_limited_expired" : 1, "vendor_enabled" : 4 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : true, "franchise_champion" : [ "University of Virginia" ], "gender" : "Male", "group_practice" : [ ], "group_practice_stats" : { "type" : { "hospital" : 2, "group_practice" : 0, "solo_practice" : 0 } }, "hospitals" : [ { "id" : "490009", "beds" : 547 }, { "id" : "490021", "beds" : 433 } ], "hospital_stats" : { "type" : { "community" : 0, "teaching" : 1 } }, "hospital_type" : "Teaching", "idn_1" : null, "idn_2" : null, "idn_3" : null, "idn_4" : null, "industry_affinity" : null, "institution" : [ "The Spine and Sports Health Center", "Uva Health South Rehabilitation Hospital", "UVA hospital" ], "journals" : [ { "name" : "American journal of kidney diseases : the official journal of the National Kidney Foundation", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : true, "member_aom" : "Nephrology", "same_aom" : true }, { "name" : "Journal of nephrology", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : false, "member_aom" : "Nephrology", "same_aom" : true }, { "name" : "Journal of the American Geriatrics Society", "is_top_tier_journal_contributor" : true, "is_top_tier_journal" : true, "member_aom" : "Nephrology", "same_aom" : false } ], "languages" : [ { "name" : "English" } ], "languages_spoken_1" : "English", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000021" ], "linked_national_ids" : [ { "nid" : "1164591780", "nid_type" : "NPI" } ], "location" : [ { "country" : "Canada", "metro_city" : null }, { "country" : "USA", "metro_city" : "Charlottesville" } ], "location_setting" : "Small urban areas", "master_specialties" : [ "Nephrology" ], "medical_school" : [ ], "lima_metropolitan_city" : "Charlottesville", "practice" : "Hospital", "profession" : [ "Physician" ], "pharma_affinity" : "champion", "recent_publication_date" : "2016-12-19", "scope" : null, "urban_suburban_rural" : "Urbanized Area", "nationalid" : "1164591780", "nationalid_type" : "NPI", "pubmed_ids" : [ 23420599, 25343814, 25791960, 27307250, 27991648 ], "specialties" : [ { "name" : "Nephrology" } ], "state_abbr" : "VA", "workplace" : [ { "address" : "Lee Street", "city" : "Charlottesville", "state" : "VA", "country" : "USA", "postal_code" : "22903", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : 36, "validated" : true }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 5 } }
{ "first_name": "Ernesto", "last_name": "Hintz", "activity" : [ ], "aom" : [ { "name" : "Orthopaedics" }, { "name" : "General Surgery" } ], "authorship" : "N", "badge_investigator" : null, "board_certification" : "No", "brand_champion" : [ ], "business_city" : "Mesquite", "clinical_trials" : [ ], "conditions_treated" : [ ], "mdm_country" : "USA", "credentials" : "M.D.", "default_language" : "English", "email_status" : { "mdm_non_limited" : 1, "mdm_limited_valid" : 0, "mdm_limited_expired" : 1, "vendor_enabled" : 2 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : false, "franchise_champion" : [ ], "gender" : "Male", "group_practice" : [ ], "group_practice_stats" : { "type" : { "hospital" : 0, "group_practice" : 0, "solo_practice" : 0 } }, "hospitals" : [ { "id" : "450688", "beds" : 176 }, { "id" : "670060", "beds" : 70 } ], "hospital_stats" : { "type" : { "community" : 1, "teaching" : 0 } }, "hospital_type" : "Community", "idn_1" : "Tenet Healthcare Corporation", "idn_2" : "Community Health Systems", "idn_3" : "Baylor Scott & White", "idn_4" : null, "industry_affinity" : null, "institution" : [ "DALLAS REG MED CTR", "institute and clinical center" ], "journals" : [ ], "languages" : [ { "name" : "English" } ], "languages_spoken_1" : "English", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000027" ], "linked_national_ids" : [ { "nid" : "1619083326", "nid_type" : "NPI" } ], "location" : [ { "country" : "Canada", "metro_city" : null }, { "country" : "USA", "metro_city" : "Dallas" } ], "location_setting" : "Large metropolitan", "master_specialties" : [ "Orthopaedic Surgery" ], "medical_school" : [ { "name" : "AMERICAN UNIV OF BEIRUT, FAC OF MED, BEIRUT, LEBAN" } ], "lima_metropolitan_city" : "Dallas", "practice" : "Solo Practice", "profession" : [ "Physician" ], "pharma_affinity" : "cordial", "recent_publication_date" : null, "scope" : null, "urban_suburban_rural" : "Urbanized Area",  "nationalid" : "1619083326", "nationalid_type" : "NPI", "pubmed_ids" : [ ], "specialties" : [ { "name" : "Orthopaedic Surgery" } ], "state_abbr" : "TX", "workplace" : [ { "address" : "North Galloway Avenue", "city" : "Mesquite", "state" : "TX", "country" : "USA", "postal_code" : "75150", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : 42, "validated" : true }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 6 } }
{ "first_name": "Phil", "last_name": "Coulson", "activity" : { "day" : { "friday" : 2, "monday" : 1, "saturday" : 2, "sunday" : 4, "thursday" : 3, "tuesday" : 6, "wednesday" : 4 }, "device" : { "Desktop" : 6, "Smartphone" : 11 }, "os" : { "iOS" : 11, "Mac" : 6 }, "time" : { "10" : 2, "12" : 4, "13" : 1, "15" : 1, "16" : 1, "17" : 4, "18" : 1, "20" : 1, "6" : 1, "8" : 3, "9" : 3 } }, "aom" : [ { "name" : "Respirology/Pulmonology" } ], "authorship" : "N", "badge_investigator" : null, "board_certification" : "Yes", "brand_champion" : [ ], "business_city" : "Ogden", "clinical_trials" : [ ], "conditions_treated" : [ ], "mdm_country" : "USA", "credentials" : "MD", "default_language" : "English", "email_status" : { "mdm_non_limited" : 1, "mdm_limited_valid" : 3, "mdm_limited_expired" : 2, "vendor_enabled" : 5 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : false, "franchise_champion" : [ ], "gender" : "Male", "group_practice" : [ { "id" : "232971", "members" : 5, "org_name" : "OGDEN ORTHOPAEDIC SPECIALISTS LLC", "org_state" : "UT" } ], "group_practice_stats" : { "type" : { "hospital" : 4, "group_practice" : 1, "solo_practice" : 0 } }, "hospitals" : [ { "id" : "460004", "beds" : 249 }, { "id" : "460017", "beds" : 40 }, { "id" : "460005", "beds" : 164 } ], "hospital_stats" : { "type" : { "community" : 1, "teaching" : 1 } }, "hospital_type" : "Teaching", "idn_1" : "Hospital Corporation of America", "idn_2" : null, "idn_3" : null, "idn_4" : null, "industry_affinity" : null, "institution" : [ "MCKAY-DEE HOSPITAL CENTER", "intermountain healthcare", "Ogden Regional Medical Center" ], "journals" : [ ], "languages" : [ { "name" : "English" } ], "languages_spoken_1" : "English", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000063" ], "linked_national_ids" : [ { "nid" : "1730129941", "nid_type" : "NPI" } ], "location" : [ { "country" : "USA", "metro_city" : "Ogden and Layton" } ], "location_setting" : "Medium-sized urban areas", "master_specialties" : [ "Respirology/Pulmonology" ], "medical_school" : [ { "name" : "INDIANA UNIVERSITY SCHOOL OF MEDICINE" } ], "lima_metropolitan_city" : "Ogden and Layton", "practice" : "Group Practice", "profession" : [ "Physician" ], "pharma_affinity" : "cordial", "recent_publication_date" : null, "scope" : null, "urban_suburban_rural" : "Urbanized Area", "nationalid" : "1730129941", "nationalid_type" : "NPI", "pubmed_ids" : [ ], "specialties" : [ { "name" : "Respirology/Pulmonology" } ], "state_abbr" : "UT", "workplace" : [ { "address" : "Harrison Boulevard", "city" : "Ogden", "state" : "UT", "country" : "USA", "postal_code" : "84403", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : 38, "validated" : true }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 7 } }
{ "first_name": "Melinda", "last_name": "May", "activity" : [ ], "aom" : [ { "name" : "GPs/PCPs" } ], "authorship" : "N", "badge_investigator" : null, "board_certification" : "Dont Know", "brand_champion" : [ ], "business_city" : "Greenacres", "clinical_trials" : [ ], "conditions_treated" : [ ], "mdm_country" : "USA", "credentials" : "MD", "default_language" : "English", "email_status" : { "mdm_non_limited" : 0, "mdm_limited_valid" : 1, "mdm_limited_expired" : 1, "vendor_enabled" : 3 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : false, "franchise_champion" : [ ], "gender" : "Male", "group_practice" : [ { "id" : "246144", "members" : 6, "org_name" : "BREATHING DISORDER CENTERS LLC", "org_state" : "FL" }, { "id" : "51773", "members" : 7, "org_name" : "WILMAR MEDICAL CORP", "org_state" : "FL" }, { "id" : "254463", "members" : 6, "org_name" : "DJP VIP ENTERPRISES LLC", "org_state" : "FL" }, { "id" : "291293", "members" : 6, "org_name" : "WILKENS MONDESIR MD, PA", "org_state" : "FL" }, { "id" : "106845", "members" : 6, "org_name" : "WOMENS PAVILION OF THE PALM BEACHES INC", "org_state" : "FL" }, { "id" : "192211", "members" : 6, "org_name" : "MARIE BIBLONDE JOSEPH DPM PA", "org_state" : "FL" }, { "id" : "131093", "members" : 6, "org_name" : "LAKE WORTH CARDIOLOGY CONSULTANTS LLC", "org_state" : "FL" }, { "id" : "134642", "members" : 6, "org_name" : "TRI COUNTY IPA, INC", "org_state" : "FL" }, { "id" : "295751", "members" : 6, "org_name" : "MFDA ENTERPRISES LLC", "org_state" : "FL" } ], "group_practice_stats" : { "type" : { "hospital" : 0, "group_practice" : 9, "solo_practice" : 0 } }, "hospitals" : [ { "id" : "100287", "beds" : 333 } ], "hospital_stats" : { "type" : { "community" : 1, "teaching" : 0 } }, "hospital_type" : "Community", "idn_1" : "Tenet Healthcare Corporation", "idn_2" : null, "idn_3" : null, "idn_4" : null, "industry_affinity" : null, "institution" : [ "Miles Hospital", "good samaritan medical center" ], "journals" : [ ], "languages" : [ { "name" : "English" }, { "name" : "Spanish" } ], "languages_spoken_1" : "Spanish", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000071" ], "linked_national_ids" : [ { "nid" : "1083698401", "nid_type" : "NPI" } ], "location" : [ { "country" : "USA", "metro_city" : null }, { "country" : "Canada", "metro_city" : null } ], "location_setting" : null, "master_specialties" : [ "GPs/FPs" ], "medical_school" : [ { "name" : "UNIV DETAT DHAITI, ESC DE MED ET DE PHARMACIE, P" } ], "lima_metropolitan_city" : null, "practice" : "Group Practice", "profession" : [ "Physician" ], "pharma_affinity" : "cordial", "recent_publication_date" : null, "scope" : null, "urban_suburban_rural" : "Urbanized Area",  "nationalid" : "1083698401", "nationalid_type" : "NPI", "pubmed_ids" : [ ], "specialties" : [ { "name" : "Family Practice" } ], "state_abbr" : "FL", "workplace" : [ { "address" : "Lake Worth Road", "city" : "Greenacres", "state" : "FL", "country" : "USA", "postal_code" : "33463", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : 49, "validated" : true }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 8 } }
{ "first_name": "Grant", "last_name": "Ward", "activity" : [ ], "aom" : [ { "name" : "Respirology/Pulmonology" }, { "name" : "Internal Medicine" } ], "authorship" : "N", "badge_investigator" : null, "board_certification" : "Yes", "brand_champion" : [ ], "business_city" : "Ogden", "clinical_trials" : [ ], "conditions_treated" : [ ], "mdm_country" : "USA", "credentials" : "MD", "default_language" : "English", "email_status" : { "mdm_non_limited" : 0, "mdm_limited_valid" : 1, "mdm_limited_expired" : 0, "vendor_enabled" : 3 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : false, "franchise_champion" : [ ], "gender" : "Male", "group_practice" : [ ], "group_practice_stats" : { "type" : { "hospital" : 2, "group_practice" : 0, "solo_practice" : 0 } }, "hospitals" : [ { "id" : "460004", "beds" : 249 } ], "hospital_stats" : { "type" : { "community" : 0, "teaching" : 1 } }, "hospital_type" : "Teaching", "idn_1" : null, "idn_2" : null, "idn_3" : null, "idn_4" : null, "industry_affinity" : null, "institution" : [ "McKay-Dee Surgery Center", "MCKAY-DEE HOSPITAL CENTER", "McKay-Dee Hospital" ], "journals" : [ ], "languages" : [ { "name" : "English" } ], "languages_spoken_1" : "English", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000042" ], "linked_national_ids" : [ { "nid" : "1720025281", "nid_type" : "NPI" } ], "location" : [ { "country" : "USA", "metro_city" : "Ogden and Layton" } ], "location_setting" : "Medium-sized urban areas", "master_specialties" : [ "Respirology/Pulmonology", "Internal Medicine" ], "medical_school" : [ { "name" : "MIAMI MEDICAL COLLEGE" } ], "lima_metropolitan_city" : "Ogden and Layton", "practice" : "Hospital", "profession" : [ "Physician" ], "pharma_affinity" : "cordial", "recent_publication_date" : null, "scope" : null, "urban_suburban_rural" : "Urbanized Area", "nationalid" : "1720025281", "nationalid_type" : "NPI", "pubmed_ids" : [ ], "specialties" : [ { "name" : "Respirology/Pulmonology" }, { "name" : "Internal Medicine" } ], "state_abbr" : "UT", "workplace" : [ { "address" : "Harrison Boulevard", "city" : "Ogden", "state" : "UT", "country" : "USA", "postal_code" : "84403", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : 46, "validated" : true }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 9 } }
{ "first_name": "Daisy", "last_name": "Johnson", "activity" : { "day" : { "friday" : 12, "monday" : 19, "saturday" : 3, "sunday" : 3, "thursday" : 11, "tuesday" : 15, "wednesday" : 2 }, "device" : { "Desktop" : 32, "Smartphone" : 27 }, "os" : { "iOS" : 27, "Mac" : 32 }, "time" : { "13" : 1, "14" : 7, "15" : 2, "16" : 1, "17" : 3, "18" : 2, "19" : 3, "20" : 2, "21" : 5, "23" : 1, "3" : 3, "4" : 1, "5" : 5, "6" : 11, "7" : 12, "8" : 4, "9" : 2 } }, "aom" : [ { "name" : "Respirology/Pulmonology" }, { "name" : "Emergency Medicine" }, { "name" : "Internal Medicine" } ], "authorship" : "N", "badge_investigator" : null, "board_certification" : "Dont Know", "brand_champion" : [ ], "business_city" : "Torrance", "clinical_trials" : [ ], "conditions_treated" : [ "Fungal Infections" ], "mdm_country" : "USA", "credentials" : "MD", "default_language" : "English", "email_status" : { "mdm_non_limited" : 1, "mdm_limited_valid" : 1, "mdm_limited_expired" : 0, "vendor_enabled" : 2 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : false, "franchise_champion" : [ ], "gender" : "Male", "group_practice" : [ ], "group_practice_stats" : { "type" : { "hospital" : 0, "group_practice" : 0, "solo_practice" : 0 } }, "hospitals" : [ { "id" : "IR250717", "beds" : 398 }, { "id" : "050351", "beds" : 609 }, { "id" : "050353", "beds" : 327 } ], "hospital_stats" : { "type" : { "community" : 1, "teaching" : 0 } }, "hospital_type" : "Community", "idn_1" : null, "idn_2" : null, "idn_3" : null, "idn_4" : null, "industry_affinity" : null, "institution" : [ "BAYLEY SETON HOSP" ], "journals" : [ ], "languages" : [ { "name" : "English" } ], "languages_spoken_1" : "English", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000052" ], "linked_national_ids" : [ { "nid" : "1578542569", "nid_type" : "NPI" } ], "location" : [ { "country" : "USA", "metro_city" : "Los Angeles" } ], "location_setting" : "Large metropolitan", "master_specialties" : [ "Emergency/CC/IC Medicine", "Respirology/Pulmonology", "Internal Medicine" ], "medical_school" : [ { "name" : "HAHNEMANN UNIVERSITY COLLEGE OF MEDICINE" } ], "lima_metropolitan_city" : "Los Angeles", "practice" : null, "profession" : [ "Physician" ], "pharma_affinity" : "cordial", "recent_publication_date" : null, "scope" : null, "urban_suburban_rural" : "Urbanized Area", "nationalid" : "1578542569", "nationalid_type" : "NPI", "pubmed_ids" : [ ], "specialties" : [ { "name" : "Respirology/Pulmonology" }, { "name" : "Critical Care Medicine" }, { "name" : "Internal Medicine" } ], "state_abbr" : "CA", "workplace" : [ { "address" : "Skypark Drive", "city" : "Torrance", "state" : "CA", "country" : "USA", "postal_code" : "90505", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : 27, "validated" : false }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 10 } }
{ "first_name": "Leo", "last_name": "Fitz", "activity" : [ ], "aom" : [ { "name" : "Rheumatology" } ], "authorship" : "N", "badge_investigator" : null, "board_certification" : "Yes", "brand_champion" : [ ], "business_city" : "Oakland", "clinical_trials" : [ ], "conditions_treated" : [ ], "mdm_country" : "USA", "credentials" : "MD", "default_language" : "English", "email_status" : { "mdm_non_limited" : 1, "mdm_limited_valid" : 3, "mdm_limited_expired" : 1, "vendor_enabled" : 1 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : false, "franchise_champion" : [ ], "gender" : "Male", "group_practice" : [ ], "group_practice_stats" : { "type" : { "hospital" : 0, "group_practice" : 0, "solo_practice" : 1 } }, "hospitals" : [ { "id" : "050488", "beds" : 130 }, { "id" : "050042", "beds" : 76 } ], "hospital_stats" : { "type" : { "community" : 1, "teaching" : 0 } }, "hospital_type" : "Community", "idn_1" : "Sutter Health", "idn_2" : null, "idn_3" : null, "idn_4" : null, "industry_affinity" : null, "institution" : [ "Clínica Ginecológica Cire", "Kaiser San Jose", "university of california san francisco benioff children hospital" ], "journals" : [ ], "languages" : [ { "name" : "English" } ], "languages_spoken_1" : "English", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000060", "104489170" ], "linked_national_ids" : [ { "nid" : "1871679399", "nid_type" : "NPI" } ], "location" : [ { "country" : "USA", "metro_city" : "San Francisco" } ], "location_setting" : "Large metropolitan", "master_specialties" : [ "Rheumatology" ], "medical_school" : [ { "name" : "MC GILL UNIV, FAC OF MED, MONTREAL, QUE, CANADA" } ], "lima_metropolitan_city" : "San Francisco", "practice" : "Solo Practice", "profession" : [ "Physician" ], "pharma_affinity" : "cordial", "recent_publication_date" : null, "scope" : null, "urban_suburban_rural" : "Urbanized Area", "nationalid" : "1871679399", "nationalid_type" : "NPI", "pubmed_ids" : [ ], "specialties" : [ { "name" : "Rheumatology" } ], "state_abbr" : "CA", "workplace" : [ { "address" : "Palos Verdes Drive", "city" : "Monte Sereno", "state" : "CA", "country" : "USA", "postal_code" : "95030", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : 47, "validated" : true }
{ "index" : { "_index" : "participantes", "_type" : "_doc", "_id" : 11 } }
{ "first_name": "Jemma", "last_name": "Simmons", "activity" : [ ], "aom" : [ { "name" : "Emergency Medicine" }, { "name" : "Respirology/Pulmonology" } ], "authorship" : "N", "badge_investigator" : null, "board_certification" : "Dont Know", "brand_champion" : [ ], "business_city" : "Saint Petersburg", "clinical_trials" : [ ], "conditions_treated" : [ "H. Pylori-Ulcer" ], "mdm_country" : "USA", "credentials" : "MD", "default_language" : "English", "email_status" : { "mdm_non_limited" : 0, "mdm_limited_valid" : 5, "mdm_limited_expired" : 2, "vendor_enabled" : 4 }, "flag_addressable" : true, "flag_directory" : true, "flag_email" : true, "flag_enabled" : true, "flag_limadb" : true, "flag_franchise_champion" : false, "franchise_champion" : [ ], "gender" : "Male", "group_practice" : [ ], "group_practice_stats" : { "type" : { "hospital" : 5, "group_practice" : 0, "solo_practice" : 0 } }, "hospitals" : [ { "id" : "100126", "beds" : 167 }, { "id" : "100067", "beds" : 349 }, { "id" : "100075", "beds" : 1006 }, { "id" : "100032", "beds" : 319 } ], "hospital_stats" : { "type" : { "community" : 1, "teaching" : 1 } }, "hospital_type" : "Teaching", "idn_1" : "Trinity Health", "idn_2" : "Hospital Corporation of America", "idn_3" : "Community Health Systems", "idn_4" : null, "industry_affinity" : null, "institution" : [ "saint petersburg state university", "St Anthony Hospital North", "Suncoast Medical Clinic" ], "journals" : [ ], "languages" : [ { "name" : "English" } ], "languages_spoken_1" : "English", "languages_spoken_2" : "", "leadership_badge" : null, "level" : null, "linked_member_ids" : [ "100000062", "103061546" ], "linked_national_ids" : [ { "nid" : "1912939067", "nid_type" : "NPI" } ], "location" : [ { "country" : "USA", "metro_city" : "Clearwater/Saint Petersburg" }, { "country" : "Canada", "metro_city" : null } ], "location_setting" : "Metropolitan areas", "master_specialties" : [ "Emergency/CC/IC Medicine", "Respirology/Pulmonology" ], "medical_school" : [ { "name" : "UNIVERSITY OF SOUTH FLORIDA COLLEGE OF MEDICINE" } ], "lima_metropolitan_city" : "Clearwater/Saint Petersburg", "practice" : "Hospital", "profession" : [ "Physician" ], "pharma_affinity" : "cordial", "recent_publication_date" : null, "scope" : null, "urban_suburban_rural" : "Urbanized Area", "nationalid" : "1912939067", "nationalid_type" : "NPI", "pubmed_ids" : [ ], "specialties" : [ { "name" : "Critical Care Medicine" }, { "name" : "Respirology/Pulmonology" } ], "state_abbr" : "FL", "workplace" : [ { "address" : "2639 Doctor Martin Luther King Junior Street North", "city" : "Saint Petersburg", "state" : "FL", "country" : "USA", "postal_code" : "33704", "phone" : null, "workplace" : null, "institution" : null } ], "years_in_practice" : 33, "validated" : true }
'
