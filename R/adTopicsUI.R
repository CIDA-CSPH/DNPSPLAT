


# Module UI function
adTopicsUI <- function(id) {
  
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
    h2("Start Module 7"),
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
             title="Start Module 7",
             actionButton(ns("video70"),
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
    h2("Lecture: Correlation"),
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
             title="Lecture: Correlation",
             actionButton(ns("video7a"),
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
    h2("Discussion: Correlation"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
      ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
      #a("Discussion: Correlation",target="_blank",href="temp"),  
      #br(),   
      #"Download all handouts here:",
      #a("All Handouts",target="_blank",href="temp"),
      #br(),
      #br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Discussion: Correlation",
             actionButton(ns("video7b"),
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
    h2("Lecture: Survival Analysis"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    #a("Handout: Modelling Table",target="_blank",href="temp"),  
    #br(),   
    #"Download all handouts here:",
    #a("All Handouts",target="_blank",href="temp"),
    #br(),
    #br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Lecture: Survival Analysis",
             actionButton(ns("video7c"),
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
    h2("Lecture: Quality Improvement"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    #a("Handout: Conducting a T-test",target="_blank",href="temp"),  
    #br(),   
    #"Download all handouts here:",
    #a("All Handouts",target="_blank",href="temp"),
    #br(),
    #br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Video Lecture: Quality Improvement",
             actionButton(ns("video7e"),
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
    #a("Handout: Conducting a T-test",target="_blank",href="temp"),  
    #br(),   
    #"Download all handouts here:",
    #a("All Handouts",target="_blank",href="temp"),
    #br(),
    #br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Lecture: Review",
             actionButton(ns("video7g"),
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
    h2("Discussion: Common Pitfalls"),
    br(),
    "...A few sentences that introduce video (and handout if there is one)...",
    br(),
    br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    #a("Handout: Conducting a T-test",target="_blank",href="temp"),  
    #br(),   
    #"Download all handouts here:",
    #a("All Handouts",target="_blank",href="temp"),
    #br(),
    #br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Lecture: Review",
             actionButton(ns("video7h"),
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
             title="Case Study: Meeting with an Investigator",
             actionButton(ns("video7i"),
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


adTopicsServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      
      
      observeEvent(input$video70,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 7: Additional Topics and Conclusions"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video5g.mp4",
              src = "mod7Intro.mp4",
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
                   actionButton(("video70_6i"), label = "< Previous Video") ,actionButton(("video70_7a"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Problematic P-Value",target="_blank",href="191001 Case 5 - Problematic P-Value.docx.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      observeEvent(input$video7a,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 7: Correlation"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video7a.mp4",
              #src = "video7a.pdf",
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
                   actionButton(("video7a_70"), label = "< Previous Video") ,actionButton(("video7a_7b"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Problematic P-Value",target="_blank",href="191001 Case 5 - Problematic P-Value.docx.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      observeEvent(input$video7b,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 7: Correlation"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video5g.mp4",
              src = "video7b.pdf",
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
                   actionButton(("video7b_7a"), label = "< Previous Video") ,actionButton(("video7b_7c"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Problematic P-Value",target="_blank",href="191001 Case 5 - Problematic P-Value.docx.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      observeEvent(input$video7c,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 7: Survival Analysis"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video5g.mp4",
              src = "video7c.pdf",
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
                   actionButton(("video7c_7b"), label = "< Previous Video") ,actionButton(("video7c_7d"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Problematic P-Value",target="_blank",href="191001 Case 5 - Problematic P-Value.docx.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      observeEvent(input$video7d,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 7: Survival Analysis"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video5g.mp4",
              src = "video7d.pdf",
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
                   actionButton(("video7d_7c"), label = "< Previous Video") ,actionButton(("video7d_7e"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Problematic P-Value",target="_blank",href="191001 Case 5 - Problematic P-Value.docx.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      observeEvent(input$video7e,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 7: Quality Improvement"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video5g.mp4",
              src = "video7e.pdf",
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
                   actionButton(("video7e_7d"), label = "< Previous Video") ,actionButton(("video7e_7g"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Problematic P-Value",target="_blank",href="191001 Case 5 - Problematic P-Value.docx.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      observeEvent(input$video7g,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 7: Review"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video7g.mp4",
              #src = "video7g.pdf",
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
                   actionButton(("video7g_7e"), label = "< Previous Video") ,actionButton(("video7g_7h"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Problematic P-Value",target="_blank",href="191001 Case 5 - Problematic P-Value.docx.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      observeEvent(input$video7h,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 7: Common Pitfalls"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video5g.mp4",
              src = "video7h.pdf",
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
                   actionButton(("video7h_7g"), label = "< Previous Video") ,actionButton(("video7h_7i"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Problematic P-Value",target="_blank",href="191001 Case 5 - Problematic P-Value.docx.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      observeEvent(input$video7i,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 7: Meeting with an Investigator"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video5g.mp4",
              src = "video7i.pdf",
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
                   actionButton(("video7i_7h"), label = "< Previous Video") ,actionButton(("video7i_80"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   tags$a("Case Study: Meeting with an Investigator",target="_blank",href="191022 Case 10 Meeting with an Investigator.docx.pdf", align="center"),
                   br(),
                   tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      observeEvent(input$video80,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Course Complete"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video5g.mp4",
              src = "video80.pdf",
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
                   actionButton(("video80_7i"), label = "< Previous Video") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Case Study: Meeting with an Investigator",target="_blank",href="191022 Case 10 Meeting with an Investigator.docx.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br()
          )
        ))
      })
      
      
      
      
    }
  )}