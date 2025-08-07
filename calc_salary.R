calc_salary <- function(val,
                        rate = c("hourly", "annual"),
                        days = 5,
                        fte = 1) {

      output_text <- switch(rate,
                            hourly = "Annual salary =",
                            annual = "Hourly salary =")

      if (rate == "hourly") {
            paste(output_text, scales::label_comma(accuracy = 0.1)(val * fte * 8 * days * 52))

      } else if (rate == "annual") {
            paste(output_text, scales::label_comma(accuracy = 0.1)(val / (fte * 8 * days * 52)))

      } else {
            stop("Wrong input to rate")
      }
}
