


# Module UI function
hypTest1UI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  
  mainPanel(
    
    
    
    
    
  #  column(width=12,
           
           tags$div(style="display:inline-block;height:45;",
                    title="Module and Section",
                    h1("Module 5: Hypothesis Testing",
                       style="height: 45px; padding: 10px;"
                    )
           ),
        #   
         #  column(width=6,
                  #########################################
                  ##  Beginning of Page Title and buttons
                  #########################################
                  
                  
                  br(),
                  br(),
                  "Now that we've covered the first part of statistical inference, estimation and confidence intervals, we turn to hypothesis testing and the ubiquitous p-value. If you haven't yet, click the link below to download the course workbook. Then click the first video to start the module.",
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
          # ),
           
          # column(width=5,
                  br(),
                #  tags$div(style="display:inline-block;width:500px;height:200;",
                #           title="Flowchart",
                #           img(src='statsResProc4.png', width=450, height=350)),
                  
                  
                  

    
    
    
    
    
    
    
    ################################################
    ## Video and possibly handout content
    ################################################
    ## Video title and a few sentences introducing it
    br(),
    br(),
    h2("Start Module 5"),

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
             title="Lecture: Introduction to Hypothesis Testing",
             actionButton(ns("video50"),
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
    h2("5.1.1. Lecture: Introduction to Hypothesis Testing"),
    h5("3 min. 44 sec."),
    br(),
    "We introduce the basic concepts of hypothesis testing here.",
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
             title="5.1.1. Lecture: Introduction to Hypothesis Testing",
             actionButton(ns("video5a"),
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
    h2("5.1.2. Lecture: More on Hypothesis Testing"),
    h5("5 min. 48 sec."),
    br(),
    "Having introduced hypothesis testing, we elaborate and go into more detail now.",
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
             title="5.1.2. Lecture: More on Hypothesis Testing",
             actionButton(ns("video5c"),
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
 h2("5.1.3. Exercise: Conduct a Hypothesis Test"),
 h5("Approximately 30 minutes."),
 br(),
 "Find the exercise in Chapter 5 in the course workbook with the above title and complete it using the tools under the 'Analysis Tools' tab. There is no video for this section.",
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
          title="5.1.3. Exercise: Conduct a Hypothesis Test",
          actionButton(ns("video5c1"),
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
    h2("5.2.1. Lecture: Multiple Testing"),
 h5("9 min. 32 sec."),
    br(),
    "One of the complications involving hypothesis testing occurs when many hypothesis tests are performed.",
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
             title="5.2.1. Lecture: Multiple Testing",
             actionButton(ns("video5f"),
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
h2("5.2.2. Exercise: The Use and Misuse of P-Values"),
h5("Approximately 20 minutes"),
br(),
"This exercise has no video. You can find it in section 5.2.2. of your workbook.",
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
         title="5.2.2. Exercise: The Use and Misuse of P-Values",
         actionButton(ns("video5f1"),
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
   h2("5.2.3. Case Study: Lack of Significance"),
h5("Video: 7 min. 37 sec. Entire case study: 20 minutes."),
   br(),
   " Now that you've learned about hypothesis testing and performed one yourself, let's talk about what can happen when results aren't significant.",
   br(),
   br(),
   ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
   #a("Case Study: Non-significant Results",target="_blank",href="191001 Case 6 - Insignificant results.docx.pdf"),  
   #br(),   
  # "Download all handouts here:",
  # a("All Handouts",target="_blank",href="bookAll.pdf"),
  # br(),
  # br(),
   ## Video icon and link
   tags$div(style="display:inline-block;width:500px;height:200;",
            title="5.2.3. Case Study: Lack of Significance",
            actionButton(ns("video5h"),
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
    "While simple hypothesis tests are ubiquitous in science, statistical modling, the topic of our next module, lets us do a whole lot more.",
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



hypTest1Server <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      observeEvent(input$video50,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 5: Hypothesis Testing"),
            tags$iframe(
              width="1280",
              height="720",
              src = "mod5Intro.mp4",
              #src = "video5a.pdf",
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
                   actionButton(("video50_4d"), label = "< Previous Video") ,actionButton(("video50_5a"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br()#,
                   #tags$a("Case Study: Estimates and Confidence Intervals",target="_blank",href="case4g.pdf", align="center"),
                   #br(),
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      
      
      observeEvent(input$video5a,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("5.1.1. Lecture: Introduction to Hypothesis Testing"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video5a.mp4",
              #src = "video5a.pdf",
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
                   actionButton(("video5a_50"), label = "< Previous Video") ,actionButton(("video5a_5c"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br()#,
                   #tags$a("Case Study: Estimates and Confidence Intervals",target="_blank",href="case4g.pdf", align="center"),
                   #br(),
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      
      
      
      
      observeEvent(input$video5c,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("5.1.2. Lecture: More on Hypothesis Testing"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video5c.mp4",
              #src = "video5c.pdf",
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
                   actionButton(("video5c_5a"), label = "< Previous Video") ,actionButton(("video5c_5c1"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Case Study: Estimates and Confidence Intervals",target="_blank",href="case4g.pdf", align="center"),
                   br()#,
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      observeEvent(input$video5c1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("5.1.3. Exercise: Conduct a Hypothesis Test"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video5d.mp4",
              src = "video5c1.png",
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
                   actionButton(("video5c1_5c"), label = "< Previous Video") ,actionButton(("video5c1_5f"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: Modelling Table",target="_blank",href="Modelling Handout 2.pdf", align="center"),
                   #br(),
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      
      
      
      observeEvent(input$video5f,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("5.2.1. Lecture: Multiple Testing"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video5f.mp4",
              #src = "video5f.pdf",
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
                   actionButton(("video5f_5c1"), label = "< Previous Video") ,actionButton(("video5f_5f1"), label = "Next Video >") 
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
      
      
      
      observeEvent(input$video5f1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("5.2.2. Exercise: The Use and Misuse of P-Values"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video5f1.png",
              #src = "video5f.pdf",
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
                   actionButton(("video5f1_5f"), label = "< Previous Video") ,actionButton(("video5f1_5h"), label = "Next Video >") 
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
      
      
      
      
      observeEvent(input$video5h,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("5.2.3. Case Study: Lack of Significance"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video5h.mp4",
              #src = "video5h.pdf",
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
                   actionButton(("video5h_5f1"), label = "< Previous Video") ,actionButton(("video5h_60"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Case Study: Lack of Significance",target="_blank",href="191001 Case 6 - Insignificant results.docx", align="center"),
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