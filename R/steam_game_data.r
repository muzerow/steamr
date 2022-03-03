#' Steam Game Data
#'
#' Steam data about a specific game
#' @importFrom glue glue
#' @importFrom jsonlite fromJSON
#'
#' @param game_id Steam game id
#' @param country Alpha-2 country code
#'
#' @export

steam_game_data <- function(game_id, country = "us") {
  url <- glue("http://store.steampowered.com/api/appdetails/?appids={game_id}&cc={country}")
  list <- suppressWarnings(fromJSON(paste(readLines(url), collapse = "")))
  list <- list[[as.character(game_id)]]
  list$data
}
