#############################################################################
#############################################################################
#############################################################################
#####
#####   ttestsaUI module code
#####   Includes code for ttestsaUI() and for ttestsaServer()
#####   This code is for the content of the T-Tests tab nested in the 
#####   main app.R code
#####   This code has nested within it the individual t-test modules:
#####   twoSampleTTestUI and pairedTTestUI
#####
#####   Bryan McNair, MS
#####   8/28/2024
#####
#############################################################################
#############################################################################
#############################################################################




############################################################################
# Module UI function
############################################################################
ttestsaUI <- function(id) {

  ns <- NS(id) # name space
  
  tagList(

   

column(width=9, style="background-color: white",
       
       br(),
       br(),
       
       h1("Conduct a T-Test"),
       
       br(),
       br(),
       
       "A t-test is a hypothesis test that compares means between two groups/entities (2-sample/unpaired/independent t-test) or between two time points/replicates measured 
       on the same subject/experimental unit (paired/dependent t-test). Use the tabs below to conduct a two-sample t-test or a paired t-test.",
       
       br(),
       br(),
       
       "When you see the symbol directly below, 
       usually in the top right corner of the white boxes, you can click on its different buttons to open dialog windows with videos ('WATCH' button) or with text ('READ' 
       button) to learn more. Try it here for an overview of a t-test:",
       
       column(12,style = " background-color: white; border-radius: 5px; ",
              
              br(),
              br(),
              column(width=5,
                     #h2("Hypotheses")
                     ),
              column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                     column(width=6,h4(style="color:#818e9f;", "Learn:")),
                     column(width=4,
                            actionButton(ns("snip1_1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                            actionButton(ns("snip1_2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                            #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                     )),
              br(),
              br(),
              br(),
              br(),
              br()
       ),
       
       
       br(),
       br(),
       
       #######################################################################
       #  Tabset panel with tabs for the two types of t-tests that we cover
       #######################################################################
       tabsetPanel(type = "tabs",
                   
                   # This is the tab for the 2-sample t-test
                   tabPanel(h4("2-Sample T-Test"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            br(),
                            br(),
                            fluidPage(
                              twoSampleTTestUI("twoSampleTTest"), # This inserts the twoSampleTTest UI under this tab
                              br()
                            ),
                            br()
                            
                   ),
                   
                   # This is the tab for the paired t-test
                   tabPanel(h4("Paired T-Test"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            br(),
                            br(),
                            fluidPage(
                              pairedTTest2UI("pairedTTest2") # This inserts the pairedTTest2UI
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



############################################################################
# Module Server function
############################################################################
ttestsaServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      
     # This is the content for the "LEARN: READ" button and the link for the "LEARN: WATCH" content 
      observeEvent(
        input$snip1_1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Overview of T-Tests"), ##### Change this one every time and text below
                               "A t-test is a hypothesis test that compares means between two groups/entities (2-sample/unpaired/independent t-test) or between two time points/replicates measured 
       on the same subject/experimental unit (paired/dependent t-test).  Remember that a sample mean summarizes or describes the central tendency of NUMERIC 
      observations in a sample. Also remember that a population mean is a measure of central tendancy for a NUMERIC random variable in the population 
      that parameterizes many distributions, such as the normal distribution. Finally, remember that the sample mean is a good estimator (good accuracy 
                                                                                                                                          and precision) of the population mean.  Given all of this, the fact that a t-test compares means tells us that the outcome is NUMERIC. 
      Because a t-test compares TWO means, we know that the predictor is categorical with two categories, or binary. There is a one-sample t-test, 
      though we don't cover it here, as it's rarely used in practice. See the Model Assumptions section for a note on equal variances/standard deviation t-tests and 
      unequal variances/standard deviations t-tests.", 
      br(),
      br(),
      "Based on this information, can you characterize a t-test as a hypothesis test by stating the null hypothesis? See the content below for the 
      answer.",
      br(),
      br(),
      "Based on this information, can you characterize a t-test as a model by listing the predictor(s) with data scale(s) and outcome with (assumed) 
      distribution? The answers are given in the first paragraph above.",
      br(), br() ) ) )) })
      observeEvent(
        input$snip1_2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Ovierview of a T-Test"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip1_2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
      
      
    }
  )
  }

