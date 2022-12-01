library(testthat)


# unit test for search.vernacular and search.scientific
test_that(
  "test that search query matches the result",
  {
    query <- "Hooded Crow"
    expect_equal (as.character(search.vernacular(occurence_poland, "Hooded Crow")[10, 12]), 
                  query)
  }
)




test_that(
  "test that search query matches the result",
  {
    query <- "Sciurus vulgaris"
    expect_equal (as.character(search.scientific(occurence_poland, "Sciurus vulgaris")[10, 7]), 
                  query)
  }
)