

# Module UI function
cltDNPUI <- function(id) {

  ns <- NS(id)
  
  tagList(

   

column(width=12, style="background-color: white; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
       h1("The Central Limit Theorem"),
       br(),
      
       "Use the tools below to explore the distribution of the sample mean for different sample sizes and different underlying distributions in the population.",
       br(),
       br(),
       br(),
       br(),
       
       tabsetPanel(type = "tabs",
                   
                   tabPanel(h4("Sample Data from a Probability Distribution"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                            #cltFromProbDistUI("cltFromProbDist"),

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


cltDNPServer <- function(id) {
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

