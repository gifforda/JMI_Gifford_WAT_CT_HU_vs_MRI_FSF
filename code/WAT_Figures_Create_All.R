#!/usr/bin/env Rscript

### CODE FOR RECREATING WAT PAPER FIGURES ################################

# enable plots when executing from command line
X11()

# @return full path to this script
get_script_path <- function() {
  cmdArgs = commandArgs(trailingOnly = FALSE)
  needle = "--file="
  match = grep(needle, cmdArgs)
  if (length(match) > 0) {
    # Rscript
    return(normalizePath(sub(needle, "", cmdArgs[match])))
  } else {
    ls_vars = ls(sys.frames()[[1]])
    if ("fileName" %in% ls_vars) {
      # Source'd via RStudio
      return(normalizePath(sys.frames()[[1]]$fileName)) 
    } else {
      # Source'd via R console
      return(normalizePath(sys.frames()[[1]]$ofile))
    }
  }
}

repo_code_folder <- dirname( get_script_path() )

# Figure 2a
source(paste0(repo_code_folder,'/WAT_Figure_2a.R',collapse=""), chdir = TRUE)
# Figure 2b
source(paste0(repo_code_folder,'/WAT_Figure_2b.R',collapse=""), chdir = TRUE)
# Figure 2c
source(paste0(repo_code_folder,'/WAT_Figure_2c.R',collapse=""), chdir = TRUE)

# Figure 3a
source(paste0(repo_code_folder,'/WAT_Figure_3a.R',collapse=""), chdir = TRUE)
# Figure 3b
source(paste0(repo_code_folder,'/WAT_Figure_3b.R',collapse=""), chdir = TRUE)
# Figure 3c
source(paste0(repo_code_folder,'/WAT_Figure_3c.R',collapse=""), chdir = TRUE)

# Figure 4
source(paste0(repo_code_folder,'/WAT_Figure_4.R',collapse=""), chdir = TRUE)

# Figure 5a
source(paste0(repo_code_folder,'/WAT_Figure_5a.R',collapse=""), chdir = TRUE)
# Figure 5b
source(paste0(repo_code_folder,'/WAT_Figure_5b.R',collapse=""), chdir = TRUE)
# Figure 5c
source(paste0(repo_code_folder,'/WAT_Figure_5c.R',collapse=""), chdir = TRUE)
# Figure 5d
source(paste0(repo_code_folder,'/WAT_Figure_5d.R',collapse=""), chdir = TRUE)

# Figure 6a
source(paste0(repo_code_folder,'/WAT_Figure_6a.R',collapse=""), chdir = TRUE)
# Figure 6b
source(paste0(repo_code_folder,'/WAT_Figure_6b.R',collapse=""), chdir = TRUE)
# Figure 6c
source(paste0(repo_code_folder,'/WAT_Figure_6c.R',collapse=""), chdir = TRUE)
# Figure 6d
source(paste0(repo_code_folder,'/WAT_Figure_6d.R',collapse=""), chdir = TRUE)

