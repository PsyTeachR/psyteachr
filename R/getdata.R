#' Create data directory
#'
#' Save data files to a directory
#'
#' @param dir The name of the directory to save the data in (default "data")
#' @param dataset Which dataset to download, from "all", "dataskills" (default "all")
#'
#' @return A list of the paths of the new data files
#' @export
#'
getdata <- function(dir = "data", dataset = c("all", "dataskills")) {
  from_dir <- system.file("datasets", package = "psyteachr")
  zips <- list.files(from_dir, "\\.zip$", full.names = TRUE)

  dataset <- match.arg(dataset)
  if (dataset != "all") {
    match <- grep(paste0(dataset, "\\.zip"), zips)
    zips <- zips[match]
  }

  lapply(zips, utils::unzip, junkpaths = TRUE, exdir = dir)

  message("Data saved into ", dir)
  list.files(dir, full.names = TRUE)
}
