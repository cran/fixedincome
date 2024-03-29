
# context('compounding functions')

test_that("it should create a compounding class", {
  expect_s4_class(compounding("simple"), "Compounding")
  expect_s4_class(compounding("simple"), "Simple")
  expect_s4_class(compounding("discrete"), "Compounding")
  expect_s4_class(compounding("discrete"), "Discrete")
  expect_s4_class(compounding("continuous"), "Compounding")
  expect_s4_class(compounding("continuous"), "Continuous")
  expect_error(compounding("nada"))
})

test_that("it should compute compounding factor", {
  expect_equal(compound("simple", 2, 0.05), 1.1)
  expect_equal(compound("discrete", 2, 0.05), 1.1025)
  expect_equal(compound("continuous", 2, 0.05), 1.105170918)
})

test_that("it should compute compounding implied rate", {
  expect_equal(implied_rate("simple", 2, 1.1), 0.05)
  expect_equal(implied_rate("discrete", 2, 1.1025), 0.05)
  expect_equal(implied_rate("continuous", 2, 1.105170918), 0.05)
})

test_that("it should coerce compounding to character", {
  expect_equal(as(compounding("simple"), "character"), "simple")
  expect_equal(as(compounding("discrete"), "character"), "discrete")
  expect_equal(as(compounding("continuous"), "character"), "continuous")
})

test_that("it should compare compoundings", {
  expect_true(compounding("simple") == compounding("simple"))
  expect_true(compounding("simple") != compounding("discrete"))
  expect_false(compounding("discrete") == compounding("simple"))
})