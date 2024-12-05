if(require(tidycensus)==FALSE) install.packages("tidycensus")
if(require(dplyr)==FALSE) install.packages("dplyr")

# Load the necessary libraries


# Get median household income data by state


income_data_19 <- tidycensus::get_acs(
  geography = "state",
  variables = "B19013_001", # This is the variable for median household income
  year = 2019,
  survey = "acs5",
  state = c("CA", "FL", "OH", "OR") # Specify the states by their abbreviations
)


income_data_20 <- tidycensus::get_acs(
  geography = "state",
  variables = "B19013_001", # This is the variable for median household income
  year = 2020,
  survey = "acs5",
  state = c("CA", "FL", "OH", "OR") # Specify the states by their abbreviations
)

income_data_21 <- tidycensus::get_acs(
  geography = "state",
  variables = "B19013_001", # This is the variable for median household income
  year = 2021,
  survey = "acs5",
  state = c("CA", "FL", "OH", "OR") # Specify the states by their abbreviations
)

income_data_22 <- tidycensus::get_acs(
  geography = "state",
  variables = "B19013_001", # This is the variable for median household income
  year = 2022,
  survey = "acs5",
  state = c("CA", "FL", "OH", "OR") # Specify the states by their abbreviations
)


# View the data
income_data_22 |> 
  dplyr::glimpse()

income_data_21 |> 
  dplyr::glimpse()

income_data_20 |> 
  dplyr::glimpse()

income_data_19 |> 
  dplyr::glimpse()




if(require(openxlsx)==FALSE) install.packages("openxlsx")

# Create a new Excel workbook
wb <- openxlsx::createWorkbook()

# Add sheets to the workbook
openxlsx::addWorksheet(wb, "income_data_19")
openxlsx::addWorksheet(wb, "income_data_20")
openxlsx::addWorksheet(wb, "income_data_21")
openxlsx::addWorksheet(wb, "income_data_22")

# Write data to the sheets
openxlsx::writeData(wb, sheet = "income_data_19", income_data_19)
openxlsx::writeData(wb, sheet = "income_data_20", income_data_20)
openxlsx::writeData(wb, sheet = "income_data_21", income_data_21)
openxlsx::writeData(wb, sheet = "income_data_22", income_data_22)

# Save the workbook
openxlsx::saveWorkbook(wb, "income_data_multiple_states.xlsx", overwrite = TRUE)




if(require(readxl)==FALSE) install.packages("readxl")

# Load the necessary library
library(readxl)

# Read the data from the "California" sheet
income_data_19 <- readxl::read_excel("income_data_multiple_states.xlsx", sheet = "income_data_19")

# Read the data from the "Texas" sheet
income_data_tx <- readxl::read_excel("income_data_multiple_states.xlsx", sheet = "Texas")

# View the data
print(income_data_ca)
print(income_data_tx)





