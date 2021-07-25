test_that("MinMaxScaling() scales data in range (0,1)", {
          dat1 = c(5, 10, 15)
          dat2 = c(0.0, 0.5, 1.0)
          dat3 = c(6, 12)
          dat4 = c(0.1, 0.7)

  expect_equal(MinMaxScaling(dat1), dat2)
  expect_equal(MinMaxScaling(dat3, dat1), dat4)
})
