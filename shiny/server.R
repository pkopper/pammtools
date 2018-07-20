library(shiny)
library(shinydashboard)


shinyServer(function(input, output, session) {
  
  output$plot1_home <- renderPlot({
    gg_partial(data, model, term, reference = reference,
               z.tz = seq(-3, 3, by = 0.1), tz_latency = seq(0, 12, by = .25), LL=c(1)) +
      theme_bw(base_size = 16) +
      theme(legend.position = "bottom",
            legend.key.width = unit(1.5,"cm"))
  })
  
  output$plot2_home <- renderPlot({
    if (!is.null(input$time)) { # Wait until the time picker is initialized properly
      gg_partial_ll(data, model, term,
                  tend = seq(0, 10, by = 0.5), tz_latency = seq(0, 12, by = 0.25), z.tz=c(1),
                  reference=ref) + theme(legend.position = "bottom") +
      geom_vline(xintercept = c(input$time, input$time + step_size)) +
      theme_bw(base_size = 16) +
      theme(legend.position = "bottom",
            legend.key.width = unit(1.5,"cm"))
    }
  })
  
  output$plot3_home <- renderPlot({
    if (!is.null(input$time)) { # Wait until the time picker is initialized properly
      gg_cumu_eff(data, model, term, z1=1, z2=-1) +
        geom_point() +
        geom_vline(xintercept = input$time) +
        theme_bw(base_size = 16) +
        theme(legend.position = "bottom")
    }
  })
  
  output$timePicker_ui <- renderUI({
    sliderInput("time", label = "point in time",
                min = min(ped_dlnm$tstart, na.rm = T),
                max = max(ped_dlnm$tend, na.rm = T),
                step = step_size,
                value = sort(unique(ped_dlnm$tstart))[3])
  })
  
})
