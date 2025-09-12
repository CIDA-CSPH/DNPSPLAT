


# Module UI function
faqDNPUI <- function(id) {
  
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
             h1("Module 1: Frequently Asked Questions",
                style="height: 45px; padding: 10px;"
             )
    ),
   
    br(),
    br(),
    br(),
    ############################################
    ##  End beginning of page buttons
    ############################################
    
    
    "At the end of this module, there is an exercise for you to complete. You might want to download it ahead of time and look over it before viewing the videos. You can download the exercise here:",
    br(),
    tags$a("Download Word Document: Module 1 Exercise",target="_blank",download="240628 Data Analysis for DNP Students Exercise.docx",href="240628 Data Analysis for DNP Students Exercise.docx", align="center"),
    br(),
    "The answer key to the exercise is here:",
    br(),
    tags$a("Download Word Document: Module 1 Exercise Answer Key",target="_blank",download="Data Analysis for DNP Projects Exercise Answers.docx",href="Data Analysis for DNP Projects Exercise Answers.docx", align="center"),
    br(),
    
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("FAQ: How do I determine what analyses I should do for each of my measures?"),
    br(),
    "This video goes through a table that will be useful in determining your statistical analysis plan, and in meeting with a statistician.",
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
             title="T-Tests",
             actionButton(ns("videoDNP10"),
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
    h2("FAQ: How do I conduct a t-test, and what's the difference between paired and unpaired t-tests?"),
    br(),
    "This video explores the basic ideas of t-tests and gives examples using the analysis tools of this site.",
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
             title="T-Tests",
             actionButton(ns("videoDNP1a"),
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
    h2("FAQ: How and when do I conduct a chi-square test, a Fisher's exact test, and/or a McNemar's test? What's the difference?"),
    br(),
    "There are several options when it comes to contingency table tests, which we explore here.",
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
             title="Contingency Table Tests",
             actionButton(ns("videoDNP1b"),
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
    h2("FAQ: What analysis can I do if I don't have baseline data or a comparator group?"),
    br(),
    "Confidence intervals can be useful tools when you lack baseline data or a comparator group.",
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
             title="Confidence Intervals",
             actionButton(ns("videoDNP1c"),
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
 #   h2("Module 1 Exercise"),
 #   br(),
 #   "Having viewed all of the videos for this module, you should be ready to complete the module's exercise. You can download it here if you haven't already. Then, start the video for an introduction to the exercise before completing it.",
 #   br(),
#
 #   ####  ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
 #   tags$a("Download Word Document: Module 1 Exercise",target="_blank",download="240628 Data Analysis for DNP Students Exercise.docx",href="240628 Data Analysis for DNP Students Exercise.docx", align="center"),
 #   br(),
 #   br(),
 #   
 #   ####  a("Handout Link",target="_blank",href=""),  
 #   ####  br(),   
 #   ####  "Download all handouts here:",
 #   ####  a("All Handouts",target="_blank",href="temp"),
 #   ####  br(),
 #   ####  br(),
 #   ## Video icon and link
 #   tags$div(style="display:inline-block;width:500px;height:200;",
 #            title="Module 1 Exercise",
 #            actionButton(ns("videoDNP1e"),
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
    

br(),
br(),
h2("Module 1 Exercise"),
br(),

"Now that you've watched the module videos, download and complete the module exercise here:",
br(),
tags$a("Download Word Document: Module 1 Exercise",target="_blank",download="240628 Data Analysis for DNP Students Exercise.docx",href="240628 Data Analysis for DNP Students Exercise.docx", align="center"),
br(),
"The answer key to the exercise is here:",
br(),
tags$a("Download Word Document: Module 1 Exercise Answer Key",target="_blank",download="Data Analysis for DNP Projects Exercise Answers.docx",href="Data Analysis for DNP Projects Exercise Answers.docx", align="center"),
br(),
br(),
    br(),
br(),
br(),
    br()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  )
  
}





faqDNPServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      
      
      
      observeEvent(input$videoDNP10,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Analysis Planning"),
            tags$iframe(
              width="1280",
              height="720",
              src = "videoDNP10.mp4",
              #src = "video4a.pdf",
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
                   #actionButton(("video40_3f"), label = "< Previous Video") ,actionButton(("video40_4a"), label = "Next Video >") 
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
      
      
      
      
      
      observeEvent(input$videoDNP1a,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("T-Tests"),
            tags$iframe(
              width="1280",
              height="720",
              src = "videoDNP1a.mp4",
              #src = "video4a.pdf",
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
                   #actionButton(("video40_3f"), label = "< Previous Video") ,actionButton(("video40_4a"), label = "Next Video >") 
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
      
      
      
      
      
      
      observeEvent(input$videoDNP1b,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Chi-Square Tests, Fisher's Exact Tests, and McNemar's Test"),
            tags$iframe(
              width="1280",
              height="720",
              src = "videoDNP1b.mp4",
              #src = "video4a.pdf",
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
                   #actionButton(("video4a_40"), label = "< Previous Video") ,actionButton(("video4a_clt"), label = "Next Video >") 
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
      
      
      observeEvent(input$videoDNP1c,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            #style = "background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Confidence Intervals"),
            tags$iframe(
              width="1280",
              height="720",
              src = "videoDNP1c.mp4",
             # src = "vidLectImage.png",
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
             
            ),
            
            #                              #br()
            br(),
            br(),
            column(width = 4,
                   br(),
                   br(),
                #   actionButton(("videoclt_4a"), label = "< Previous Video") ,actionButton(("videoclt_4b"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br()#,
                   #tags$a("Handout: Best Data Practices",target="_blank",href="dataPract.pdf", align="center"),
                   #br(),
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            )
          )
        ))
      })
      
      
      
      observeEvent(input$videoDNP1d,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Confidence Intervals"),
            tags$iframe(
              width="1280",
              height="720",
              src = "videoDNP1d.mp4",
              #src = "video4c.pdf",
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
                   #actionButton(("video4b_clt"), label = "< Previous Video") ,actionButton(("video4b_4c"), label = "Next Video >") 
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
      
      
      
      observeEvent(input$videoDNP1e,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 1 Exercise"),
            tags$iframe(
              width="1280",
              height="720",
              src = "videoDNP1e.mp4",
              #src = "video4c.pdf",
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
                   #actionButton(("video4b_clt"), label = "< Previous Video") ,actionButton(("video4b_4c"), label = "Next Video >") 
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
      
      
      
      
      
      
    }
  )}