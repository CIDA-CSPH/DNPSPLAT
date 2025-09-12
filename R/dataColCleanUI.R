


# Module UI function
dataColCleanUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  mainPanel(
    
    
    
    
    
    #column(width=12,
           
           tags$div(style="display:inline-block;height:45;",
                    title="Module and Section",
                    h1("Module 3: The Sample",
                       style="height: 45px; padding: 10px;"
                    ),
           ),
           
           #column(width=6,
                  #########################################
                  ##  Beginning of Page Title and buttons
                  #########################################
                  
                  
                  br(),
                  br(),
                  "This is our second stop along the research process flow chart: the sample, which consists of two elements, data collection and cleaning and descriptive statistics. 
    While these steps can be mathematically simple, they set the foundation for statistical inference, which will make up the rest of the course. If you haven't yet, click the link below to download the course workbook. Then click the first video to start the module.",
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
           #),
           
           #column(width=5,
                  br(),
             #     tags$div(style="display:inline-block;width:500px;height:200;",
             #              title="Flowchart",
             #              img(src='statsResProc2.png', width=450, height=350)),
                  
                  
                  
                  
              #    tags$div(style="display:inline-block;width:500px;height:200;",
              #             title="Flowchart",
              #             actionButton(ns("videoXX"),
              #                          label=NULL,
              #                          style="width: 450px;
              #                  height: 350px;
              #                  #padding: 10px; 
              #                  font-size: 200%;
              #                  background: url('statsResProc2.png');
              #                  background-size: cover;
              #                  background-position: center;"
              #             )
              #    ),
                  

    
    
    
    
    
    
    
    #########################################
    ##  Beginning of Page Title and buttons
#    #########################################
#    br(),
#    tags$div(style="display:inline-block;height:45;",
#             title="Module and Section",
#             h1("Module 3: The Sample",
#                style="height: 45px; padding: 10px;"
#             )
#    ),
#    br(),
#    br(),
#    "This is our second stop along the research process flow chart: the sample, which consists of two elements, data collection and cleaning and descriptive statistics. 
#    While these steps can be mathematically simple, they set the foundation for statistical inference, which will make up the rest of the course. If you haven't yet, click the link below to download the course workbook. Then click the first video to start the module.",
#    br(),
#    br(),
#    tags$a(href="240630 Statistical Literacy Workbook.docx",download="240630 Statistical Literacy Workbook.docx",
#           "Booklet of All Course Materials",target="_blank"),
#    br(),
#    br(),
#    br(),
#    br(),
#    ############################################
#    ##  End beginning of page buttons
#    ############################################
    
    
    
    
    
  #  column(width=12,
#
  #         column(width=6,
  #                #########################################
  #                ##  Beginning of Page Title and buttons
  #                #########################################
#
  #                tags$div(style="display:inline-block;height:45;",
  #                         title="Module and Section",
  #                         h1("Module 3: The Sample",
  #                            style="height: 45px; padding: 10px;"
  #                         )
  #                ),
  #                br(),
  #                br(),
  #                
  #                "This is our second stop along the research process flow chart: the sample, which consists of two elements, data collection and cleaning and descriptive statistics. 
  #  While these steps can be mathematically simple, they set the foundation for statistical inference, which will make up the rest of the course. If you haven't yet, click the link below to download the course workbook. Then click the first video to start the module.",
  #  br(),
  #  br(),
  #  tags$a(href="240630 Statistical Literacy Workbook.docx",download="240630 Statistical Literacy Workbook.docx",
  #         "Booklet of All Course Materials",target="_blank"),
  #  br(),
  #  br(),
  #  br(),
  #  br(),
  #  ############################################
  #  ##  End beginning of page buttons
  #  ############################################
  #         ),
#
  #  column(width=5,
  #         br(),
  #         tags$div(style="display:inline-block;width:500px;height:200;",
  #                  title="Flowchart",
  #                  actionButton(ns("videoXX"),
  #                               label=NULL,
  #                               style="width: 450px;
  #                              height: 350px;
  #                              #padding: 10px; 
  #                              font-size: 200%;
  #                              background: url('statsResProc2.png');
  #                              background-size: cover;
  #                              background-position: center;"
  #                  )
  #         ),
  #         
  #         br(),
  #         br(),
  #         br(),
  #         br(),
  #         br()
  #         
  #         
  #  )
  #  ),
  #  br(),
  #  br(),
    
    
    
    
    
    h2("Start Module 3"),
    br(),
    
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Start Module 2",
             actionButton(ns("video30"),
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
    
    h2("3.1.1. Lecture: Sampling and Data Collection"),
    h5("8 min. 39 sec."),
    br(),
    "The way in which we select our sample and collect our data can have quite an impact on the results and conclusions of our study.",
    br(),
    br(),
    
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="3.1.1. Lecture: Sampling and Data Collection",
             actionButton(ns("video3a"),
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
    
    
    
    
    h2("3.1.2. Lecture: Ethical Data Practices"),
    h5("7 min. 53 sec."),
    br(),
    "Ethical data practices are just as important as, if not more important than, the wasy we sample our data.",
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
             title="3.1.2. Lecture: Ethical Data Practices",
             actionButton(ns("video3b"),
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
    
    
    
    
    h2("3.1.3. Case Study: Will Cody's Ethical Conundrum"),
h5("Video: 8 min. 57 sec. Entire exercise: approximately 20 minutes."),
    br(),
    "Our statistician faces an ethical conundrum, facing ethical issues we've discussed already, as well as some new ones.",
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
            title="3.1.3. Case Study: Will Cody's Ethical Conundrum",
            actionButton(ns("video3c"),
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
   br(),
   br(),
   
   
   
   
   
   
   
   ################################################
   ## Video and possibly handout content
   ################################################
   ## Video title and a few sentences introducing it
   h2("3.2.1. Lecture: Descriptive Statistics: Numbers and Tables"),
h5("6 min. 21 sec."),
   br(),
   "There are several reasons to describe your data. There are also several ways in which we do that. We discuss two of them here: numbers and tables.",
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
            title="3.2.1. Lecture: Descriptive Statistics: Numbers and Tables",
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
   h2("3.2.2. Lecture: Descriptive Statistics: Figures and Graphs"),
h5("7 min. 21 sec."),
   br(),
   "Following onto our last lecture, we discuss some other ways to describe our data, including figures and graphs.",
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
           title="3.2.2. Lecture: Descriptive Statistics: Figures and Graphs",
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
  h2("3.2.1. Exercise: Table 1"),
  h5("Approximately 20 minutes."),
  br(),
  "Using the Descriptive Statistics tool under Analysis Tools on this site, you will create your own table 1.",
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
           title="3.2.1. Exercise: Table 1",
           actionButton(ns("video3f"),
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
  ############################################
  ##  End video and possibly handout section
  ############################################
  
  
  
  
  
  
  
  
  br(),
  br(),
  h2("What's Next?"),
  br(),
  "Having traversed the first two rows of our research process flow chart, we will now learn about inferential statistics in detail, as the next three modules explore that last row on our flow chart. Our first stop is estimation and confidence intervals.",
  br(),
  br(),
  
  br()
  
  
  )
  
}




dataColCleanServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      
      
      observeEvent(input$video30,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 3: The Sample"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video30.mp4",
              src = "mod3Intro.mp4",
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
                   actionButton(("video30_2f"), label = "< Previous Video") , actionButton(("video30_3a"), label = "Next Video >") 
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
      
      
      
      
      observeEvent(input$video3a,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("3.1.1. Lecture: Sampling and Data Collection"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video3a.mp4",
              #src = "video3a.pdf",
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
                   actionButton(("video3a_30"), label = "< Previous Video") , actionButton(("video3a_3b"), label = "Next Video >") 
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
      
      
      observeEvent(input$video3b,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("3.1.2. Lecture: Ethical Data Practices"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video3b.mp4",
              #src = "video3b.pdf",
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
                   actionButton(("video3b_3a"), label = "< Previous Video") , actionButton(("video3b_3c"), label = "Next Video >") 
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
      
      
      observeEvent(input$video3c,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("3.1.3. Case Study: Will Cody's Ethical Conundrum"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video3c.mp4",
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
                   actionButton(("video3c_3b"), label = "< Previous Video") , actionButton(("video3c_3d"), label = "Next Video >") 
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
      
      
      
      
      
      observeEvent(input$video3d,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("3.2.1. Lecture: Descriptive Statistics: Numbers and Tables"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video3d.mp4",
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
                   actionButton(("video3d_3c"), label = "< Previous Video") , actionButton(("video3d_3e"), label = "Next Video >") 
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
      
      
      
      
      observeEvent(input$video3e,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("3.2.2. Lecture: Descriptive Statistics: Figures and Graphs"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video3e.mp4",
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
                   actionButton(("video3e_3d"), label = "< Previous Video") , actionButton(("video3e_3f"), label = "Next Video >") 
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
      
      
      
      
      observeEvent(input$video3f,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("3.2.3. Exercise: Table 1"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video3f.mp4",
              src = "video3f.png",
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
                   actionButton(("video3f_3e"), label = "< Previous Video") , actionButton(("video3f_40"), label = "Next Video >") 
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
