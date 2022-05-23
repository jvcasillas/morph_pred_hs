# Small data for reporting analyses -------------------------------------------
#
#
#
# -----------------------------------------------------------------------------




# Load things -----------------------------------------------------------------

source(here::here("scripts", "04_load_data.R"))
prof_use <- read_csv(here("data", "tidy", "prof_use.csv"))

prof_use_desc <- read_csv(here("tables", "tab_prof_use_desc.csv"))
prof_use_mod  <- read_csv(here("tables", "tab_prof_use_mod.csv"))

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

# -----------------------------------------------------------------------------
