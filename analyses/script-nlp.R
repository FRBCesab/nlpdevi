## Load the references ----

refs   <- rbibtools::read_bib(here::here("data"))
titles <- refs$"title"


## Load terms to search for ----

single_words <- read.csv(here::here("data", "single_words_search.csv"))
single_words <- single_words$"word"

expressions  <- read.csv(here::here("data", "expressions_search.csv"))
expressions  <- expressions$"expression"


## Screen titles ----

titles_clean <- clean_string(titles)

screens_swd  <- screen(titles_clean, single_words)
screens_expr <- screen(titles_clean, expressions)


## Append results ----

my_screens <- cbind(screens_swd, screens_expr)


## Export ----

writexl::write_xlsx(my_screens, here::here("outputs", 
                                           "title_screens_results.xlsx"))
