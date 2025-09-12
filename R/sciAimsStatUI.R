


# Module UI function
sciAimsStatUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  mainPanel(
    

    
    
    
    
    
    
    
    
  #  column(width=12,
           
           tags$div(style="display:inline-block;height:45;",
                    title="Module and Section",
                    h1("Module 2: Study Design",
                       style="height: 45px; padding: 10px;"
                    )
           ),
           
       #    column(width=6,
                  #########################################
                  ##  Beginning of Page Title and buttons
                  #########################################
                  

                  br(),
                  br(),
                  "This is our first stop along the research process flow chart: study design, which consists of two elements, the statistical analysis plan and the power/sample size/effect size analysis. 
    These fundamental pieces determine everything we plan to do throughout the rest of our study. If you haven't yet, click the link below to download the course workbook. Then click the first video to start the module.",
    br(),
    br(),
    
    tags$a(href="240630 Statistical Literacy Workbook.docx",download="240630 Statistical Literacy Workbook.docx",
           "Course Workbook",target="_blank"),
    br(),
    br(),
    br(),
    br(),
    ############################################
    ##  End beginning of page buttons
    ############################################
    #       ),
    
   # column(width=5,
           br(),
           ##tags$div(style="display:inline-block;width:500px;height:200;",
           #         title="Flowchart",
           #         img(src='statsResProc1.png', width=450, height=350)),
           

    
    

    
    h2("Start Module 2"),
    br(),
    
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Start Module 2",
             actionButton(ns("video20"),
                          label=NULL,
                          style="width: 350px;
                                height: 200px;
                                #padding: 10px; 
                                font-size: 200%;
                                background: url('play.png');
                                background-size: cover;
                                background-position: center;"
             )
    ),
    br(),
    br(),
    br(),
    br(),
    br(),

   
    h2("2.1.1. Lecture: Scientific Aims and Thinking"),
   h5("9 min. 17 sec."),
    br(),
    "This lecture gives an introduction to thinking like a scientist in research as 
    seen in scientific aims and scientific hypotheses. 
    This will be useful to students and researchers learning to write 
    statistical hypotheses and choose statistical methods based on  
    scientific aims and hypotheses. ",
    br(),
    br(),

    tags$div(style="display:inline-block;width:500px;height:200;",
             title="2.1.1.Lecture: Scientific Aims and Thinking",
             actionButton(ns("video2a"),
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
    br(),
    br(),
    br(),
    
    
    
    
    h2("2.1.2. Lecture: Statistical Thinking and Planning"),
   h5("10 min. 14 sec."),
      br(),
    "Having learned about scientific aims and hypotheses, here we discuss statistical thinking and how a statistician turns scientific aims 
    and hypotheses into a statistical analysis plan.",
        br(),
        br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
    #a("Handout: Analysis Planning Table",target="_blank",href="221119 Statistical Planning Table.pdf"), 
    #br(), 
    #a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf"), 
   # br(), 
   # "Download all handouts here:",
   # a("All Handouts",target="_blank",href="240501 All Course Materials Stat Lit 1.pdf"),
   #     br(),
   #     br(),
    ## Video icon and link
       tags$div(style="display:inline-block;width:500px;height:200;",
             title="2.1.2. Lecture: Statistical Thinking and Planning",
             actionButton(ns("video2b"),
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
    br(),
   
    br(),
    br(),
   
   
   
   
   
   h2("2.1.3. Handout: Statistical Thinking and Planning"),
   h5("No duration."),
   br(),
   "This is the handout referenced in the video above. You will find it in section 2.1.3. in your course workbook.",
   br(),
   br(),
   ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
   #a("Handout: Analysis Planning Table",target="_blank",href="221119 Statistical Planning Table.pdf"), 
   #br(), 
   #a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf"), 
   # br(), 
   # "Download all handouts here:",
   # a("All Handouts",target="_blank",href="240501 All Course Materials Stat Lit 1.pdf"),
   #     br(),
   #     br(),
   ## Video icon and link
   tags$div(style="display:inline-block;width:500px;height:200;",
            title="2.1.3. Handout: Statistical Thinking and Planning",
            actionButton(ns("video2b1"),
                         label=NULL,
                         style="width: 350px;
                                height: 200px;
                                #padding: 10px; 
                                font-size: 200%;
                                background: url('handout.png');
                                background-size: cover;
                                background-position: center;"
            )
   ),
   br(),
   br(),
   br(),
   
   br(),
   br(),
   
   
   
    h2("2.1.4. Exercise: Planning an Analysis"),
   h5("Approximately 20 minutes."),
    br(),
    "With this exercise we practice the thinking skills we have learned in the previous two videos. 
   Starting with scientific aims and hypotheses, we think like a statistician and come up with statistical analysis plan verbage. 
   You can find this exercise in your workbook.",
    br(),
    br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
  # a("Case Study: Planning an Analysis",target="_blank",href="190924 Case 8 - Variable Relationships.docx.pdf"), 
  # br(),   
  # "Download all handouts here:",
  # a("All Handouts",target="_blank",href="240501 All Course Materials Stat Lit 1.pdf"),
  # br(),
  # br(),
   ## Video icon and link
   tags$div(style="display:inline-block;width:500px;height:200;",
            title="2.1.4. Exercise: Planning an Analysis",
            actionButton(ns("video2c"),
                         label=NULL,
                         style="width: 350px;
                               height: 200px;
                               #padding: 10px; 
                               font-size: 200%;
                               background: url('exercise.png');
                               background-size: cover;
                               background-position: center;"
            )
   ),
   br(),
   br(),   
  br(),
  br(),
  br(),
    
    
    
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    h2("2.2.1. Lecture: Power, Sample Size, and Effect Size"),
  h5("3 min. 35 sec."),
    br(),
    "The second aspect of study design is the power, sample size, or effect size analysis. We introduce the basic principals here.",
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
             title="2.2.1. Lecture: Power, Sample Size, and Effect Size",
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
    h2("2.2.2. Lecture: Conducting a Power Analysis"),
  h5("7 min. 9 sec."),
    br(),
    "Now that we've learned the principles of a power/sample size/effect size analysis, we will expand our 
  understanding by following one of these analyses from beginning to end.",
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
             title="2.2.2. Lecture: Conducting a Power Analysis",
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
    h2("2.2.3. Case Study: Will Cody's Power Analysis"),
  h5("Video: 8 min.  Entire case study: 20 minutes."),
    br(),
    "In this case study we will examine the assumptions of power analyses and conduct one of our own.",
    br(),
    br(),
    ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
   # a("Case Study: Will Cody's Power Analysis",target="_blank",href="190924 Case 7 - Super Power Analysis.docx.pdf"),  
   # br(),   
   # "Download all handouts here:",
   # a("All Handouts",target="_blank",href="240501 All Course Materials Stat Lit 1.pdf"),
   # br(),
   # br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="2.2.3. Case Study: Will Cody's Power Analysis",
             actionButton(ns("video2f"),
                          label=NULL,
                          style="width: 350px;
                                    height: 200px;
                                    #padding: 10px; 
                                    font-size: 200%;
                                    background: url('caseStudy.png');
                                    background-size: cover;
                                    background-position: center;"
             )
    ),
    br(),
    br(),
  br(),
    ############################################
    ##  End video and possibly handout section
    ############################################
    
    
    
    
    
    
    
    
    br(),
    br(),
    h2("What's Next?"),
    br(),
    "Now that we've learned about study design, the top row in our flow chart, we turn our attention to the middle row, the sample.",
    br(),
    br(),
    
    br()
    
    
    
    
  
  )
  
}





sciAimsStatServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      observeEvent(input$video20,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 2: Study Design"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video20.mp4",
              src = "mod2Intro.mp4",
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
                   actionButton(("video20_1e"), label = "< Previous Video") , actionButton(("video20_2a"), label = "Next Video >") 
            ), #end column
            #column(width = 4,
            #       br(),
            #       br(),
            #       #a("Handout: Analysis Planning Table",target="_blank",href="221119 Statistical Planning Table.pdf"), 
            #       br()#, 
            #       #a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf")
            #),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      observeEvent(input$video2a,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("2.1.1. Lecture: Scientific Aims and Thinking"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video2a.mp4",
              #src = "video2a.pdf",
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
                   actionButton(("video2a_20"), label = "< Previous Video") , actionButton(("video2a_2b"), label = "Next Video >") 
            ), #end column
           # column(width = 4,
           #        br(),
           #        br(),
           #        a("Handout: Analysis Planning Table",target="_blank",href="221119 Statistical Planning Table.pdf"), 
           #        br(), 
           #        a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf")
           # ),
            br(),
            br(),
          )
        ))
      })
      
      
      observeEvent(input$video2b,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("2.1.2. Lecture: Statistical Thinking and Planning"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video2b.mp4",
              #src = "video2b.pdf",
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
                   actionButton(("video2b_2a"), label = "< Previous Video") , actionButton(("video2b_2b1"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Course Syllabus",target="_blank",href="syllabus.pdf", align="center"),
                   br(),
                   
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      observeEvent(input$video2b1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("2.1.3. Handout: Statistical Thinking and Planing"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video2b1.png",
              #src = "video2b.pdf",
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
                   actionButton(("video2b1_2b"), label = "< Previous Video") , actionButton(("video2b1_2c"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Course Syllabus",target="_blank",href="syllabus.pdf", align="center"),
                   br(),
                   
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      observeEvent(input$video2c,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("2.1.4. Exercise: Planning an Analysis"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video2c.png",
              #src = "exercise.png",
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
                   actionButton(("video2c_2b1"), label = "< Previous Video") , actionButton(("video2c_2d"), label = "Next Video >") 
            ), #end column
            #column(width = 4,
            #       br(),
            #       br(),
            #       tags$a("Handout: Case Study: Will Cody Plans an Analysiss",target="_blank",href="190924 Case 8 - Variable Relationships.docx.pdf", align="center"),
            #       br(),
            #       
            #       #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            #),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      
      observeEvent(input$video2d,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("2.2.1. Lecture: Power, Sample Size, and Effect Size"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video2d.mp4",
              #src = "exercise.png",
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
            #column(width = 4,
            #       br(),
            #       br(),
            #       tags$a("Handout: Case Study: Will Cody Plans an Analysiss",target="_blank",href="190924 Case 8 - Variable Relationships.docx.pdf", align="center"),
            #       br(),
            #       
            #       #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            #),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      observeEvent(input$video2e,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("2.2.2. Lecture: Conducting a Power Analysis"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video2e.mp4",
              #src = "exercise.png",
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
            #column(width = 4,
            #       br(),
            #       br(),
            #       tags$a("Handout: Case Study: Will Cody Plans an Analysiss",target="_blank",href="190924 Case 8 - Variable Relationships.docx.pdf", align="center"),
            #       br(),
            #       
            #       #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            #),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      observeEvent(input$video2f,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("2.2.3. Case Study: Will Cody's Power Analysis"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video2f.mp4",
              #src = "exercise.png",
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
                   actionButton(("video2f_2e"), label = "< Previous Video") , actionButton(("video2f_30"), label = "Next Video >") 
            ), #end column
            #column(width = 4,
            #       br(),
            #       br(),
            #       tags$a("Handout: Case Study: Will Cody Plans an Analysiss",target="_blank",href="190924 Case 8 - Variable Relationships.docx.pdf", align="center"),
            #       br(),
            #       
            #       #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            #),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
    })
}


