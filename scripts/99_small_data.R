# Small data for reporting analyses -------------------------------------------
#
#
#
# -----------------------------------------------------------------------------




# Load things -----------------------------------------------------------------

source(here::here("scripts", "04_load_data.R"))
prof_use <- read_csv(here("data", "tidy", "prof_use.csv"))

# Load model tibbles
prof_use_desc             <- read_csv(here("tables", "tab_prof_use_desc.csv"))
prof_use_mod              <- read_csv(here("tables", "tab_prof_use_mod.csv"))
group_gamm_tib            <- read_csv(here("tables", "tab_group_gamm_mod.csv"))
group_prediction_tib      <- read_csv(here("tables", "tab_group_prediction.csv"))
group_marginal_slopes_tib <- read_csv(here("tables", "tab_group_marginal_slopes.csv"))
bi_gamm_tib               <- read_csv(here("tables", "tab_bi_gamm_mod.csv"))
bi_zoid_tib               <- read_csv(here("tables", "tab_bi_zoid_mod.csv"))
bi_zoid_marginals_tib     <- read_csv(here("tables", "tab_bi_zoid_marginals.csv")) 


# -----------------------------------------------------------------------------




# Small data ------------------------------------------------------------------

#
# Subject stuff
#
subject_stuff <- list(
  n_removed = prof_use %>% filter(remove == 1) %>% nrow,
  n_final   = stress_50$id %>% unique %>% length, 
  n_total   = prof_use %>% filter(remove == 1) %>% nrow + 
              stress_50$id %>% unique %>% length, 
  n_groups  = stress_50 %>% group_by(group) %>% summarize(n = n_distinct(id))
)


#
# Session stuff
#

session_info  <- sessionInfo()$R.version$version %>% 
  substr(., start = 3, stop = 15)

# -----------------------------------------------------------------------------
