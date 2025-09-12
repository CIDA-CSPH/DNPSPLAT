

# Module UI function
cltUI <- function(id) {

  ns <- NS(id)
  
  tagList(

   

column(width=9, style="background-color: white; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
      
       
       
       
       
       
       
       #br(),
       br(),
       h1("Means, Normality, and the Central Limit Theorem"),
       br(),
       #br(),
       "Use the tools below to explore the distribution of the sample mean for different sample sizes and different underlying distributions in the population. Then use these tools to complete the corresponding exercise in the workbook/handout.",
       br(),
       br(),
       "When you see the symbol directly below, 
       usually in the top right corner of the white boxes, you can click on its different buttons to open dialog windows with videos ('WATCH' button) or with text ('READ' 
       button) to learn more. Try it here for an overview of the Central Limit Theorem:",
       
       column(12,style = " background-color: white; border-radius: 5px; ",
              
              br(),
              br(),
              column(width=5,
                     #h2("Hypotheses")
              ),
              column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                     column(width=6,h4(style="color:#818e9f;", "Learn:")),
                     column(width=4,
                            actionButton(ns("snip3_1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                            #actionButton(ns("snip3_2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                            tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                     )),
              br(),
              br(),
              br(),
              br(),
              br()
       ),
       
       
       
       
       
       
       
       
       
       
       
       tabsetPanel(type = "tabs",
                   
                   tabPanel(h4("Sample Data from a Probability Distribution"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",


                            fluidPage(
                              cltFromProbDistUI("cltFromProbDist"),
                              br()
                            ),
                            br()
                            
                   )#,
                   
                   #tabPanel(h4("Use Your Own Data"),
                   #         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
#
                   #         fluidPage(
                   #           cltFromDataUI("cltFromData")
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
#column(width=3, style="background-color: white",
#
#br()
#)

)
  
}


cltServer <- function(id) {
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
        input$snip3_1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Overview of the Central Limit Theorem"), ##### Change this one every time and text below
                               "The Central Limit Theorem (CLT) is a fundamental concept in probability theory and statistics that explains why the normal distribution (or Gaussian distribution) appears so frequently in real-world data. Here’s a concise overview of the theorem and its significance:",
                                h4("The Essence of the Central Limit Theorem"),
                                "The CLT states that the distribution of the sample mean (or sum) of a large number of independent and identically distributed (i.i.d.) random variables approaches a normal distribution, regardless of the original distribution of the variables. This normal distribution will have a mean equal to the mean of the original distribution and a variance equal to the variance of the original distribution divided by the sample size.",
                                            br(), br() ) ) )) })
      observeEvent(
        input$snip3_2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Overview of the Central Limit Theorem"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip3_2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
      
      
      
      
    }

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  )
  
  
  }

