

# Module UI function
contTableUI <- function(id) {

  ns <- NS(id)
  
  tagList(

  
column(width=9, style="background-color: white",
       br(),
       br(),
       h1("Conduct a Contingency Table Test"),
       br(),
       br(),
       "A contingency table test is a hypothesis test that tests to see if the distributions present in a contingency table 
       (a frequency table) are independent of one another. Explore the tool below to learn more about contingency table 
       tests or conduct your own test.",
       br(),
       br(),
       "When you see the symbol directly below, 
       usually in the top right corner of the white boxes, you can click on its different buttons to open dialog windows with videos ('WATCH' button) or with text ('READ' 
       button) to learn more. Try it here for an overview of a contingency table test:",
       
       
       column(12,style = " background-color: white; border-radius: 5px; ",
              
              br(),
              br(),
              column(width=5,
                     #h2("Hypotheses")
              ),
              column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                     column(width=6,h4(style="color:#818e9f;", "Learn:")),
                     column(width=4,
                            actionButton(ns("snip2_1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                            #actionButton(ns("snip2_2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
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
       tabsetPanel(type = "tabs",
                   
                   tabPanel(h4("Chi-Squared and Fisher's Exact Tests"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            br(),
                            br(),
                            fluidPage(
                              contTable2UI("contTable2"),
                              br()
                            ),
                            br()
                            
                   ),
                   
                   tabPanel(h4("McNemar's Test"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            br(),
                            br(),
                            fluidPage(
                              mcnemarsUI("mcnemars")
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


contTableServer <- function(id) {
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
        input$snip2_1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Overview of Contingency Table Tests"), ##### Change this one every time and text below
                               
                               
                               "A contingency table test is a hypothesis test that tests to see if the distributions present in a contingency table (a frequency table) are independent of one another. These distributions can be represented by percentages or proportions. Because a percentage is a summary measure for a categorical variable, we see that both the predictor and the outcome are categorical variables, represented by the rows and columns, in these tests. If no person or experimental unit was measured more than once, a chi-square or Fisher's exact thes should be used. The choice between chi-square and Fisher's exact tests should be based on expected cell counts, which you'll see 'Model Assumptions' section, along with a link to learn more information. In the case of paried observations across columns or rows, such as when two rows represent two time points at which the same person is measured, a McNemar's test should be used, which you can access via one of the tabs directly below.",
      br(), br() ) ) )) })
      observeEvent(
        input$snip2_2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Ovierview of Contingency Table Tests"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip2_2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }


  
  )
  
  
  }

