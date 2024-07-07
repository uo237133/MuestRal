library(testthat)

source("../../src/formulas.R")

# Función para calcular el tamaño muestral para una MEDIA
test_that("calcular_tamano_muestral_media funciona correctamente con MAS y error de muestreo", {
  expect_equal(calcular_tamano_muestral_media("MAS", 1000, 25, 5), 1)
  expect_equal(calcular_tamano_muestral_media("MAS", 500, 20, 2), 5)
})

test_that("calcular_tamano_muestral_media funciona correctamente con MACR y error de muestreo", {
  expect_equal(calcular_tamano_muestral_media("MACR", NULL, 25, 5), 1)
  expect_equal(calcular_tamano_muestral_media("MACR", NULL, 20, 2), 5)
})

test_that("calcular_tamano_muestral_media funciona correctamente con MAS y nivel de confianza", {
  expect_equal(calcular_tamano_muestral_media("MAS", 1000, 25, 5, 0.95), 20)
  expect_equal(calcular_tamano_muestral_media("MAS", 500, 20, 2, 0.90), 46)
})

test_that("calcular_tamano_muestral_media funciona correctamente con MACR y nivel de confianza", {
  expect_equal(calcular_tamano_muestral_media("MACR", NULL, 25, 5, 0.95), 20)
  expect_equal(calcular_tamano_muestral_media("MACR", NULL, 20, 2, 0.90), 30)
})

# Función para calcular el tamaño muestral para una PROPORCION
test_that("calcular_tamano_muestral_proporcion funciona correctamente con MAS y error de muestreo", {
  expect_equal(calcular_tamano_muestral_proporcion("MAS", 1000, 0.5, 0.05), 91)
  expect_equal(calcular_tamano_muestral_proporcion("MAS", 500, 0.4, 0.05), 81)
})

test_that("calcular_tamano_muestral_proporcion funciona correctamente con MACR y error de muestreo", {
  expect_equal(calcular_tamano_muestral_proporcion("MACR", NULL, 0.5, 0.05), 100)
  expect_equal(calcular_tamano_muestral_proporcion("MACR", NULL, 0.4, 0.05), 96)
})

test_that("calcular_tamano_muestral_proporcion funciona correctamente con MAS y nivel de confianza", {
  expect_equal(calcular_tamano_muestral_proporcion("MAS", 1000, 0.5, 0.05, 0.95), 100)
  expect_equal(calcular_tamano_muestral_proporcion("MAS", 50, 0.4, 0.05, 0.90), 48)
})

test_that("calcular_tamano_muestral_proporcion funciona correctamente con MACR y nivel de confianza", {
  expect_equal(calcular_tamano_muestral_proporcion("MACR", NULL, 0.5, 0.05, 0.95), 385)
  expect_equal(calcular_tamano_muestral_proporcion("MACR", NULL, 0.4, 0.05, 0.90), 260)
})
