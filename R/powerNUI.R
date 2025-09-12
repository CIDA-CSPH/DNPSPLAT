


# Module UI function
powerNUI <- function(id) {
  
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
             h1("Module 2: Design",
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
    h2("Lecture: Power, Sample Size, and Effect Size"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    ####  ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    ####  a("Handout Link",target="_blank",href=""),  
    ####  br(),   
    ####  "Download all handouts here:",
    ####  a("All Handouts",target="_blank",href="temp"),
    ####  br(),
    ####  br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Lecture: Power, Sample Size, and Effect Size",
             actionButton(ns("video2d"),
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
    h2("Discussion: Powering a Study"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    ####  ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    ####  a("Handout Link",target="_blank",href=""),  
    ####  br(),   
    ####  "Download all handouts here:",
    ####  a("All Handouts",target="_blank",href="temp"),
    ####  br(),
    ####  br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Discussion: Powering a Study",
             actionButton(ns("video2e"),
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
    h2("Case Study: Will Cody's Power Analysis"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
      ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
      a("Case Study: Will Cody's Power Analysis",target="_blank",href="190924 Case 7 - Super Power Analysis.docx.pdf"),  
      br(),   
      "Download all handouts here:",
      a("All Handouts",target="_blank",href="240501 All Course Materials Stat Lit 1.pdf"),
      br(),
      br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Case Study: Power, Sample Size, and Effect Size",
             actionButton(ns("video2f"),
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
    #actionButton("toNextIA2", label = "< Previous Module"), actionButton("toNextII2", label = "To Next Model >"),
    br(),
    br(),
    br()
    ################################################
    ##  End End of Page Section
    ################################################
    
    
    
    
  )
  
}




powerNServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      observeEvent(input$video2d,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 2, Part 2: Power & Sample Size"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video2d.mp4",
              #src = "video2d.pdf",
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
            ),
            br(),
            br(),
            column(width = 4,
                   br(),
                   br(),
                   actionButton(("video2d_2c"), label = "< Previous Video") , actionButton(("video2d_2e"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: Case Study: Will Cody Plans an Analysiss",target="_blank",href="190924 Case 8 - Variable Relationships.docx.pdf", align="center"),
                   br(),
                   
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      observeEvent(input$video2e,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 2, Part 2: Powering a Study"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video2e.mp4",
              src = "video2e.pdf",
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
            ),
            br(),
            br(),
            column(width = 4,
                   br(),
                   br(),
                   actionButton(("video2e_2d"), label = "< Previous Video") , actionButton(("video2e_2f"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: Case Study: Will Cody Plans an Analysiss",target="_blank",href="190924 Case 8 - Variable Relationships.docx.pdf", align="center"),
                   br(),
                   
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      observeEvent(input$video2f,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 2, Part 2: Case Study: Will Cody's Power Analysis"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video2f.mp4",
              src = "video2f.pdf",
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
            ),
            br(),
            br(),
            column(width = 4,
                   br(),
                   br(),
                   actionButton(("video2f_2e"), label = "< Previous Video") , actionButton(("video2f_3a"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   tags$a("Handout: Case Study: Will Cody's Power Analysis",target="_blank",href="190924 Case 7 - Super Power Analysis.docx.pdf", align="center"),
                   br(),
                   
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      
      
    }
  )}