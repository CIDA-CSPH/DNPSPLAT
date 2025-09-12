

# Module UI function
table1UI <- function(id) {

  ns <- NS(id)
  
  tagList(

   

column(width=9, style="background-color: white",
       br(),
       br(),
       h1("Descriptive Statistics"),
       br(),
       br(),
       "Summarize your data and describe your sample using numbers and tables.",
       br(),
       br(),
       "When you see the symbol directly below, 
       usually in the top right corner of the white boxes, you can click on its different buttons to open dialog windows with videos ('WATCH' button) or with text ('READ' 
       button) to learn more. Try it here for an overview of descriptive statistics:",
       
       column(12,style = " background-color: white; border-radius: 5px; ",
              
              br(),
              br(),
              column(width=5,
                     #h2("Hypotheses")
              ),
              column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                     column(width=6,h4(style="color:#818e9f;", "Learn:")),
                     column(width=4,
                            actionButton(ns("snip6_1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                            #actionButton(ns("snip6_2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                            tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                     )),
              br(),
              br(),
              br(),
              br(),
              br()
       ),
       
       
       
       tabsetPanel(type = "tabs",
                   
                   tabPanel(h4("Numbers and Tables"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",

                            fluidPage(
                              table12UI("table12"),
                              br()
                            ),
                            br()
                            
                   )#,
                   #tabPanel(h4("Plots and Figures"),
                   #         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                   #         
                   #         fluidPage(
                   #           descStatUI("descStat"),
                   #           br()
                   #         ),
                   #         br()
                   #         
                   #)
                   #tabPanel(h4("Run Chart Rules"),
                   #         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                   #         br(),
                   #         br(),
                   #         fluidPage(
                   #           runChartRulesUI("runChartRules"),
                   #           br()
                   #         ),
                   #         br()
                   #         
                   #)
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


table1Server <- function(id) {
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
        input$snip6_1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Overview of Descriptive Statistics"), ##### Change this one every time and text below
                               "Descriptive statistics are methods used to summarize and describe the main features of a data set. They provide a snapshot of the data through measures of central tendency and variability.",
                               br(),
                               br(),
                              "Measures of central tendency include:",
                              br(),
                              br(),
"1) Mean: The average of all data points, calculated by summing them up and dividing by the number of points.",
br(),
"2) Median: The middle value when data is sorted in ascending order. It splits the data into two halves.",
br(),
"3) Mode: The most frequently occurring value in the data set.",
br(),
br(),
"Measures of variability indicate how spread out the data is:",
br(),
br(),
"1) Range: The difference between the maximum and minimum values.",
br(),
"2) Variance: The average squared deviation from the mean, reflecting data spread.",
br(),
"3) Standard Deviation: The square root of variance, providing a sense of average distance from the mean.",
br(),
br(),
"Descriptive statistics help in understanding data distributions, spotting trends, and making comparisons, but they don't infer or predict beyond the data itself. They are crucial for summarizing and visualizing data efficiently, often using graphs like histograms or box plots.",
      br(), br() ) ) )) })
      observeEvent(
        input$snip6_2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Ovierview of Descriptive Statistics"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip6_2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }


  
  )
  
  
  }

