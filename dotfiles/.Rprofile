## The contents of this file are largely inspired
## from Kevin Ushey's .Rprofile file
# https://github.com/kevinushey/etc/blob/11b2480614f00b27b1a074ecbf33abcb7678976c/dotfiles/.Rprofile

.First <- function() {
  
  # Only activate if there is a human driver
  if (!interactive())
    return()

  # Encrypt name and e-mail with utf8ToInt(x)
  NAME <- intToUtf8(
	c(74L, 97L, 109L, 101L, 115L, 32L, 66L, 97L, 108L, 97L, 109L, 
	117L, 116L, 97L)
  )

  EMAIL <- intToUtf8(
	c(98L, 97L, 108L, 97L, 109L, 117L, 116L, 50L, 64L, 105L, 108L, 
	108L, 105L, 110L, 111L, 105L, 115L, 46L, 101L, 100L, 117L)
  )

  options(
    # CRAN Mirror
    repos = c(CRAN = "https://cloud.r-project.org"),
	
    # Disable tcltk
    menu.graphics = FALSE,

    # ignore newlines when using browse()
    browserNLdisabled = TRUE,

    # Disable fancy quotes
    useFancyQuotes = FALSE,

    # Warrn on partial matches
    # warnPartialMatchArgs = TRUE ## too disruptive
    warnPartialMatchAttr = TRUE,
    warnPartialMatchDollar = TRUE,

    # Issue warnings immediately
    warn = 1,

    # devtools customizations
    devtools.desc = list(
      Author = NAME,
      Maintainer = paste(NAME, " <", EMAIL, ">", sep = ""),
      License = "GPL (>=2)",
      Version = "0.0.1"
    ),

    devtools.name = NAME
  )


  # ensure commonly-used packages are installed, loaded
  quietly <- function(expr) {
    status <- FALSE
    suppressWarnings(suppressMessages(
      utils::capture.output(status <- expr)
    ))
    status
  }

  install <- function(package) {

    code <- sprintf(
      "utils::install.packages('%s', lib = '%s', repos = '%s')",
      package,
      .libPaths()[[1]],
      getOption("repos")[["CRAN"]]
    )

    R <- file.path(
      R.home("bin"),
      if (Sys.info()[["sysname"]] == "Windows") "R.exe" else "R"
    )

    cmd <- paste(shQuote(R), "-e", shQuote(code))
    system(cmd, ignore.stdout = TRUE, ignore.stderr = TRUE)
  }

  packages <- c("devtools", "roxygen2", "knitr", "rmarkdown", "RcppArmadillo", "testthat")
  invisible(lapply(packages, function(package) {

    if (quietly(require(package, character.only = TRUE, quietly = TRUE)))
      return()

    message("Installing '", package, "' ... ", appendLF = FALSE)
    install(package)

    success <- quietly(require(package, character.only = TRUE, quietly = TRUE))
    message(if (success) "OK" else "FAIL")

  }))

  # display startup message(s)
  msg <- if (length(.libPaths()) > 1)
    "Using libraries at paths:\n"
  else
    "Using library at path:\n"
  libs <- paste("-", .libPaths(), collapse = "\n")
  message(msg, libs, sep = "")

}

