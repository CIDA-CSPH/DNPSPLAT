


# Module UI function
concReviewUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  
  mainPanel(
    
    
    
    #########################################
    ##  Beginning of Page Title and buttons
    #########################################
    br(),
    tags$div(style="display:inline-block;height:45;",
             title="Module and Section",
             h1("Module 7: Additional Topics and Conclusions",
                style="height: 45px; padding: 10px;"
             )
    ),
    br(),
   
    br(),
    br(),
    br(),
    ############################################
    ##  End beginning of page buttons
    ############################################
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("Discussion: Common Pitfalls"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
      ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
      a("Handout: Common Pitfalls",target="_blank",href="temp"),  
      br(),   
      "Download all handouts here:",
      a("All Handouts",target="_blank",href="temp"),
      br(),
      br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Discussion: Common Pitfalls",
             actionButton(ns("genericVideoRef"),
                          label=NULL,
                          style="width: 350px;
                                    height: 200px;
                                    #padding: 10px; 
                                    font-size: 200%;
                                    background: url('vidLectImage.png');
                                    background-size: cover;
                                    background-position: center;"
             )
    ),
    br(),
    br(),
    ############################################
    ##  End video and possibly handout section
    ############################################
    
    
    
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("Lecture: Review"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
   # a("Handout: Conducting a T-test",target="_blank",href="temp"),  
   # br(),   
   # "Download all handouts here:",
   # a("All Handouts",target="_blank",href="temp"),
   # br(),
   # br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Lecture: Review",
             actionButton(ns("video1"),
                          label=NULL,
                          style="width: 350px;
                                    height: 200px;
                                    #padding: 10px; 
                                    font-size: 200%;
                                    background: url('vidLectImage.png');
                                    background-size: cover;
                                    background-position: center;"
             )
    ),
    br(),
    br(),
    ############################################
    ##  End video and possibly handout section
    ############################################
    
    
    
   
   
   
   
   ################################################
   ## Video and possibly handout content
   ################################################
   ## Video title and a few sentences introducing it
   br(),
   br(),
   h2("Case Study: Meeting with an Investigator"),
   br(),
   "...A few sentences that introduce video (and handout if there is one)...",
   br(),
   br(),
   ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
   a("Case Study: Meeting with an Investigator",target="_blank",href="191022 Case 10 Meeting with an Investigator.docx.pdf"),  
   br(),   
   "Download all handouts here:",
   a("All Handouts",target="_blank",href="temp"),
   br(),
   br(),
   ## Video icon and link
   tags$div(style="display:inline-block;width:500px;height:200;",
            title="Video Exercise: Meeting with an Investigator",
            actionButton(ns("genericVideoRef"),
                         label=NULL,
                         style="width: 350px;
                                    height: 200px;
                                    #padding: 10px; 
                                    font-size: 200%;
                                    background: url('vidLectImage.png');
                                    background-size: cover;
                                    background-position: center;"
            )
   ),
   br(),
   br(),
   ############################################
   ##  End video and possibly handout section
   ############################################
   
   
   
   
    
    
    
    #############################################
    ##  End of page section
    #############################################
    br(),
    br(),
    h2("What's Next?"),
    br(),
    "...A few sentences connecting this module to the next...",
    br(),
    br(),
   
    br(),
    br(),
    br()
    ################################################
    ##  End End of Page Section
    ################################################
    
    
    
    
    
    
    
    
  )
  
}




concReviewServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      observeEvent(input$video1,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 720px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            
            tags$iframe(
              width="1280",
              height="720",
              src = "Statistical Literacy Lecture 14 (Review).mp4", 
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
            )
          )
          
        ))
        
      })
      
      observeEvent(input$video2,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 720px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            
            tags$iframe(
              width="1280",
              height="720",
              src = "Statistical Literacy Lecture Survival__.mp4", 
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
            )
          )
          
        ))
        
      })
      
      observeEvent(input$video3,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 720px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            
            tags$iframe(
              width="1280",
              height="720",
              src = "Statistical Literacy Lecture QI__.mp4", 
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
            )
          )
          
        ))
        
      })
      
      
      
      
      
    }
  )}