

# Module UI function
demonstrationsUI <- function(id) {

  ns <- NS(id)
  
  tagList(

   

column(width=9, style="background-color: white",
       br(),
       br(),
       h1("Demonstrations of Statistical Concepts and Principals"),
       br(),
        "Use the tabs below to navigate through our demonstrations, often graphical, of statistical concepts and principals. We will continue to add more, so feel free to give us suggestions. Our email and contact info is in the 'Home' page."
      , br(),
       br(),
       br(),
       br(),
       tabsetPanel(type = "tabs",
                   
                   tabPanel(h4("Central Limit Theorem"),
                            style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",

                            fluidPage(
                              cltDNPUI("cltDNP"),
                              br()
                            ),
                            br()
                            
                   )#,
                   #tabPanel(h4("Chi-Square Tests"),
                   #         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 30px;",
                   #         
                   #         fluidPage(
                   #           chisquarePowerUI("chiSquarePower"),
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


demonstrationsServer <- function(id) {
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

