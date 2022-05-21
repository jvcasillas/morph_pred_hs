# Load data -------------------------------------------------------------------
# author: Joseph V. Casillas
# Last update: 20220515
# -----------------------------------------------------------------------------




# Load libraries and helpers --------------------------------------------------
source(here::here("scripts", "00_libraries.R"))
source(here::here("scripts", "01_helpers.R"))
# -----------------------------------------------------------------------------




# Load individual data frames -------------------------------------------------
stress_50 <- dir_ls(path = here("data", "tidy", "by_id_50ms"), 
  regexp = "\\.csv$") %>%
  as_tibble() %>% 
  pull() %>% 
  map_dfr(read_csv, id = "id") %>% 
  separate(id, into = c("trash", "id"), 
    sep = here("data", "tidy", "by_id_50ms/")) %>% 
  mutate(id = str_remove(id, "_stress_50ms.csv")) %>% 
  select(-trash)
# -----------------------------------------------------------------------------
