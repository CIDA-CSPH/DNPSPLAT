

# Module UI function
ciUI <- function(id) {

  ns <- NS(id)
  
  tagList(

   

column(width=9, style="background-color: white",
       br(),
       br(),
       h1("Calculate a Confidence Interval"),
       br(),
       br(),
       "Here, you can calculate confidence intervals for means and proportions or percentages. You can also enter a null value or goal value to compare to the confidence interval.",
       br(),
       br(),
       "When you see the symbol directly below, 
       usually in the top right corner of the white boxes, you can click on its different buttons to open dialog windows with videos ('WATCH' button) or with text ('READ' 
       button) to learn more. Try it here for an overview of a confidence interval:",
       
       column(12,style = " background-color: white; border-radius: 5px; ",
              
              br(),
              br(),
              column(width=5,
                     #h2("Hypotheses")
              ),
              column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                     column(width=6,h4(style="color:#818e9f;", "Learn:")),
                     column(width=4,
                            actionButton(ns("snip5_1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                            #actionButton(ns("snip5_2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                            tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                     )),
              br(),
              br(),
              br(),
              br(),
              br()
       ),

       br(),
       br(),


       br(),
       br(),
       
       tabsetPanel(type = "tabs",
                   
                   tabPanel(h4("Confidence Interval for a Mean"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",

                            fluidPage(
                              ciForMeanUI("ciForMean"),
                              br()
                            ),
                            br()
                            
                   ),
                   
                   tabPanel(h4("Confidence Interval for a Percentage"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",

                            fluidPage(
                              ciForProportionUI("ciForProportion")
                            ),
                            br()
                            
                   )
       ),
       
       br(),
       br(),
       br(),
       br(),
       br()
       
),
column(width=3, style="background-color: white",

br()
)

)
  
}


ciServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      

  observeEvent(input$info,{
    showModal(modalDialog(
      
      tags$div(
        style = "height: 720px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
        
      tags$iframe(
        width="1280",
        height="720",
        src = "Statstical Literacy Lecture 13.mp4", 
        frameborder="0", 
        allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
        allowfullscreen=NA
      )
      )
      
    ))
  
  })

  
  
  
  
  observeEvent(
    input$snip5_1,{ ##### Change this one every time
      showModal(
        modalDialog( 
          tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                    column(width = 12,
                           h3("Overview of Confidence Intervals"), ##### Change this one every time and text below
                           "Confidence intervals (CIs) are a key concept in statistics, providing a range within which we expect a population parameter to lie, based on a sample statistic. They offer a measure of uncertainty about the parameter’s value, helping to make inferences about the broader population from a sample.",
br(),
br(),

"A confidence interval is essentially a range of values, derived from sample data, that is likely to contain the true population parameter with a specified probability. For example, a 95% confidence interval suggests that if we were to take 100 different samples and compute a confidence interval for each, we would expect about 95 of those intervals to contain the true parameter.",
      br(), br() ) ) )) })
  observeEvent(
    input$snip5_2,{ ##### Change this one every time
      showModal(
        modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Ovierview of Confidence Intervals"), ##### Change this one every time
            tags$iframe(
              width="1280", height="720",
              src = "snip5_2.mp4", ##### Change this one every time
              frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
  
  
  


    }
  )
  
  
  }

