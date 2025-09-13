

#install.packages('rsconnect')


#library(rsconnect)
#rsconnect::setAccountInfo(name='mystatshome', token='EC51FC113D40E2513D5F5CE52138102F', secret='4lkiKpbGxwOTOgt6gEEOMght6xGP0RXk3zVMptiW')
#rsconnect::deployApp('path/to/your/app')
#rsconnect::deployApp('C:/Users/brygu/OneDrive - The University of Colorado Denver/Fundamentals of Statistical Literacy Short Course')
#rsconnect::deployApp(appName = "DNPSPLAT", appDir = 'C:/Users/mcnairb/OneDrive - The University of Colorado Denver/Zach and Bryan/2 CRNS/DNP SPLAT/')


#################################
##    Load libraries
#################################
#library(rsconnect)
library(shiny)
library(V8)
library(shinyjs)
library(bcrypt)
library(shinyMatrix)
library(boot)
library(ggplot2)
library(tibble)
library(GenBinomApps)
library(scales)
library(tableone)
library(table1)
#library(htmlOutput)
library(openxlsx)
library(shiny)
library(shinyWidgets)
library(readxl)
library(shinyBS)
library(shinymanager)
library(rvest)
library(DT)
library(dplyr)
library(anytime)
library(DescTools)

#inactivity <- "function idleTimer() {
#var t = setTimeout(logout, 120000);
#window.onmousemove = resetTimer; // catches mouse movements
#window.onmousedown = resetTimer; // catches mouse movements
#window.onclick = resetTimer;     // catches mouse clicks
#window.onscroll = resetTimer;    // catches scrolling
#window.onkeypress = resetTimer;  //catches keyboard actions
#
#function logout() {
#window.close();  //close the window
#}
#
#function resetTimer() {
#clearTimeout(t);
#t = setTimeout(logout, 120000);  // time is in milliseconds (1000 is 1 second)
#}
#}
#idleTimer();"


# data.frame with credentials info
credentials <- data.frame(
  user = c("MalRen", "DNPAMC"),
  password = c("Everything'sShinyCaptain!", "WeLuvStats4Life!"),
  # comment = c("", ""), %>% 
  stringsAsFactors = FALSE
)



jscode <- "shinyjs.refresh = function() { history.go(0); }"



#########################################################
#########################################################
###   This starts the actual page content
#########################################################
#########################################################





ui<-fluidPage(
         
  
  
  # authentication removed for testing
  # auth_ui removed - direct access to app content
  
  
  
  # Include CSS for table1 default formatting
  includeCSS(system.file(package="table1", "table1_defaults_1.0/table1_defaults.css")),
  
  # Further customization can be done here
  tags$style(type="text/css", "
    .Rtable1 tr th {
      color: black;
    }
    .Rtable1 tr td {
      color: black;
    }
  "),
  
  
  ##############################################################
  ###   The following section defines all of the style
  ###   elements that will be used throughout the rest
  ###   of the page
  #############################################################
  
  tags$style(
    type = 'text/css',
    '.modal-dialog { width: fit-content !important; }'
  ),
  
  
  tags$style(HTML("
    .tabbable > .nav > li > a                  {background-color: #5f5f62;  color:white}
    .tabbable > .nav > li[class=active] > a[data-value='Home'] {background-color:                                             #818e9f;   color:white}
        .tabbable > .nav > li[class=active] > a[data-value='Plan'] {background-color:                                             #818e9f;   color:white}
    .tabbable > .nav > li[class=active] > a[data-value='Learn'] {background-color:                                  #818e9f;   color:white}
    .tabbable > .nav > li[class=active] > a[data-value='Analysis Tools'] {background-color:      #818e9f;   color:white}
    .tabbable > .nav > li[class=active] > a[data-value='II. The Sample'] {background-color:   #818e9f;   color:white}
    .tabbable > .nav > li[class=active] > a[data-value='III. Inferential Statistics'] {background-color:                       #818e9f;   color:white}
    .tabbable > .nav > li[class=active] > a[data-value='Conclusions and Additional Topics'] {background-color:                               #818e9f;   color:white}
    .tabbable > .nav > li[class=active] > a[data-value='VI. Topics Not Covered Here'] {background-color:                      #818e9f;   color:white}
    .tabbable > .nav > li[class=active] > a[data-value='VII. Other Resources'] {background-color:                             #818e9f;   color:white}
    .tabbable > .nav > li[class=active] > a[data-value='VIII. About/Contact'] {background-color:                              #818e9f;   color:white}
    .tabbable > .nav > li[class=active] > a[data-value='VII. About/Contact'] {background-color:                               #818e9f;   color:white}
    
    .tabbable > .nav > li[class=active] > a[data-value='Course Overview'] {background-color:                                      #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='Contents'] {background-color:                                #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='Statistics in the Research Process'] {background-color:                           #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='Overview & Contents'] {background-color:                        #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='1. Introduction'] {background-color:        #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='2. Study Design'] {background-color:           #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='3. The Sample'] {background-color:                      #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='4. Estimation & CIs'] {background-color:             #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='5. Hypothesis Testing'] {background-color:  #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='6. Modelling'] {background-color:                    #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='A. Estimation and Confidence Intervals'] {background-color:                                #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='Additional Topics'] {background-color:                      #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='B. Hypothesis Testing'] {background-color:                        #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='C. Modelling'] {background-color:                                 #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='Conclusions and Review'] {background-color:                                 #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='A. Linear Models'] {background-color:                             #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='B. Covariate Adjustment'] {background-color:                      #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='C. Non-Normal Outcomes'] {background-color:                       #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='D. Repeated Measures & Correlated Data'] {background-color:       #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='E. Missing Data'] {background-color:                              #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='F. Survival Analysis'] {background-color:                         #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='G. Not Covered Here'] {background-color:                          #98a8ba;   color:black}
    .tabbable > .nav > li[class=active] > a[data-value='Module 1. FAQs'] {background-color:                          #98a8ba;   color:black}



    #.tabbable > .nav > li > a[data-value='IV. Inferential Statistics'] {background-color: #5f5f62;  color:white}
    #.tabbable > .nav > li[class=active] > a[data-value='IV. Inferential Statistics'] {background-color: #8a97a9;  color:white}

    #.tabbable > .nav > li > a[data-value='t3'] {background-color: green; color:white}
    .tabbable > .nav > li[class=active]    > a {background-color: #7b8a98; color:white}
    
    .tabbable > .nav > li[class=active] > a[data-value='Enter Data by Cell'] {background-color:#7b8a98; color:white}
    .tabbable > .nav > li[class=active] > a[data-value='Paste Data by Column'] {background-color:#7b8a98; color:white}

  ")),
  
  ##############################################################
  ###   This ends the section that defines all of the style
  ###   elements that will be used throughout the rest
  ###   of the page
  #############################################################
  
  
  
  ###########################################################
  ###   This starts the header section of the page 
  ###    above the navigation tabs
  ###########################################################
  
  # This is a row across the top of the page that includes the CIDA banner and log in fileds/button. This fow is above the page title.
  fluidRow(
    br(),
    ## This is the CIDA banner
    column(width = 4,
           tags$a(style="display:inline-block;width:500px;height:45;",
                  title="Center for Innovative Design and Analysis",
                  style="width: 500px;
                                    height: 45px;
                                    #padding: 10px; 
                                    font-size: 20%;
                                    background: url('CIDA Header.jpg');
                                    background-size: cover;
                                    background-position: right;"
           )
    ), #end column
    
    ## This is a blank section in the middle between the CIDA banner and the log in fields and above the page title
    column(width = 3,
    ), #end column
    
    ## These are the sections with the log in fileds/button
    column(width = 2,
          # textInput("user", label=NULL, value="User Name") 
    ), #end column
    column(width = 2,
          # passwordInput("PW", label=NULL,  value="Password") 
    ), #end column
    column(width = 1,
          # actionButton("button", "Log in",
          #              style="position: left;"
          # ) 
    ) #end column
    
  ), # end fluidrow above the page title
  
  br(),
  br(),
  
  ####### This is the page title
  h1("Statistical Planning, Learning, and Analysis Tool: DNP Edition", align="center"),
  ########### end page title
  
  br(),
  br(),
  
  ##############################################################
  ##     This ends the page header above the navigation tabs
  ##############################################################
  

  
  
  #####################################################################################
  ###   The following section creates the navigation tabs at the top of the site
  ###   and calls the content for each page, which is contained in individual
  ###   files with names of the form xxxxxxUI.R. These files are saved in the 
  ###   .../R/ sub-directory. Open the individual xxxxxUI.R file to edit
  ###   the actual content for a given page.
  #####################################################################################
  
  
  ############## start top-level tabs 
  tabsetPanel(type = "tabs",id="topTabs",
          
              
              
              ## Introduction top-level tab
              tabPanel("Home",
                       style = "background-color: #818e9f;",
                       br(),
                       column(width=9, style="background-color: white",
                              homeUI("home")#,  ## This inserts the content for the Course Overview page, which is saved in the fundStatLitUI file in the /R/ sub-directory
                       )
              ), ## End Course Home tab
              
              ## Introduction top-level tab
              tabPanel("Learn",
                       style = "background-color: #818e9f;",
                       br(),
                       tabsetPanel(type = "tabs",id="moduleTabs",
                       
                                   # Start DNP FAQ
                                   tabPanel("Module 1. FAQs",
                                            style = "background-color: #98a8ba;",
                                            br(),
                                            column(width=9, style="background-color: white",
                                                   faqDNPUI("faqDNP")#,  ## This inserts the content for the page, which is saved in the /R/ sub-directory
                                                   #br()
                                            )
                                   ), # End DNP FAQ
                                   # Start Demonstrations
                               #   tabPanel("Demonstrations",
                               #            style = "background-color: #98a8ba;",
                               #            br(),
                               #           tabsetPanel(type = "tabs",id="moduleTabs",
                               #             tabPanel("Normality and the Central Limit Theorem",
                               #                      style = "background-color: #7b8a98;",
                               #                      br(),
                               #                      cltUI("clt"),  ## This inserts the content for the page, which is saved in the /R/ sub-directory
                               #                      #br()
                               #             )#, # End  tab
                               #           )
                               #   ), # End DNP FAQ

                       )
              ), ## End Course Home tab
              tabPanel("Plan",
                       style = "background-color: #818e9f;",
                       br(),
                       column(width=9, style="background-color: white",
                              planDNPUI("planDNP")#,  ## This inserts the content for the Course Overview page, which is saved in the fundStatLitUI file in the /R/ sub-directory
                       )
                       
                       
              ),
              
              
              
            
            ## Start Last top-level tab: Conclusions and Additional Topics
            ## Note: this tab has no tabs nested under it. The content appears when the top-level tab is clicked, without clicking any tabs under it.
            #tabPanel("Conclusions and Additional Topics",
            #         style = "background-color: #818e9f;",
            #         br(),
            #         br(),
            #         adTopicsUI("adTopics")
            #), # End Conclusions and Additional Topics tab
            tabPanel("Analyze",
                     style = "background-color: #818e9f;",
                     br(),
                     # Start set of tabs nested under Analysis Tools
                     tabsetPanel(type = "tabs", id="infTabs",
                                 #tabPanel("Power/Sample Size/Effect Size",
                                 #         style = "background-color: #7b8a98;",
                                 #         br(),
                                 #         powerUI("power"),  ## This inserts the content for the page, which is saved in the /R/ sub-directory
                                 #         br()
                                 #), # End power tab 
                                 tabPanel("Descriptive Statistics",
                                          style = "background-color: #7b8a98;",
                                          br(),
                                          table1UI("table1"),  ## This inserts the content for the page, which is saved in the /R/ sub-directory
                                          #br()
                                 ), # End  tab

                                 tabPanel("Confidence Intervals",
                                          style = "background-color: #7b8a98;",
                                          br(),
                                          ciUI("ci"),  ## This inserts the content for the page, which is saved in the /R/ sub-directory
                                          #br()
                                 ), # End Confidence Intervals tab 
                                 tabPanel("T-Tests",
                                          style = "background-color: #7b8a98;",
                                          br(),
                                          ttestsaUI("ttestsa"),  ## This inserts the content for the page, which is saved in the /R/ sub-directory
                                          #br()
                                 ), # End T-Tests tab 
                                 tabPanel("Contingency Table Tests",
                                          style = "background-color: #7b8a98;",
                                          br(),
                                          contTableUI("contTable"),  ## This inserts the content for the page, which is saved in the /R/ sub-directory
                                          br()
                                 ), # End Contingency Tables tab 
                                 tabPanel("Run Charts",
                                          style = "background-color: #7b8a98;",
                                          br(),
                                          runChartUI("runChart"),  ## This inserts the content for the page, which is saved in the /R/ sub-directory
                                          br()
                                 ) # End Contingency Tables tab 

                                
                     )
            )
           
            
            
      ) # end top-level tabs (end all tabs and their content)
    ##################################################################
    ###   This ends the section that creates the navigation tabs
    ###   and that inserts the content on the pages nested
    ###   under those tabs.
    ##################################################################
     
  
) #end fluidpage; end secure_app

##########################################################
##########################################################
###
###   This ends the ui section of the file
###
##########################################################
##########################################################


#ui <- secure_app(ui,head_auth = tags$script(inactivity), theme = "Bubbly")
  


                          
     
##########################################################
##########################################################
###
###   This starts the server section of the file
###
##########################################################
##########################################################                               

####################### begin server section
server <- function(input, output,session) {
  
  
  #concReviewServer("concReview")
  hypTest1Server("hypTest1")
  modelServer("model")
  #adTopicsServer("adTopics")
  fundStatLitServer("fundStatLit")
  powerNServer("powerN")
  statsResProcServer("statsResProc")
  ttestsServer("ttests")
  ttestsaServer("ttestsa")
  twoSampleTTestServer("twoSampleTTest")
  pairedTTest2Server("pairedTTest2")
  estCIServer("estCI")
  sciAimsStatServer("sciAimsStat")
  descrStatsServer("descrStats")
  cltServer("clt")
  cltFromProbDistServer("cltFromProbDist")
  dataColCleanServer("dataColClean")
  ciServer("ci")
  ciForMeanServer("ciForMean")
  ciForProportionServer("ciForProportion")
  contTableServer("contTable")
  contTable2Server("contTable2")
  mcnemarsServer("mcnemars")
  table12Server("table12")
  powerServer("power")
  ttestPowerServer("ttestPower")
  descStat2Server("descStat2")
  table1Server("table1")
  snipsServer("snips")
  faqDNPServer("faqDNP")
  planDNPServer("planDNP")
  runChartServer("runChart")
  runChart2Server("runChart2")
  
  
  
  
  
  
  
  #result_auth <- secure_server(check_credentials = check_credentials(credentials),max_users=30)
  
  
  # authentication module removed for testing
  # auth <- callModule(
  #   module = auth_server,
  #   id = "auth",
  #   check_credentials = check_credentials(credentials)
  # )
  # 
  # output$res_auth <- renderPrint({
  #   reactiveValuesToList(auth)
  # })
  
  # classic app
  #selectedData <- reactive({
  #  
  #  req(auth$result)  # <---- dependency on authentication result
  #  
  #  iris[, c(input$xcol, input$ycol)]
  #})
  
  
  
  
  observeEvent(input$toIntro,{ 
    updateTabsetPanel(session, "introTabs", selected = "Course Overview")
  })
  observeEvent(input$toIntro2,{ 
    updateTabsetPanel(session, "introTabs", selected = "Course Overview")
  })
  
  observeEvent(input$toIntroTop,{ 
    updateTabsetPanel(session, "topTabs", selected = "Introduction")
  })
  observeEvent(input$toIntroTop2,{ 
    updateTabsetPanel(session, "topTabs", selected = "Introduction")
  })
  
  observeEvent(input$toNextI,{ 
    updateTabsetPanel(session, "topTabs", selected = "I. Design")
  })
  observeEvent(input$toNextI2,{ 
    updateTabsetPanel(session, "topTabs", selected = "I. Design")
  })
  
  observeEvent(input$toResProc,{ 
    updateTabsetPanel(session, "introTabs", selected = "Statistics in the Research Process")
  })
  observeEvent(input$toResProc2,{ 
    updateTabsetPanel(session, "introTabs", selected = "Statistics in the Research Process")
  })
  
  observeEvent(input$toNextIA,{ 
    updateTabsetPanel(session, "designTabs", selected = "A. Planning an Analysis")
  })
  observeEvent(input$toNextIA2,{ 
    updateTabsetPanel(session, "designTabs", selected = "A. Planning an Analysis")
  })
  
  observeEvent(input$toNextIB,{ 
    updateTabsetPanel(session, "designTabs", selected = "B. Power/Sample Size/Effect Size")
  })
  observeEvent(input$toNextIB2,{ 
    updateTabsetPanel(session, "designTabs", selected = "B. Power/Sample Size/Effect Size")
  })
  
  observeEvent(input$toNextIIA,{ 
    updateTabsetPanel(session, "sampleTabs", selected = "A. Data Collection, Cleaning & Manipulation")
  })
  observeEvent(input$toNextIIA2,{ 
    updateTabsetPanel(session, "sampleTabs", selected = "A. Data Collection, Cleaning & Manipulation")
  })
  
  observeEvent(input$toNextIIB,{ 
    updateTabsetPanel(session, "sampleTabs", selected = "B. Descriptive Statistics")
  })
  observeEvent(input$toNextIIB2,{ 
    updateTabsetPanel(session, "sampleTabs", selected = "B. Descriptive Statistics")
  })
  
  observeEvent(input$toNextIII,{ 
    updateTabsetPanel(session, "topTabs", selected = "III. Inferential Statistics")
  })
  observeEvent(input$toNextIII2,{ 
    updateTabsetPanel(session, "topTabs", selected = "III. Inferential Statistics")
  })
  
  observeEvent(input$toNextII,{ 
    updateTabsetPanel(session, "topTabs", selected = "II. The Sample")
  })
  observeEvent(input$toNextII2,{ 
    updateTabsetPanel(session, "topTabs", selected = "II. The Sample")
  })
  
  
  
  
  observeEvent(input$toNextIIIA,{ 
    updateTabsetPanel(session, "infTabs", selected = "A. Estimation and Confidence Intervals")
  })
  observeEvent(input$toNextIIIA2,{ 
    updateTabsetPanel(session, "infTabs", selected = "A. Estimation and Confidence Intervals")
  })
  
  observeEvent(input$toNextIIIB,{ 
    updateTabsetPanel(session, "infTabs", selected = "A. Estimation and Confidence Intervals")
  })
  observeEvent(input$toNextIIIB2,{ 
    updateTabsetPanel(session, "infTabs", selected = "A. Estimation and Confidence Intervals")
  })
  
  observeEvent(input$toNextIIIA,{ 
    updateTabsetPanel(session, "infTabs", selected = "B. Hypothesis Testing")
  })
  observeEvent(input$toNextIIIA2,{ 
    updateTabsetPanel(session, "infTabs", selected = "B. Hypothesis Testing")
  })
  
  observeEvent(input$toNextIIIC,{ 
    updateTabsetPanel(session, "infTabs", selected = "C. Modelling")
  })
  observeEvent(input$toNextIIIC2,{ 
    updateTabsetPanel(session, "infTabs", selected = "C. Modelling")
  })
  
  
  observeEvent(input$toNextConc,{ 
    updateTabsetPanel(session, "topTabs", selected = "Conclusions and Additional Topics")
  })
  observeEvent(input$toNextConc,{ 
    updateTabsetPanel(session, "topTabs", selected = "Conclusions and Additional Topics")
  })
  
  
  observeEvent(input$toNextAddTop,{ 
    updateTabsetPanel(session, "concTabs", selected = "Additional Topics")
  })
  observeEvent(input$toNextAddTop,{ 
    updateTabsetPanel(session, "concTabs", selected = "Additional Topics")
  })
  
  observeEvent(input$toNextConcRev,{ 
    updateTabsetPanel(session, "concTabs", selected = "Conclusions and Review")
  })
  observeEvent(input$toNextConcRev,{ 
    updateTabsetPanel(session, "concTabs", selected = "Conclusions and Review")
  })  
  
  
  
  
  
  
  
  
  
  observeEvent(input$video1a_10,{
    showModal(modalDialog(
      
      tags$div(
        style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
        h3("Module 1: Introduction"),
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
  
  
  
  
  
  
  observeEvent(input$video10_1a,{
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
  
  
  
  
  observeEvent(input$video1a1_1a,{
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
  
  
  
  observeEvent(input$video1a_1a1,{
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
  
  
  
  observeEvent(input$video1b_1a1,{
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
  
  
  observeEvent(input$video1a1_1b,{
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
               actionButton(("video1b_1a1"), label = "< Previous"), actionButton(("video1b_1c"), label = "Next >") 
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
  
  
  
  observeEvent(input$video1c_1b,{
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
               actionButton(("video1b_1a1"), label = "< Previous"), actionButton(("video1b_1c"), label = "Next >") 
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
  
  
  observeEvent(input$video1b_1c,{
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
  
  
  observeEvent(input$video1c1_1c,{
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
  
  
  observeEvent(input$video1c_1c1,{
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
  
  
  
  observeEvent(input$video1c2_1c1,{
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
  
  
  
  observeEvent(input$video1c1_1c2,{
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
  
  
  
  observeEvent(input$video1d_1c2,{
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
  
  
  
  observeEvent(input$video1c2_1d,{
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
  
  
  
  observeEvent(input$video1e_1d,{
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
  
  
  
  
  observeEvent(input$video1d_1e,{
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
  
  
  
  observeEvent(input$video20_1e,{
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
  
  
  
  
  
  
  
  
  observeEvent(input$video1e_20,{
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
  
  
  
  observeEvent(input$video2a_20,{
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
  
  
  
  
  observeEvent(input$video20_2a,{
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
  
  
  observeEvent(input$video2b_2a,{
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
  
  
  observeEvent(input$video2a_2b,{
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
  
  
  observeEvent(input$video2b1_2b,{
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
  
  
  observeEvent(input$video2b_2b1,{
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
  
  
  observeEvent(input$video2c_2b1,{
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
  
  
  observeEvent(input$video2b1_2c,{
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
  
  
  observeEvent(input$video2d_2c,{
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
  
  
  
  
  observeEvent(input$video2c_2d,{
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
  
  
  
  observeEvent(input$video2e_2d,{
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
  
  
  
  observeEvent(input$video2d_2e,{
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
  
  
  
  observeEvent(input$video2f_2e,{
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
  
  
  
  observeEvent(input$video2e_2f,{
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
  
  
  
  observeEvent(input$video30_2f,{
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
  
  
  
  
  
  
  
  
  
  
  
  
  
  observeEvent(input$video2f_30,{
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
  
  
  
  
  observeEvent(input$video3a_30,{
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
  
  
  
  observeEvent(input$video30_3a,{
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
  
  
  
  
  observeEvent(input$video3b_3a,{
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
  
  
  observeEvent(input$video3a_3b,{
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
  
  
  
  observeEvent(input$video3c_3b,{
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
  
  
  observeEvent(input$video3b_3c,{
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
  
  
  
  observeEvent(input$video3d_3c,{
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
  
  
  
  observeEvent(input$video3c_3d,{
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
  
  
  
  observeEvent(input$video3e_3d,{
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
  
  
  
  
  observeEvent(input$video3d_3e,{
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
  
  
  observeEvent(input$video3f_3e,{
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
  
  
  
  observeEvent(input$video3e_3f,{
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
  
  
  observeEvent(input$video40_3f,{
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
  
  
  
  
  
  
  
  
  observeEvent(input$video3f_40,{
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
  
  
  
  observeEvent(input$video4a_40,{
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
  
  
  
  
  
  observeEvent(input$video40_4a,{
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
               actionButton(("video4a_40"), label = "< Previous Video") ,actionButton(("video4a_4a1"), label = "Next Video >") 
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
  
  
  
  observeEvent(input$video4a1_4a,{
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
               actionButton(("video4a_40"), label = "< Previous Video") ,actionButton(("video4a_4a1"), label = "Next Video >") 
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
  
  
  
  
  
  
  observeEvent(input$video4a_4a1,{
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
  
  
  
  observeEvent(input$video4b_4a1,{
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
  
  
  
  observeEvent(input$video4a1_4b,{
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
  
  
  
  observeEvent(input$video4b1_4b,{
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
  
  
  
  observeEvent(input$video4b_4b1,{
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
  
  
  observeEvent(input$video4c_4b1,{
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
  
  
  
  
  observeEvent(input$video4b1_4c,{
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
  
  
  
  observeEvent(input$video4d_4c,{
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
  
  
  
  
  
  observeEvent(input$video4c_4d,{
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
  
  
  
  observeEvent(input$video50_4d,{
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
  
  
  
  
  
  
  
  
  observeEvent(input$video4d_50,{
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
  
  
  
  observeEvent(input$video5a_50,{
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
  
  
  
  
  
  observeEvent(input$video50_5a,{
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
  
  
  observeEvent(input$video5c_5a,{
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
  
  
  
  
  
  
  
  observeEvent(input$video5a_5c,{
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
  
  observeEvent(input$video5c1_5c,{
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
  
  
  
  
  observeEvent(input$video5c_5c1,{
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
  
  
  observeEvent(input$video5f_5c1,{
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
  
  
  
  
  observeEvent(input$video5c1_5f,{
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
  
  
  observeEvent(input$video5f1_5f,{
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
  
  
  
  observeEvent(input$video5f_5f1,{
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
  
  
  observeEvent(input$video5h_5f1,{
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
  
  
  
  observeEvent(input$video5f1_5h,{
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
  
  
  observeEvent(input$video60_5h,{
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
  
  
  
  
  
  
  
  
  observeEvent(input$video5h_60,{
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
  
  
  
  observeEvent(input$video6a_60,{
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
  
  
  
  observeEvent(input$video60_6a,{
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
  
  
  
  observeEvent(input$video6c_6a,{
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
  
  
  
  observeEvent(input$video6a_6c,{
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
  
  observeEvent(input$video6c1_6c,{
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
  
  
  observeEvent(input$video6c_6c1,{
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
  
  
  observeEvent(input$video6e_6c1,{
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
  
  
  
  observeEvent(input$video6c1_6e,{
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
  
  
  observeEvent(input$video6g_6e,{
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
  
  
  
  observeEvent(input$video6e_6g,{
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
  
  
  observeEvent(input$video6i_6g,{
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
  
  
  
  
  observeEvent(input$video6g_6i,{
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
               actionButton(("video6i_6g"), label = "< Previous Video") ,actionButton(("video6i_70"), label = "Next Video >") 
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
  
  
  
  observeEvent(input$video70_6i,{
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
               actionButton(("video6i_6g"), label = "< Previous Video") ,actionButton(("video6i_70"), label = "Next Video >") 
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
  
  
  observeEvent(input$video6i_70,{
    showModal(modalDialog(
      tags$div(
        style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
        h3("End of Final Module"),
        tags$iframe(
          width="1280",
          height="720",
          src = "video70.png",
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
               actionButton(("video70_6i"), label = "< Previous Video") 
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
  
  
  
  
  
  
  
  
  
  
  
  

} # end server






shinyApp(ui = ui, server = server, enableBookmarking = "url")
