

# Module UI function
ttestsUI <- function(id) {

  ns <- NS(id)
  
  tagList(

   

column(width=9, style="background-color: white",
       br(),
       br(),
       h1("Conduct a T-Test"),
       br(),
       br(),
       "A t-test is a hypothesis test that compares means between to groups/entities (2-sample t-test) or between two time points/replicates measured on the same subject/experimental unit (paired t-test). Because a sample mean is a summary measure for the central tendancy of a numeric variable and can be used to estimate the population mean, the fact that a t-test compares means tells us that the outcome is numeric. Because a t-test compares two means, we know that the predictor is categorical with two categories, or binary. Explore the tool below to learn more about t-tests or conduct your own t-test.",
       br(),
       br(),
       br(),
       br(),
       tabsetPanel(type = "tabs",
                   
                   tabPanel(h4("2-Sample T-Test"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            br(),
                            br(),
                            fluidPage(
                              twoSampleTTestUI("twoSampleTTest"),
                              br()
                            ),
                            br()
                            
                   ),
                   
                   tabPanel(h4("Paired T-Test"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            br(),
                            br(),
                            fluidPage(
                              pairedTTest2UI("pairedTTest2")
                             #pairedTTestUI("pairedTTest")
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


ttestsServer <- function(id) {
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
    }


  
  )
  
  
  }

