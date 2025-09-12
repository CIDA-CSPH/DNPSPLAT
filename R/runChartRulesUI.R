# Module UI function
runChartRulesUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           br(),
           column(width=10,
                  h2("Run Chart Rules")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip7c1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         actionButton(ns("snip7c2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )
                  
           ),
           br(),
           br(),
           br(),
           
           #br(),
           #br(),
           #h1("Run Chart Rules"),
           #br(),
           #br(),
           
           #tags$figure( class = "centerFigure", tags$img( src = "astragalus.jpg", width = 600, alt = "Picture of an astragalus (bone die)" ), tags$figcaption("Image of Astragalus by Yaan, 2007") )
           #tags$div(
             #style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
             tags$img(
               width="600",
               height="400",
               src = "RCR1.png",
               frameborder="0"
             ),
             tags$img(
               width="600",
               height="400",
               src = "RCR2.png",
               frameborder="0"
             ),
             tags$img(
               width="600",
               height="400",
               src = "RCR3.png",
               frameborder="0"
             ),
             tags$img(
               width="600",
               height="400",
               src = "RCR4.png",
               frameborder="0"
             ),
           tags$img(
             width="600",
             height="400",
             src = "RCR5.png",
             frameborder="0"
           ),
           tags$img(
             width="600",
             height="400",
             src = "RCR6.png",
             frameborder="0"
           ),
           tags$img(
             width="600",
             height="400",
             src = "RCR7.png",
             frameborder="0"
           ),
           tags$img(
             width="600",
             height="400",
             src = "RCR8.png",
             frameborder="0"
           ),
           br(),
           br(),
           br()
           #)
           
    ),
    
    column(12,
           br(),
           br(),
           br()
    )
 
    
    
  )
  
  
  
  
  
  
  
  
}








runChartRulesServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      observeEvent(
        input$snip7c1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Run Chart Rules"), ##### Change this one every time and text below
                               "",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip7c2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height:  450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Run Chart Rules"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip7c2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
    }
  )    
}
