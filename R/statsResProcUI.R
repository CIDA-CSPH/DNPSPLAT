

# Module UI function
statsResProcUI <- function(id) {
  
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  mainPanel(
    
    
   # column(width=12,
           
           tags$div(style="display:inline-block;height:45;",
                    title="Module and Section",
                    h1("Module 1: Introduction",
                       style="height: 45px; padding: 10px;"
                    )
           ),
           
          # column(width=6,
                  #########################################
                  ##  Beginning of Page Title and buttons
                  #########################################
                  

                  br(),
                  br(),
                  
                  "If you're taking this course, you probably have some research experience, or will soon. 
    You'll probably interact with statisticians at several points in the research process. 
    What are those points of interaction, or what should they be? In the following videos and exercises, 
    we'll answer these questions and develop a tool that will provide us with the framework for the rest of the course. If you haven't done it yet, download the course workbook here:",
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
       #    ),
    
   # column(width=5,
           br(),
         #  tags$div(style="display:inline-block;width:500px;height:200;",
         #                    title="Flowchart",
         #  img(src='240501 Flow chart image.png', width=450, height=350)),
           #                     height: 350px;),
           
           #tags$div(style="display:inline-block;width:500px;height:200;",
           #         title="Flowchart",
           #         actionButton(ns("videoXX"),
           #                      label=NULL,
           #                      style="width: 450px;
           #                     height: 350px;
           #                     #padding: 10px; 
           #                     font-size: 200%;
           #                     background: url('240501 Flow chart image.png');
           #                     background-size: cover;
           #                     background-position: center;"
           #         )
           #),
           

           
           
   # )
   # ),


   
    h2("Start Module 1"),
    br(),
    
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="Start Module 1",
             actionButton(ns("video10"),
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
   

    
    h2("1.1.1. Video Course Overview"),
   h5("6 min. 41 sec."),
    br(),
    "We introduce the class here, including the course workbook and syllabus. You can download the course workbook here:",
    br(),
    br(),
    tags$a(href="240630 Statistical Literacy Workbook.docx",download="240630 Statistical Literacy Workbook.docx",
           "Booklet of All Course Materials",target="_blank"),
    br(),
    br(),
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="1.1.1. Course Overview",
             actionButton(ns("video1a"),
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

    
    h2("1.1.2. Handout: Course Syllabus"),
   h5("No duration."),
    br(),
    "The course syllabus can be found as a handout in section 1.1.2 of the course workbook.",
    br(),
    br(),
    tags$a(href="240630 Statistical Literacy Workbook.docx",download="240630 Statistical Literacy Workbook.docx",
           "Booklet of All Course Materials",target="_blank"),
    br(),
    br(),
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="1.1.1. Video Introduction",
             actionButton(ns("video1a1"),
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

    
    h2("1.2.1. Exercise: Brainstorming the Research Process (Video is Optional)"),
   h5("Optional video: 23 min. 5 sec. Required workbook exercise: approximately 10 minutes."),
    br(),
    HTML("We'll start with a brainstorming exercise with <b>optional video</b> before diving into the details in subsequent videos. Note that the video is optional, but the exercise in the workbook is required."),
    br(),
    br(),
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="1.2.1. Exercise: Brainstorming the Research Process",
             actionButton(ns("video1b"),
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
    h2("1.2.2. Lecture: Overview of Statistics in the Research Process"),
   h5("7 min. 57 sec."),
    br(),
    "Now that we've completed the exercise above, we'll take a more in-depth look at the flow chart we've created and how it interfaces with the Cycle of Statistical Inference.",
    #br(),
    #br(),
    #a("Handout: Statistics in the Research Process Flowchart",target="_blank",href="210208 Statistics in the Research Process.pptx.pdf"),
   #br(),
   #a("Handout: The Cycle of Statistical Inference",target="_blank",href="Cycle of Statistical Inference.png"),
    br(),
    br(),
    tags$div(style="display:inline-block;width:500px;height:200;",
             title="1.2.2. Video Lecture: Overview of Statistics in the Research Process",
             actionButton(ns("video1c"),
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
   h2("1.2.3. Handout: Statistics in the Research Process Flowchart"),
   h5("No duration."),
   br(),
   "There is no video for this handout. It can be found in section 1.2.3. of your course workbook.",

   br(),
   br(),
   tags$div(style="display:inline-block;width:500px;height:200;",
            title="1.2.2. Video Lecture: Overview of Statistics in the Research Process",
            actionButton(ns("video1c1"),
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
   h2("1.2.4. Handout: The Cycle of Statistical Inference"),
   h5("No duration."),
   br(),
   "There is no video for this handout. It can be found in section 1.2.4. of your course workbook.",
   
   br(),
   br(),
   tags$div(style="display:inline-block;width:500px;height:200;",
            title="1.2.2. Video Lecture: Overview of Statistics in the Research Process",
            actionButton(ns("video1c2"),
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
   h2("1.2.5. Exercise: The Cycle of Statistical Inference"),
   h5("11 min. 22 sec."),
   br(),
   "With our two new tools, the Statistics in the Research Process flowchart and The Cycle of Statistical Inference, we can practice with a discussion and an example.",
   br(),
   br(),
   tags$div(style="display:inline-block;width:500px;height:200;",
            title="Exercise: The Cycle of Statistical Inference",
            actionButton(ns("video1d"),
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
   h2("1.2.6. Case Study: Will Cody in a Tough Spot"),
   h5("Video: 14 min 46 sec. Entire case study: 30 minutes."),
   br(),
   "In our case studies, we follow Will Cody, a consulting and collaborative statistician at Peak State University, as he encounters various situations and difficulties in his daily statistical practice.",
   br(),
   br(),
   tags$div(style="display:inline-block;width:500px;height:200;",
            title="1.2.6. Case Study: Will Cody in a Tough Spot",
            actionButton(ns("video1e"),
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
   
   
   
   
   
   
   
   
   
   
 #   
 #   br(),
 #   br(),
 #   h2("Case Study"),
 #   br(),
 #   "This module includes a case study related to statistics in the research process. Click on the link to open or download the case study document, then watch the video.",
 #   br(),
 #   #a("Case Study: Authorship",target="_blank",href="190910 Case 1 - Authorship.docx.pdf"),
 #   br(),
 #   a("Case Study: The Missing Analysis Plan",target="_blank",href="case1e.pdf"),
 #   br(),
 #   br(),
 #   tags$div(style="display:inline-block;width:500px;height:200;",
 #            title="Case Study: The Missing Analysis Plan",
 #            actionButton(ns("video1e"),
 #                         label=NULL,
 #                         style="width: 350px;
 #                               height: 200px;
 #                               #padding: 10px; 
 #                               font-size: 200%;
 #                               background: url('vidLectImage.png');
 #                               background-size: cover;
 #                               background-position: center;"
 #            )
 #   ),
 #   br(),
 #   br(),
    
    
    br(),
    br(),
    h2("What's Next?"),
    br(),
    "We will use the framework presented in our research process flowchart to organize the rest of the course. Our next stop is the first row of the flow chart: study design, which includes the first two boxes on the flow chart, the statistical analysis plan and power and sample size. To access this content, click on the tab for Module 2 above.",
    br(),
   br(),
    br()#,
    #actionButton("toIntro2", label = "Back to Intro"), actionButton("toNextI2", label = "Go to Next Module"),
    #br(),
    #br(),
    #br()
  
  )
  
}



statsResProcServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
     
      
      observeEvent(input$video10,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Module 1: Statistics in the Research Process"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video1a.mp4",
              src = "mod1Intro.mp4",
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
                   actionButton(("video10_1a"), label = "Next >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Course Syllabus",target="_blank",href="syllabus.pdf", align="center"),
                   #br(),
                   
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
            
          )
          
        ))
        
      })
      
      
      
      observeEvent(input$video1a,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("1.1.1. Video Introduction"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video1a.mp4",
              #src = "video1b.pdf",
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
                   actionButton(("video1a_10"), label = "< Previous"), actionButton(("video1a_1a1"), label = "Next >") 
            ), #end column
            column(width = 4,
                   #br(),
                   #br(),
                   #tags$a("Handout: The Cycle of Statistical Inference",target="_blank",href="Cycle of Statistical Inference.png", align="center"),
                   br()
                   
                   #tags$a("Handout: Statistics in the Research Process Flowchart",target="_blank",href="210208 Statistics in the Research Process.pptx.pdf", align="center")
            ),
            br(),
            br(),
            
          )
          
        ))
        
      })
      
      
      
      observeEvent(input$video1a1,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("1.1.2. Handout: Course Syllabus"),
            tags$iframe(
              width="1280",
              height="720",
              #src = "video1a1.mp4",
              src = "video1a1.png",
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
                   actionButton(("video1a1_1a"), label = "< Previous"), actionButton(("video1a1_1b"), label = "Next >") 
            ), #end column
            column(width = 4,
                   #br(),
                   #br(),
                   #tags$a("Handout: The Cycle of Statistical Inference",target="_blank",href="Cycle of Statistical Inference.png", align="center"),
                   br()
                   
                   #tags$a("Handout: Statistics in the Research Process Flowchart",target="_blank",href="210208 Statistics in the Research Process.pptx.pdf", align="center")
            ),
            br(),
            br(),
            
          )
          
        ))
        
      })
      
      
      
      observeEvent(input$video1b,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("1.2.1. Exercise: Brainstorming the Research Process"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video1b.mp4",
              #src = "video1b.pdf",
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
                   actionButton(("video1b_10"), label = "< Previous"), actionButton(("video1b_1c"), label = "Next >") 
            ), #end column
            column(width = 4,
                   #br(),
                   #br(),
                   #tags$a("Handout: The Cycle of Statistical Inference",target="_blank",href="Cycle of Statistical Inference.png", align="center"),
                   br()
                   
                   #tags$a("Handout: Statistics in the Research Process Flowchart",target="_blank",href="210208 Statistics in the Research Process.pptx.pdf", align="center")
            ),
            br(),
            br(),
            
          )
          
        ))
        
      })
      
      
      
      observeEvent(input$video1c,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("1.2.2. Lecture: Overview of Statistics in the Research Process"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video1c.mp4",
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
                   actionButton(("video1c_1b"), label = "< Previous"), actionButton(("video1c_1c1"), label = "Next >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Cycle of Statistical Inference",target="_blank",href="Cycle of Statistical Inference.png", align="center"),
                   #br(),
                   
                   #tags$a("Handout: Statistics in the Research Process Flowchart",target="_blank",href="210208 Statistics in the Research Process.pptx.pdf", align="center")
            ),
            br(),
            br(),
            
          )
          
        ))
        
      })
      
      
      observeEvent(input$video1c1,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("1.2.3. Handout: Statistics in the Research Process Flowchart"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video1c1.png",
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
                   actionButton(("video1c1_1c"), label = "< Previous"), actionButton(("video1c1_1c2"), label = "Next >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Cycle of Statistical Inference",target="_blank",href="Cycle of Statistical Inference.png", align="center"),
                   #br(),
                   
                   #tags$a("Handout: Statistics in the Research Process Flowchart",target="_blank",href="210208 Statistics in the Research Process.pptx.pdf", align="center")
            ),
            br(),
            br(),
            
          )
          
        ))
        
      })
      
      
      
      observeEvent(input$video1c2,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("1.2.4. Handout: The Cycle of Statistical Inference"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video1c2.png",
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
                   actionButton(("video1c2_1c1"), label = "< Previous"), actionButton(("video1c2_1d"), label = "Next >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Cycle of Statistical Inference",target="_blank",href="Cycle of Statistical Inference.png", align="center"),
                   #br(),
                   
                   #tags$a("Handout: Statistics in the Research Process Flowchart",target="_blank",href="210208 Statistics in the Research Process.pptx.pdf", align="center")
            ),
            br(),
            br(),
            
          )
          
        ))
        
      })
      
      
      
      observeEvent(input$video1d,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("1.2.5. Exercise: The Cycle of Statistical Inference"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video1d.mp4",
              #src = "video1d.pdf",
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
                   actionButton(("video1d_1c2"), label = "< Previous"), actionButton(("video1d_1e"), label = "Next >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: The Cycle of Statistical Inference",target="_blank",href="Cycle of Statistical Inference.png", align="center"),
                   br()#,
                   
                   #tags$a("Handout: Statistics in the Research Process Flowchart",target="_blank",href="210208 Statistics in the Research Process.pptx.pdf", align="center")
            ),
            br(),
            br(),
            
          )
          
        ))
        
      })
      
      
      
      
      observeEvent(input$video1e,{
        showModal(modalDialog(
          
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("1.2.6. Case Study: Will Cody in a Tough Spot"),
            tags$iframe(
              width="1280",
              height="720",
              src = "video1e.mp4",
              #src = "video1d.pdf",
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
                   actionButton(("video1e_1d"), label = "< Previous"), actionButton(("video1e_20"), label = "Next >") 
            ), #end column
            column(width = 4,
                   br(),
                   br(),
                   #tags$a("Handout: Case Study: The Missing Analysis Plan",target="_blank",href="case1e.pdf", align="center"),
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