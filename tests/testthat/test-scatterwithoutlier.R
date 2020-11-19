#Testing that the function would produce error on unexpected inputs.
test_that("Unexpected Input Testing",{
  expect_error(scatterwithoutlier(data=gapminder::gapminder %>%
                                    dplyr::select(country,pop)))
  expect_error(scatterwithoutlier(data=gapminder::gapminder %>%
                                    dplyr::select(gdpPercap,pop),xy=1))
  expect_error(scatterwithoutlier(data=gapminder::gapminder %>%
                                    dplyr::select(gdpPercap,pop),verbose ="TRUE"))
  expect_error(scatterwithoutlier(data=gapminder::gapminder %>%
                                    dplyr::select(gdpPercap,pop),outputcount = 0))
  expect_error(scatterwithoutlier(data=gapminder::gapminder %>%
                                    dplyr::select(year,country,pop)))
  expect_error(scatterwithoutlier(data=FALSE))
  expect_error(scatterwithoutlier(data=gapminder::gapminder %>%
                                    dplyr::select(gdpPercap,pop),cooksd = "0.5"))

})

#Testing the output of the function is a ggplot object.
test_that("Output check",{
  expect_equal(class(scatterwithoutlier(data=gapminder::gapminder %>%
                                          dplyr::select(gdpPercap,pop))),c("gg","ggplot"))
  expect_output(scatterwithoutlier(data=gapminder::gapminder %>%
                                     dplyr::select(gdpPercap,pop),outputcount = TRUE))
})
