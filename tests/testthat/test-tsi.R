test_that("tsi calculation works", {
          chla <- c(0.04, 0.12, 0.34, 0.94, 2.6, 6.4, 20, 56, 154, 427, 1183)
          TP <- c(0.75, 1.5, 3, 6, 12, 24, 48, 96, 192, 384, 768)
          SD <- c(64, 32, 16, 8, 4, 2, 1, 0.5, 0.25, 0.12, 0.062)
          TSI <- seq(0, 100, by = 10)

  expect_equal(round(tsi(chla, type = "chla"), digits = -1), TSI)
  expect_equal(round(tsi(TP, type = "TP"), digits = -1), TSI)
  expect_equal(round(tsi(SD, type = "SD"), digits = -1), TSI)
})
