

# Module UI function
runChartUI <- function(id) {

  ns <- NS(id)
  
  tagList(

   

column(width=9, style="background-color: white",
       br(),
       br(),
       h1("Create and Evaluate a Run Chart"),
       br(),
       br(),
       "A run chart is a specific type of longitudinal plot, or plot over time. While a generic longitudinal plot allows us to examine patterns in our variables over time, a run chart, when paired with the run chart rules, allows us to evaluate our data probabalistically for the presence of certain longitudinal patterns, like shifts, trends, and runs. Along with control charts, run charts form the analytic basis of the statistical evaluation of quality improvement data.",
       br(),
       br(),
       "When you see the symbol directly below, 
       usually in the top right corner of the white boxes, you can click on its different buttons to open dialog windows with videos ('WATCH' button) or with text ('READ' 
       button) to learn more. Try it here for an overview of run charts:",
       
       column(12,style = " background-color: white; border-radius: 5px; ",
              
              br(),
              br(),
              column(width=5,
                     #h2("Hypotheses")
              ),
              column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                     column(width=6,h4(style="color:#818e9f;", "Learn:")),
                     column(width=4,
                            actionButton(ns("snip7_1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                            #actionButton(ns("snip7_2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
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
                   
                   tabPanel(h4("Run Chart"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",

                            fluidPage(
                              runChart2UI("runChart2"),
                              br()
                            ),
                            br()
                            
                   ),
                   tabPanel(h4("Run Chart Rules"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            br(),
                            br(),
                            fluidPage(
                              runChartRulesUI("runChartRules"),
                              br()
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


runChartServer <- function(id) {
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
        input$snip7_1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Overview of Run Charts"), ##### Change this one every time and text below
                               "A run chart is a graphical tool used to track changes in a process over time. It displays data points in chronological order, typically with time on the horizontal axis and the measured variable on the vertical axis. The primary purpose of a run chart is to identify trends, shifts, or patterns in data to understand how a process behaves over time.",
                               br(), br(),
                               "To create a run chart, you plot the data points on the graph and connect them with a line. This visual representation helps in spotting variations and determining whether changes are due to random fluctuations or if they indicate a systemic issue. Key features of a run chart include the median line, which provides a reference point for comparison, and any noticeable runs or sequences that suggest trends or shifts in the data. Analyzing these features can help in assessing the stability of the process and making informed decisions about improvements.",
                               br(), br(),
                               "Run charts are particularly useful in quality control, project management, and continuous improvement efforts, as they provide a simple yet effective way to monitor performance and detect areas needing attention.", 
                               br(), br() ) ) )) })
      observeEvent(
        input$snip7_2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Ovierview of Run Charts"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip7_2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }


  
  )
  
  
  }

