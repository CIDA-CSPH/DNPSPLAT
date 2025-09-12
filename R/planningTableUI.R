


# Module UI function
planningTableUI <- function(id) {
  
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
           

    
    

    
    h2("Start Analysis Planning for DNP Students"),
    br(),
    
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Start Analysis Planning for DNP Students",
             actionButton(ns("videoDNP_PT0"),
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

   
    h2("Temp 1"),

    br(),
    br(),

    tags$div(style="display:inline-block;width:500px;height:200;",
             title="2.1.1.Lecture: Scientific Aims and Thinking",
             actionButton(ns("videoDNP_PT1"),
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





planningTableServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      

          
          
          observeEvent(input$videoDNP_PT0,{
            showModal(modalDialog(
              tags$div(
                style = "height: 780px; background-color: #818e9f; width: 1280px; position: relative; right:0;",
                h3("Analysis Planning for DNP Students"),
                tags$iframe(
                  width="1280",
                  height="720",
                  src = "videoDNP_PT0.mp4",
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
                       actionButton(("videoDNP_PT1"), label = "Next Video >") 
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
          
          
      
      
      observeEvent(input$videoDNP_PT1,{
        showModal(modalDialog(style = "background-color: #818e9f;",
          tags$div(
            style = "height: 370px; background-color: #818e9f; width: 800px; position: relative; right:0;",

            column(12,style = " background-color: white; border-radius: 4px; ",
                   
                   br(),
                   column(width=10,
                          h2("Measure Name and Type")),
                   column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                          column(width=6,h4(style="color:#818e9f;", "Learn:")),
                          column(width=4,
                                 actionButton(("snipDNP_PTa0"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                                 actionButton(("snipDNP_PTb0"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                                 #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                          )),
                   br(),
                   br(),
                   br(),
                   column(width=12,
                          br(),
                            "Enter your measure name and measure type.",
                          br(),
                          br(),
                          textInput(("measureName"),"Measure Name",value="Measure 1"),
                          br(),
                          br(),
                          selectInput(("measureType"),"Measure Type",choices = c("Outcome Measure","Process Measure","Balancing Measure")),
                          br(),
                          br()
                   )
            ),

            column(width = 4,
                   br(),
                   br(),
                   actionButton(("videoDNP_PT0"), label = "< Previous") , actionButton(("videoDNP_PT2"), label = "Next >") 
            ), #end column
            #column(width = 4,
            #       br(),
            #       br(),
            #       #a("Handout: Analysis Planning Table",target="_blank",href="221119 Statistical Planning Table.pdf"), 
            #       br()#, 
            #       #a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf")
            #),


        ))          )
      })
      
      
      
      
      
      
      
    })
}


