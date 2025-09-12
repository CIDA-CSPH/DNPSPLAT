


# Module UI function
modelUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  
  mainPanel(
    
    
    
    
  #  column(width=12,
           
           tags$div(style="display:inline-block;height:45;",
                    title="Module and Section",
                    h1("Module 6: Modelling",
                       style="height: 45px; padding: 10px;"
                    )
           ),
           
       #   column(width=6,
                  #########################################
                  ##  Beginning of Page Title and buttons
                  #########################################
                  
                  
                  br(),
                  br(),
                  "Having gained an understanding a p-values and added hypothesis tests to our analytical tools, we expand our set of tools as we learn about statistical models and variable relationships. If you haven't yet, click the link below to download the course workbook. Then click the first video to start the module.",
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
         #  ),
           
         #  column(width=5,
                  br(),
                #  tags$div(style="display:inline-block;width:500px;height:200;",
                #           title="Flowchart",
                #           img(src='statsResProc4.png', width=450, height=350)),
                  

    
    
    
    
    
    
    
    
    
 #   
 #   #########################################
 #   ##  Beginning of Page Title and buttons
 #   #########################################
 #   br(),
 #   tags$div(style="display:inline-block;height:45;",
 #            title="Module and Section",
 #            h1("Module 6: Statistical Modelling",
 #               style="height: 45px; padding: 10px;"
 #            )
 #   ),
 #   br(),
 #   br(),
 #   "Having gained an understanding a p-values and added hypothesis tests to our analytical tools, we expand our set of tools as we learn about statistical models and variable relationships. If you haven't yet, click the link below to download the course workbook. Then click the first video to start the module.",
 #   tags$a(href="240630 Statistical Literacy Workbook.docx",download="240630 Statistical Literacy Workbook.docx",
 #          "Booklet of All Course Materials",target="_blank"),
 #   
 #   br(),
 #   br(),
 #   ############################################
 #   ##  End beginning of page buttons
 #   ############################################
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("Start Module 6"),

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
             title="Start Module 6: Modelling",
             actionButton(ns("video60"),
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
    ############################################
    ##  End video and possibly handout section
    ############################################
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("6.1.1. Lecture: Variable Relationships"),
    h5("6 min. 34 sec."),
    br(),
    "We start this module with a discussion of how modelling is built on variable relationships.",
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
             title="6.1.1. Lecture: Variable Relationships",
             actionButton(ns("video6a"),
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
#    ## Video title and a few sentences introducing it
#    br(),
#    br(),
#    h2("Discussion: Statistical Modelling"),
#    br(),
#    "...A few sentences that introduce video (and handout if there is one)...",
#    br(),
#    br(),
#    ####  ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
#    ####  a("Handout Link",target="_blank",href=""),  
#    ####  br(),   
#    ####  "Download all handouts here:",
#    ####  a("All Handouts",target="_blank",href="temp"),
#    ####  br(),
#    ####  br(),
#    ## Video icon and link
#    tags$div(style="display:inline-block;width:500px;height:200;",
#             title="Video Discussion: Statistical Modelling",
#             actionButton(ns("video6b"),
#                          label=NULL,
#                          style="width: 350px;
#                                    height: 200px;
#                                    #padding: 10px; 
#                                    font-size: 200%;
#                                    background: url('vidLectImage.png');
#                                    background-size: cover;
#                                    background-position: center;"
#             )
#    ),
#    br(),
#    br(),
#    ############################################
#    ##  End video and possibly handout section
#    ############################################
#    
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("6.1.2. Lecture: Hypothesis Testing and Modelling"),
h5("4 min. 43 sec."),
    br(),
    "We continue by discussing the relationship between hypothesis testing and modelling.",
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
             title="6.1.2. Lecture: Hypothesis Testing and Modelling",
             actionButton(ns("video6c"),
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
h2("6.1.3. Exercise: Hypothesis Tests as Models"),
h5("Approximately 15 minutes."),
br(),
"This exercise can be found in section 6.1.3. of your course workbook. There is no video for this section.",
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
         title="6.1.3. Hypothesis Tests as Models",
         actionButton(ns("video6c1"),
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
############################################
##  End video and possibly handout section
############################################

    
    
    
#   ################################################
#   ## Video and possibly handout content
#   ################################################
#   ## Video title and a few sentences introducing it
#   br(),
#   br(),
#   h2("Discussion: Simple Statistical Models"),
#   br(),
#   "...A few sentences that introduce video (and handout if there is one)...",
#   br(),
#   br(),
#     ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
#     a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf"),  
#     br(),   
#     "Download all handouts here:",
#     a("All Handouts",target="_blank",href="bookAll.pdf"),
#     br(),
#     br(),
#   ## Video icon and link
#   tags$div(style="display:inline-block;width:500px;height:200;",
#            title="Video Discussion: Simple Statistical Models",
#            actionButton(ns("video6d"),
#                         label=NULL,
#                         style="width: 350px;
#                                   height: 200px;
#                                   #padding: 10px; 
#                                   font-size: 200%;
#                                   background: url('vidLectImage.png');
#                                   background-size: cover;
#                                   background-position: center;"
#            )
#   ),
#   br(),
#   br(),
#   ############################################
#   ##  End video and possibly handout section
#   ############################################
    
    
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("6.2.1. Lecture: Model Fit"),
h5("6 min. 9 sec."),
    br(),
    " By looking at how well a model fits the data, we can get an idea of how much variability is explained by our model and how much remains.",
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
             title="6.2.1. Lecture: Model Fit",
             actionButton(ns("video6e"),
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
    
    
    
    
    
    
 #   ################################################
 #   ## Video and possibly handout content
 #   ################################################
 #   ## Video title and a few sentences introducing it
 #   br(),
 #   br(),
 #   h2("Discussion: Simple Linear Regression"),
 #   br(),
 #   "...A few sentences that introduce video (and handout if there is one)...",
 #   br(),
 #   br(),
 #   ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
 #   #a("Handout: Conducting a T-test",target="_blank",href="temp"),  
 #   #br(),   
 #   #"Download all handouts here:",
 #   #a("All Handouts",target="_blank",href="temp"),
 #   #br(),
 #   #br(),
 #   ## Video icon and link
 #   tags$div(style="display:inline-block;width:500px;height:200;",
 #            title="Video Example Simple Linear Regression",
 #            actionButton(ns("video6f"),
 #                         label=NULL,
 #                         style="width: 350px;
 #                                   height: 200px;
 #                                   #padding: 10px; 
 #                                   font-size: 200%;
 #                                   background: url('vidLectImage.png');
 #                                   background-size: cover;
 #                                   background-position: center;"
 #            )
 #   ),
 #   br(),
 #   br(),
 #   ############################################
 #   ##  End video and possibly handout section
 #   ############################################
 #   
 #   
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("6.2.2. Lecture: Multiple Predictors"),
h5("5 min. 43 sec."),
    br(),
    "One of the appealing aspects of more advanced statistical models is how they handle multiple predictors.",
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
             title="6.2.2. Video Lecture: Multiple Predictors",
             actionButton(ns("video6g"),
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
    
    
    
   
   
#  ################################################
#  ## Video and possibly handout content
#  ################################################
#  ## Video title and a few sentences introducing it
#  br(),
#  br(),
#  h2("Discussion: Adding Predictors to Your Model"),
#  br(),
#  "...A few sentences that introduce video (and handout if there is one)...",
#  br(),
#  br(),
#  ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
#   a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf"),  
#   br(),   
#   "Download all handouts here:",
#   a("All Handouts",target="_blank",href="bookAll.pdf"),
#   br(),
#   br(),
#  ## Video icon and link
#  tags$div(style="display:inline-block;width:500px;height:200;",
#           title="Discussion: Adding Predictors to Your Model",
#           actionButton(ns("video6h"),
#                        label=NULL,
#                        style="width: 350px;
#                                   height: 200px;
#                                   #padding: 10px; 
#                                   font-size: 200%;
#                                   background: url('vidLectImage.png');
#                                   background-size: cover;
#                                   background-position: center;"
#           )
#  ),
#  br(),
#  br(),
#  ############################################
#  ##  End video and possibly handout section
#  ############################################
   
   
   
   
   
   ################################################
   ## Video and possibly handout content
   ################################################
   ## Video title and a few sentences introducing it
   br(),
   br(),
   h2("6.2.3. Case Study: Meeting with an Investigator"),
h5("video 9 min. 18 sec. Entire case study: approximately 20 min."),
   br(),
   "Our final case study involves making preparations for a meeting with an investigator.",
   br(),
   br(),
   ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
   #a("Case Study: Statistical Modelling",target="_blank",href="case6i.pdf"),  
  # br(),   
  # "Download all handouts here:",
  # a("All Handouts",target="_blank",href="bookAll.pdf"),
   #br(),
   #br(),
   ## Video icon and link
   tags$div(style="display:inline-block;width:500px;height:200;",
            title="6.2.3. Case Study: Meeting with an Investigator",
            actionButton(ns("video6i"),
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
   ############################################
   ##  End video and possibly handout section
   ############################################
   
   
   
   
    
    
    
    
    
    
    
  )
  
}



modelServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      
      
      observeEvent(input$video60,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 6: Modelling"),
            tags$iframe(
              width="1280",
              height="720",
              src = "mod6Intro.mp4",
              #src = "video6a.pdf",
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
                   actionButton(("video60_5h"), label = "< Previous Video") ,actionButton(("video60_6a"), label = "Next Video >") 
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
      
      
      
      
      observeEvent(input$video6a,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("6.1.1. Lecture: Variable Relationships"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video6a.mp4",
              #src = "video6a.pdf",
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
                   actionButton(("video6a_60"), label = "< Previous Video") ,actionButton(("video6a_6c"), label = "Next Video >") 
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
      
      
      
      
      observeEvent(input$video6c,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("6.1.2. Lecture: Hypothesis Testing and Modelling"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video6c.mp4",
              #src = "video6c.pdf",
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
                   actionButton(("video6c_6a"), label = "< Previous Video") ,actionButton(("video6c_6c1"), label = "Next Video >") 
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
      
      
      observeEvent(input$video6c1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("6.1.3 Exercise: Hypothesis Tests as Models"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video6d.mp4",
              src = "video6c1.png",
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
                   actionButton(("video6c1_6c"), label = "< Previous Video") ,actionButton(("video6c1_6e"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf", align="center"),
                   br(),
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      observeEvent(input$video6e,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("6.2.1. Lecture: Model Fit"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video6e.mp4",
              #src = "video6e.pdf",
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
                   actionButton(("video6e_6c1"), label = "< Previous Video") ,actionButton(("video6e_6g"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      observeEvent(input$video6g,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("6.2.2. Lecture: Multiple Predictors"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video6g.mp4",
              #src = "video6g.pdf",
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
                   actionButton(("video6g_6e"), label = "< Previous Video") ,actionButton(("video6g_6i"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      
      observeEvent(input$video6i,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("6.2.3. Case Study: Meeting with an Investigator"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video6i.mp4",
              #src = "video6i.pdf",
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
                   actionButton(("video6i_6g"), label = "< Previous Video") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                  # tags$a("Case Study: Modelling",target="_blank",href="case6i.pdf", align="center"),
                   br(),
                  # tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      
    }
  )}


