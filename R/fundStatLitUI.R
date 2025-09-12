


# Module UI function
fundStatLitUI <- function(id) {
  
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
              h1("Course Overview",
                 style="height: 45px; padding: 10px;"
              )
     ),
    
     br(),
     br(),
     "Welcome to Fundamentals of Statistical Literacy. The video below gives an introduction to this short course, which is offered by
     the Center for Innovative Design and Analysis (CIDA) in the
    Department of Biostatistics and Informatics in the Colorado School of Public 
    Heath at the University of Colorado Anschutz Medical Campus. To view information
    about and sign up for other educational offerings
    at CIDA, click on the link below.",
     br(),
     br(),
     tags$a(href="https://coloradosph.cuanschutz.edu/research-and-practice/centers-programs/cida/learning",
            "Learning at the Center for Innovative Design & Analysis",target="_blank"),
     br(),
     br(),
     ################################################
     ##  End beginning of page section
     ################################################
     
     
     
     
     
     ################################################
     ## Video and possibly handout content
     ################################################
     ## Video title and a few sentences introducing it
     br(),
     br(),
     h2("Video Introduction"),
     h5("6 min. 41 sec."),
     br(),
     ## Video icon and link
     tags$div(style="display:inline-block;width:500px;height:200;",
              title="Video Introduction: Fundamentals of Statistical Literacy",
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
     ############################################
     ##  End video and possibly handout section
     ############################################
     
     
     
     

    br(),
    h2("Course Information"),
    "The information below gives a brief description of this course. For a more complete overview and description, please read the course syllabus in the course workbook, which can be downloaded here:",
    br(),
    tags$a(href="240630 Statistical Literacy Workbook.docx",download="240630 Statistical Literacy Workbook.docx",
           "Booklet of All Course Materials",target="_blank"),
   
    br(),
    br(),
    h3("Instructor"),
   "Bryan McNair, MS",
   br(),
   "Instructor",
   br(),
   "Center for Innovative Design and Analysis",
   br(),
   "Department of Biostatistics and Informatics",
   br(),
   "Colorado School of Public Health",
   br(),
   "University of Colorado Anschutz Medical Campus",
   br(),
   "Bryan.McNair@cuanschutz.edu",
   
   
   
    br(),
    br(),
   h3("Format"),
   "This course is given entirely online. You may complete it at your own speed. It consists of a series of video lectures, each of which lasts 
   approximately 3 to 10 minutes, handouts, exercises, and case studies. You will need to download the course workbook, a word document 
   that contains all of the lecture slides, handouts, exercises, and case studies in a single booklet here:",

   br(),
   tags$a(href="240630 Statistical Literacy Workbook.docx",download="240630 Statistical Literacy Workbook.docx",
          "Booklet of All Course Materials",target="_blank"),
   #tags$a(href='template.docx', target='_blank', 'Can only download from www folder', download = 'template.docx')
   
  
   br(),
   br(),
   
   h3("Analysis Tools Tab"),
   "This is one of the primary features of this course, and one that makes it unique. The Analysis Tools tab on the website 
   contains tools to conduct real-world statistical analyses. With the right data, or the example data already there, you can 
   conduct a 2-sample t-test, a paired t-test, a chi-square test, a Fisher’s exact test, a McNemar’s test, and a power/sample 
   size/effect size analysis for a 2-sample t-test. Additional tools also include one that calculates confidence intervals for 
   means and proportions/percentages, and one used to visualize the Central Limit Theorem. In some exercises, you’ll be asked 
   to go to a specific tool under the Analysis Tools tab and do something with it. However, these tools are not meant as a simple 
   replacement for what you get with common statistical analysis software. They’re meant for teaching, so think of them like a 
   textbook where you can work out examples right in the pages, without equations or computer code. You can also go to them for 
   reference, looking up, for instance, the standard null hypothesis for a t-test in the t-test tool. Finally, you can learn by 
   exploring them, changing things about the example data and the options to see what happens to the results. All tools give tabular 
   and/or graphical output. Most give both. Most also include examples of how one would write up the results for dissemination. Note 
   that there will be some things that you will only learn from the tools, though these are special cases or extensions of what you 
   learn in the videos and will be asked for explicitly in an exercise. Many sections of the analyses tools have buttons you can click on 
   to learn more information about that section. For instance, when you go to the 'Hypotheses' section of the '2-Sample T-Test', you can 
   click on buttons that look like those directly below to learn about null and alternative hypotheses as they pertain to t-tests. 
   Then, you can use that part of the tool to set your null hypothesis for your t-test. Look for this set of buttons in the top right 
   corner of each section in the analysis tools tabs:",
   #br(),
   #br(),
   column(12,style = " background-color: white; border-radius: 5px; ",
          
          br(),
          br(),
          column(width=5,
                 #h2("Hypotheses")
          ),
          column(width=3, style = " background-color: white; border-radius: 5px; padding: 10px;",
                 column(width=6,h4(style="color:#818e9f;", "Learn:")),
                 column(width=4,
                        actionButton(ns("snip1_1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                        #actionButton(ns("snip1_2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                        tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                 )),
          br(),
          br(),
          br(),
          br(),
          br()
   ),
   
   
   h3("Office Hours"),
    "The Instructor will be available each week for six weeks for office hours on Zoom. Attending these office hours is optional. For the fall 2024 course, 
   office hours will be Wednesdays at 6 pm from September 4th through October 9th. The Zoom link is",
   br(),
   br(),
   tags$a(href="https://ucdenver.zoom.us/j/97552552409",
          "Short Course Office Hours on Zoom",target="_blank"),
   br(),
   br(),

   
   h3("Grades"),
   "There will be no grades for this course. However, you can earn a certificate of 
   completion. To earn the certificate, you must complete the course workbook and turn 
   it in to your instructor, who will give you a due date when the course starts. The workbook will only be assessed for completion, not graded. Note 
   that completion of the workbook includes completion of exercises and case studies. 
   It also includes lecture notes for the video lectures. You should include lecture 
   notes on the pages with images of the lecture slides. One note, question, or thought 
   is required per page of slide images unless otherwise noted. Each of those pages of 
   the workbook give these instructions again for reference.",
   br(),
   br(),
   
   h3("Suggested Text"),
   "The suggested text is ", 
   tags$u("Intuitive Biostatistics: A nonmathematical guide 
   to statistical thinking"),
   "by Harvey Motulsky. However, as there are no tests, quizzes, or grades, it's 
   possible to take the class without reading or even purchasing the text.",
   br(),
   br(),
   
   
   br(),
   br(),
   h2("What's Next?"),
   br(),
   "Now that you've read a bit about the course, click on 'Learning Modules > 1. Introduction' in the tabs at the top. We'll go over the syllabus in detail before starting into our content about statistics in the research process and the cycle of statistical inference.",
   br(),
   br(),
   br()#,
   #actionButton("toIntro2", label = "Back to Intro"), actionButton("toNextI2", label = "Go to Next Module"),
   #br(),
   #br(),
   #br()




    #br()
    
  )
  
}




fundStatLitServer <- function(id) {
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
      
      
      
      
      
      observeEvent(
        input$snip1_1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Overview of T-Tests"), ##### Change this one every time and text below
                               "A t-test is a hypothesis test that compares means between two groups/entities (2-sample/unpaired/independent t-test) or between two time points/replicates measured 
       on the same subject/experimental unit (paired/dependent t-test).  Remember that a sample mean summarizes or describes the central tendency of NUMERIC 
      observations in a sample. Also remember that a population mean is a measure of central tendancy for a NUMERIC random variable in the population 
      that parameterizes many distributions, such as the normal distribution. Finally, remember that the sample mean is a good estimator (good accuracy 
                                                                                                                                          and precision) of the population mean.  Given all of this, the fact that a t-test compares means tells us that the outcome is NUMERIC. 
      Because a t-test compares TWO means, we know that the predictor is categorical with two categories, or binary. There is a one-sample t-test, 
      though we don't cover it here, as it's rarely used in practice. See the Model Assumptions section for a note on equal variances/standard deviation t-tests and 
      unequal variances/standard deviations t-tests.", 
      br(),
      br(),
      "Based on this information, can you characterize a t-test as a hypothesis test by stating the null hypothesis? See the content below for the 
      answer.",
      br(),
      br(),
      "Based on this information, can you characterize a t-test as a model by listing the predictor(s) with data scale(s) and outcome with (assumed) 
      distribution? The answers are given in the first paragraph above.",
      br(), br() ) ) )) })
      observeEvent(
        input$snip1_2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Ovierview of a T-Test"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip1_2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
       
       observeEvent(input$video1a,{
          showModal(modalDialog(
             
             tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Course Overview"),
                tags$iframe(
                   width="1280",
                   height="720",
                   src = "video1a.mp4",
                   #src = "video1a.pdf",
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
                       actionButton(("video1a_10"), label = "Start Module 1 >") 
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
       
       
        
      })
    }
    
    
    