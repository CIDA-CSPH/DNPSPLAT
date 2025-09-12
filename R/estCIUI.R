


# Module UI function
estCIUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  
  mainPanel(
    
    
    
    
   # column(width=12,
           
           tags$div(style="display:inline-block;height:45;",
                    title="Module and Section",
                    h1("Module 4: Estimation and Confidence Intervals",
                       style="height: 45px; padding: 10px;"
                    )
           ),
           
        #   column(width=6,
                  #########################################
                  ##  Beginning of Page Title and buttons
                  #########################################
                  
                  
                  br(),
                  br(),
                  "Having learned about statistics in the research process, study design, and the sample in modules 1 through 3, we now turn our focus toward making inference about the population based on our sample using the tools of probability and statistical inference. In module 4, we learn about the first steps of that process: estimation and confidence intervals.",
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
        #   ),
    
   # column(width=5,
           br(),
        #   tags$div(style="display:inline-block;width:500px;height:200;",
        #            title="Flowchart",
        #            img(src='statsResProc3.png', width=450, height=350)),
           
           
           
          # tags$div(style="display:inline-block;width:500px;height:200;",
          #          title="Flowchart",
          #          actionButton(ns("videoXX"),
          #                       label=NULL,
          #                       style="width: 450px;
          #                      height: 350px;
          #                      #padding: 10px; 
          #                      font-size: 200%;
          #                      background: url('statsResProc3.png');
          #                      background-size: cover;
          #                      background-position: center;"
          #          )
          # ),
           

    
    
    
  #  
  #  #########################################
  #  ##  Beginning of Page Title and buttons
  #  #########################################
  #  br(),
  #  tags$div(style="display:inline-block;height:45;",
  #           title="Module and Section",
  #           h1("Module 4: Estimation and Confidence Intervals",
  #              style="height: 45px; padding: 10px;"
  #           )
  #  ),
  # 
  #  br(),
  #  br(),
  #  "Having learned about statistics in the research process, study design, and the sample in modules 1 through 3, we now turn our focus toward making inference about the population based on our sample using the tools of probability and statistical inference. In module 4, we learn about the first steps of that process: estimation and confidence intervals.",
  #  br(),
  #  "If you haven't yet, click the link below to download the course workbook. Then click the first video to start the module.",
  #  tags$a(href="240630 Statistical Literacy Workbook.docx",download="240630 Statistical Literacy Workbook.docx",
  #         "Booklet of All Course Materials",target="_blank"),
  #  br(),
  #  br(),
  #  ############################################
  #  ##  End beginning of page buttons
  #  ############################################
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("Start Module 4"),
    #br(),
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
             title="Start Module 4",
             actionButton(ns("video40"),
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
    h2("4.1.1. Lecture: Probability and Random Variables: Means and the Normal Distribution"),
  h5("7 min. 11 sec."),
    br(),
    "This lecture explores the basic ideas of probability and the specifics of means and the normal distribution.",
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
             title="4.1.1. Lecture: Probability and Random Variables: Means and the Normal Distribution",
             actionButton(ns("video4a"),
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
h2("4.1.2. Exercise: Means, Normality, and the Central Limit Theorem"),
h5("Approximately 20 minutes."),
br(),
"This exercise has no video associated with it. You may find it in section 4.1.2. of your course workbook.",
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
         title="4.1.2. Exercise: Means, Normality, and the Central Limit Theorem",
         actionButton(ns("video4a1"),
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


    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("4.1.3. Lecture: Proportions and the Binomial Distribution"),
h5("6 min. 52 sec."),
    br(),
    "Having already discussed means and the normal distribution, we now discuss another important distribution and it's parameter: the binomial distribution and proportions.",
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
             title="4.1.3. Video Lecture: Proportions and the Binomial Distribution",
             actionButton(ns("video4b"),
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
h2("4.1.4. Exercise: Estimation"),
h5("Approximately 15 minutes."),
br(),
"In this exercise, we put our newfound knowledge of estimation, the normal distribution, and the binomial distribution to use and explaore some specific statistical situations.",
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
         title="4.1.4. Exercise: Estimation",
         actionButton(ns("video4b1"),
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
    
    
    
    
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("4.2.1. Lecture: Confidence Intervals"),
h5("6 min. 21 sec."),
    br(),
    "Now that we've explored estimation, we should talk about quantifying the uncertainty in those estimates, as quantified by confidence intervals.",
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
             title="4.2.1. Lecture: Confidence Intervals",
             actionButton(ns("video4c"),
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
    h2("4.2.2. Case Study: Estimation & Confidence Intervals"),
h5("Video: 11 min. 40 sec.  Entire case study: 20 minutes."),
    br(),
    "In this case study, our statistician navigates the intricacies of dealing with point estimates and confidence intervals in the real world.",
    br(),
    br(),
      ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
      #a("Case Study: Estimation & Confidence Intervals",target="_blank",href="190917 Case 3 - County Phone Call.docx.pdf"),  
      #br(),   
      #"Download all handouts here:",
      #a("All Handouts",target="_blank",href="bookAll"),
      #br(),
      #br(),
    ## Video icon and link
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="4.2.2. Video Case Study: Confidence Intervals",
             actionButton(ns("video4d"),
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
    
    
    
    
    
    
    
    #############################################
    ##  End of page section
    #############################################
    br(),
    br(),
    h2("What's Next?"),
    br(),
    "Estimation and confidence intervals are the first steps in statistical inference. In our next module, we'll explore hypothesis testing, and will discuss the merits and the drawbacks of the ubiquitous p-value.",
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





estCIServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      
      
      
      
      
      observeEvent(input$video40,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 4: Estimation and Confidence Intervals"),
            tags$iframe(
              width="1280",
              height="720",
              src = "mod4Intro.mp4",
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
                   actionButton(("video40_3f"), label = "< Previous Video") ,actionButton(("video40_4a"), label = "Next Video >") 
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
      
      
      
      
      
      
      observeEvent(input$video4a,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("4.1.1. Lecture: Probability and Random Variables: Means and the Normal Distribution"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video4a.mp4",
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
                   actionButton(("video4a_40"), label = "< Previous Video") ,actionButton(("video4a1"), label = "Next Video >") 
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
      
      
      
      observeEvent(input$video4a1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("4.1.2. Exercise: Means, Normality, and the Central Limit Theorem"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video4a1.png",
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
                   actionButton(("video4a1_4a"), label = "< Previous Video") ,actionButton(("video4a1_4b"), label = "Next Video >") 
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
      
      
      
      
      observeEvent(input$video4b,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("4.1.3. Lecture: Proportions and the Binomial Distribution"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video4c.mp4",
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
                   actionButton(("video4b_4a1"), label = "< Previous Video") ,actionButton(("video4b_4b1"), label = "Next Video >") 
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
      
      
      
      observeEvent(input$video4b1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("4.1.4. Exercise: Estimation"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video4b1.png",
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
                   actionButton(("video4b1_4b"), label = "< Previous Video") ,actionButton(("video4b1_4c"), label = "Next Video >") 
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
      
      
      
      
      observeEvent(input$video4c,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("4.2.1. Lecture: Confidence Intervals"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video4e.mp4",
              #src = "video4e.pdf",
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
                   actionButton(("video4c_4b1"), label = "< Previous Video") ,actionButton(("video4c_4d"), label = "Next Video >") 
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
      
      
      
      
      
      observeEvent(input$video4d,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("4.2.2. Case Study: Estimation and Confidence Intervals"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video4d.mp4",
              #src = "video4g.pdf",
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
                   actionButton(("video4d_4c"), label = "< Previous Video") ,actionButton(("video4d_50"), label = "Next Video >") 
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