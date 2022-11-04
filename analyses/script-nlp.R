## Load the references ----

refs <- rbibtools::read_bib(here::here("data"))


## Screen on titles - Single words ----

titles <- refs$"title"

patterns <- c("function", "trait")

titles_clean <- clean_string(titles)

screens_1 <- lapply(patterns, screen, x = titles_clean)
screens_1 <- as.data.frame(screens_1)
colnames(screens_1) <- patterns


## Screen on titles - Multiple words (tokenization) ----

token_orig  <- c("species richness", "tree species")
token_regex <- gsub("\\s", "", token_orig)

titles_clean <- clean_string(titles)

titles_clean_token <- tokenization(titles_clean, token_orig, token_regex)

screens_2 <- lapply(token_regex, screen, x = titles_clean_token)
screens_2 <- as.data.frame(screens_2)
colnames(screens_2) <- gsub("\\s", "_", token_orig)

my_screens <- cbind(screens_1, screens_2)


## Export ----

writexl::write_xlsx(my_screens, here::here("outputs", 
                                           "title_screens_results.xlsx"))
