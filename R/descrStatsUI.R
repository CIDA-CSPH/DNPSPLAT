


# Module UI function
descrStatsUI <- function(id) {
  
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
             h1("Module 3: The Sample",
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
    
    br(),
    br(),
    h2("Lecture: Descriptive Statistics: Numbers and Tables"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    #  ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    #  a("Handout: Case Study: Table 1",target="_blank",href="temp"),  
    #  br(),   
    #  "Download all handouts here:",
    #  a("All Handouts",target="_blank",href="temp"),
    #  br(),
    #  br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Lecture: Descriptive Statistics",
             actionButton(ns("video3c"),
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
    h2("Discussion: Table 1"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    #a("Handout: Case Study: Table 1",target="_blank",href="temp"),  
    #br(),   
    #"Download all handouts here:",
    #a("All Handouts",target="_blank",href="temp"),
    #br(),
    #br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Discussion: Table 1",
             actionButton(ns("video3d"),
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
    h2("Lecture: Descriptive Statistics: Graphs and Plots"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    #a("Handout: Case Study: Table 1",target="_blank",href="temp"),  
    #br(),   
    #"Download all handouts here:",
    #a("All Handouts",target="_blank",href="temp"),
    #br(),
    #br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Lecture: Descriptive Statistics: Graphs and Plots",
             actionButton(ns("video3e"),
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
    h2("Case Study: Table 1"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    a("Handout: Case Study: Table 1",target="_blank",href="temp"),  
    br(),   
    "Download all handouts here:",
    a("All Handouts",target="_blank",href="temp"),
    br(),
    br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Case Study: Table 1",
             actionButton(ns("video3f"),
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





descrStatsServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      
      
      observeEvent(input$video3c,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 3, Part 2: Descriptive Statistics"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video3c.mp4",
              src = "video3c.pdf",
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
                   actionButton(("video3c_3b"), label = "< Previous Video") ,actionButton(("video3c_3d"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br()#,
                   #tags$a("Handout: Best Data Practices",target="_blank",href="dataPract.pdf", align="center"),
                   #br(),
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      
      
      observeEvent(input$video3d,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 3, Part 2: Table 1"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video3d.mp4",
              src = "video3d.pdf",
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
                   actionButton(("video3d_3c"), label = "< Previous Video") ,actionButton(("video3d_3e"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br()#,
                   #tags$a("Handout: Best Data Practices",target="_blank",href="dataPract.pdf", align="center"),
                   #br(),
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      observeEvent(input$video3e,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 3, Part 2: Descriptive Statistics"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video3e.mp4",
              src = "video3e.pdf",
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
                   actionButton(("video3e_3d"), label = "< Previous Video") ,actionButton(("video3e_3f"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br()#,
                   #tags$a("Handout: Best Data Practices",target="_blank",href="dataPract.pdf", align="center"),
                   #br(),
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      observeEvent(input$video3f,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 3, Part 2: Descriptive Statistics"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video3f.mp4",
              src = "video3f.pdf",
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
                   actionButton(("video3f_3e"), label = "< Previous Video") ,actionButton(("video3f_40"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   tags$a("Case Study: Table 1",target="_blank",href="case3f.pdf", align="center"),
                   br(),
                   tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
    })
}


