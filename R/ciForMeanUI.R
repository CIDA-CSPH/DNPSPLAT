# Module UI function
ciForMeanUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),

    
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           
           br(),
           column(width=10,
                  h2("Goal or Null Value")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip5a1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip5a2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
           
           column(width=12,
                  br(),
                  HTML(paste0(
                    "Enter your goal or null value for the population mean \u03BC",tags$sub("0")," here:"
                  )),
                  br(),
                  br(),
                  numericInput(ns("goal"),HTML(paste0(
                    "\u03BC",tags$sub("0")," ="
                  )),value=30),
                  #numericInput(ns("nullDiff"),
                  #  "Enter a value for \u03BC",
                  #value=0),
                  br()
           )
    ),
    
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           h2("Data"),
           br(),
           "Enter the label for your variable and your data below.",
           br(),
           br(),
           textInput(ns("outcomeLabel"),"Enter Outcome Label",value="Body Mass Index"),
           br(),
           br(),
           
           
           column(width=9, style="background-color: white",
                  
                  tabsetPanel(type = "tabs",id=ns("dataInput"),
                              
                              tabPanel("Example Data",value=1,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Example Data"),
                                                "The following data are example data. They were generated through random simulation and do not represent observations from real people. However, they are meant to 
                                                mimic an experiment in which participants were randomized to two groups, a treatment group and a control group, where the treatment was a weight loss drug 
                                                and the control was a placebo. The outcome was body mass index (BMI).",
                                                br(),
                                                br(),
                                                "To use your own data, click on the 'Upload Data' or 'Paste Data' tabs to upload or paste your data from Excel. Click on the 'Enter Data by Hand' tab to 
                                                type your data in the cells by hand.",
                                                br(),
                                                br(),
                                                
                                                
                                                bsCollapse(id="exampleDataView",open="Collapse Data View",multiple=FALSE,
                                                           
                                                           bsCollapsePanel("Collapse Data View",
                                                                           column(6, 
                                                                                  style="background-color: white",
                                                                                  matrixInput(
                                                                                    inputId = ns("matrix1a"),
                                                                                    label = "Enter Group 1 Name & Data",
                                                                                    value = matrix(
                                                                                      c(35.74,
                                                                                        33.84,
                                                                                        29.99,
                                                                                        31.75,
                                                                                        34.09,
                                                                                        32.28,
                                                                                        29.16,
                                                                                        30.77,
                                                                                        30.61,
                                                                                        28.49,
                                                                                        31.29,
                                                                                        28.55,
                                                                                        28.70,
                                                                                        29.94,
                                                                                        28.09,
                                                                                        34.38,
                                                                                        34.81,
                                                                                        29.70,
                                                                                        29.09,
                                                                                        29.77,
                                                                                        31.90,
                                                                                        31.82,
                                                                                        29.20,
                                                                                        32.04,
                                                                                        31.22,
                                                                                        31.12,
                                                                                        36.50,
                                                                                        32.89,
                                                                                        37.40),
                                                                                      ncol=1,
                                                                                      nrow=29,
                                                                                      dimnames=list(
                                                                                        NULL,
                                                                                        c("Control")
                                                                                      )
                                                                                    ),
                                                                                    class = "numeric",
                                                                                    cols = list(
                                                                                      names = TRUE,
                                                                                      editableNames = TRUE
                                                                                    ),
                                                                                    rows = list(
                                                                                      names = FALSE,
                                                                                      extend=TRUE,
                                                                                      delta=1
                                                                                    )#,
                                                                                    #cells = list(editableCells = FALSE)
                                                                                  )
                                                                           )
                                                                           
                                                           )
                                                           
                                                ),
                                                
                                                
                                                br()
                                         ),
                                         br()
                                       ),
                                       br()
                                       
                              ),
                              
                              tabPanel("Paste Data",value=2,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                br(),
                                                br(),
                                                bsCollapse(id="pasteDataView",open="Paste Data from Excel",multiple=FALSE,
                                                           bsCollapsePanel("Paste Data from Excel",
                                                                           "Enter your group names and paste numeric data below. Or, click on the 'Upload Data' tab to upload your data from Excel.",
                                                                           br(),
                                                                           br(),
                                                                           column(12,
                                                                                  column(6,
                                                                                         textInput(ns("label1a2"),"Enter Group 1 Label",value="Group 1"),
                                                                                         textAreaInput(ns("matrix1a2in"),"Paste a column of numeric data from Excel for group 1."),
                                                                                         br(),
                                                                                         br()
                                                                                  )
                                                                                  

                                                                           ),
                                                                           
                                                                           br()
                                                           )
                                                ),
                                                bsCollapse(id="pasteDataView2",open="Data Preview",multiple=FALSE,
                                                           
                                                           bsCollapsePanel("View & Edit Full Data",
                                                                           column(6, 
                                                                                  style="background-color: white",
                                                                                  matrixInput(
                                                                                    inputId = ns("matrix1a3"),
                                                                                    label = "Group 1 Data",
                                                                                    value = matrix(
                                                                                      c(NA),
                                                                                      ncol=1,
                                                                                      #nrow=29,
                                                                                      dimnames=list(
                                                                                        NULL,
                                                                                        c("Group 1")
                                                                                      )
                                                                                    ),
                                                                                    class = "numeric",
                                                                                    cols = list(
                                                                                      names = TRUE,
                                                                                      editableNames = TRUE
                                                                                    ),
                                                                                    rows = list(
                                                                                      names = FALSE,
                                                                                      extend=TRUE,
                                                                                      delta=1
                                                                                    )#,
                                                                                    #cells = list(editableCells = FALSE)
                                                                                  )
                                                                           )
                                                                           
                                                           )
                                                           
                                                ),
                                                
                                         ),
                                         br()
                                       ),
                                       br()
                                       
                              ),
                              
                              tabPanel("Upload Data",value=3,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Upload Data"),
                                                "Upload your data or Analysis file. To upload data for the first time, upload an Excel file with columns of numbers in columns 'B' and 'C', with  group names as text in the first row of those columns. You can download an example dataset to see its formatting by clicking this link:",
                                                br(),
                                                br(),
                                                tags$a(href="2-SampleTTestData.xlsx",download="2-SampleTTestData.xlsx",
                                                       "Example Analysis File for 2-Sample T-Test",target="_blank"),
                                                br(),
                                                br(),
                                                "You can also use the Analysis file saved after using this tool previously. This is the tab named 'Analysis,' which contains your data in columns 'B' and 'C' in the reproducible file you downladed. The fact that you can upload that file and get the exact same results as you did then is what makes this reproducible research (see last section).",
                                                
                                                br(),
                                                br(),
                                                fileInput(ns("tTestData"),"Enter data file location",accept=".xlsx"),
                                                br(),
                                                br(),
                                                
                                                bsCollapse(id="importedDataView",open="Data Preview",multiple=FALSE,
                                                           
                                                           bsCollapsePanel("View & Edit Full Data",
                                                                           
                                                                           column(6, 
                                                                                  style="background-color: white",
                                                                                  matrixInput(
                                                                                    inputId = ns("matrix1a2"),
                                                                                    label = "Uploaded Group 1 Name & Data",
                                                                                    value = matrix(
                                                                                      c("",""),
                                                                                      ncol=1,
                                                                                      nrow=2,
                                                                                      dimnames=list(
                                                                                        NULL,
                                                                                        c("Group 1")
                                                                                      )
                                                                                    ),
                                                                                    class = "numeric",
                                                                                    cols = list(
                                                                                      names = TRUE,
                                                                                      editableNames = TRUE
                                                                                    ),
                                                                                    rows = list(
                                                                                      names = FALSE,
                                                                                      extend=TRUE,
                                                                                      delta=1
                                                                                    )#,
                                                                                    #cells = list(editableCells = FALSE)
                                                                                  )
                                                                           )
                                                                          
                                                                           
                                                           )
                                                           
                                                )
                                                
                                                
                                                
                                         ),
                                         br()
                                       ),
                                       br()
                                       
                              ),
                              
                              tabPanel("Enter Data by Hand",value=4,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Data Entry by Hand"),
                                                "Enter your group names and numeric data in the cells below. Or, click on the 'Upload Data' or 'Paste Data' tabs above to upload your data from Excel.",
                                                br(),
                                                br(),
                                                
                                                
                                                bsCollapse(id="dataByHandView",open="View & Edit Full Data",multiple=FALSE,
                                                           
                                                           bsCollapsePanel("View & Edit Full Data",
                                                                           column(6, 
                                                                                  style="background-color: white",
                                                                                  matrixInput(
                                                                                    inputId = ns("matrix1a4"),
                                                                                    label = "Enter Group 1 Name & Data",
                                                                                    value = matrix(
                                                                                      c(NA,NA),
                                                                                      ncol=1,
                                                                                      nrow=2,
                                                                                      dimnames=list(
                                                                                        NULL,
                                                                                        c("Group 1")
                                                                                      )
                                                                                    ),
                                                                                    class = "numeric",
                                                                                    cols = list(
                                                                                      names = TRUE,
                                                                                      editableNames = TRUE
                                                                                    ),
                                                                                    rows = list(
                                                                                      names = FALSE,
                                                                                      extend=TRUE,
                                                                                      delta=1
                                                                                    )#,
                                                                                    #cells = list(editableCells = FALSE)
                                                                                  )
                                                                           )
                                                                           
                                                           )
                                                           
                                                ),
                                                
                                                
                                                br()
                                         ),
                                         br()
                                       ),
                                       br()
                                       
                              )
                  ),
                  
                  #br(),
                  br(),
                  br()
                  
           ),
           
           
           
       #    column(width=9, style="background-color: white",
       #           tabsetPanel(type = "tabs",id=ns("dataInput"),
       #                       
       #                       tabPanel("Enter or Upload Data",value=1,
       #                                style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
       #                                br(),
       #                                fluidPage(
       #                                  column(12,style = " background-color: white; border-radius: 5px; ",
       #                                         h3("Enter or Upload Data"),
       #                                         "Expand the panel below the data preview cells to enter your numeric data (must be numeric). Or, upload your data or analaysis file by entering your data file location below.
       #                                          To upload data for the first time, upload an Excel file with a column of numbers in column 'B' with the group name as text in the first row of that column. You can download an example dataset to see its formatting by clicking this link:",
       #                                          br(),
       #                                          br(),
       #                                          tags$a(href="ciForMeanIn.xlsx",download="ciForMeanIn.xlsx",
       #                                                 "Example Analysis File for Confidence Interval for Mean",target="_blank"),
       #                                          br(),
       #                                          br(),
       #                                          "You can also use the Analysis file (Analysis Tab in downloaded file) saved after using this tool previously. The fact that you can upload that file and get the exact same results as you did then is what makes this reproducible research (see last section).",
       #                                          
       #                                          br(),
       #                                          br(),
       #                                          
       #                                          fileInput(ns("ciMeanData"),"Enter data file location",accept=".xlsx"),
       #                                          br(),
       #                                          br(),  
       #                                         
       #                                         
       #                                         
       #                                         bsCollapse(id="dataByHandView",open="Data Preview",multiple=FALSE,
       #                                                    bsCollapsePanel("Data Preview",
       #                                                                    column(6, 
       #                                                                           style="background-color: white",
       #                                                                           matrixInput(
       #                                                                             inputId = ns("matrix1aShort"),
       #                                                                             label = "Group Name & Data",
       #                                                                             value = matrix(
       #                                                                               c(35.74,
       #                                                                                 33.84,
       #                                                                                 29.99,
       #                                                                                 31.75
       #                                                                               ),
       #                                                                               ncol=1,
       #                                                                               #nrow=29,
       #                                                                               nrow=4,
       #                                                                               dimnames=list(
       #                                                                                 NULL,
       #                                                                                 c("Treatment")
       #                                                                               )
       #                                                                             ),
       #                                                                             class = "numeric",
       #                                                                             cols = list(
       #                                                                               names = TRUE,
       #                                                                               editableNames = FALSE
       #                                                                             ),
       #                                                                             rows = list(
       #                                                                               names = FALSE,
       #                                                                               extend=FALSE,
       #                                                                               delta=1
       #                                                                             )#,
       #                                                                             #cells = list(editableCells = FALSE)
       #                                                                           )
       #                                                                    )
       #                                                    ),
       #                                                    bsCollapsePanel("View & Edit Full Data",
       #                                                                    column(6, 
       #                                                                           style="background-color: white",
       #                                                                           matrixInput(
       #                                                                             inputId = ns("matrix1a"),
       #                                                                             label = "Enter Group Name & Data",
       #                                                                             value = matrix(
       #                                                                               c(35.74,
       #                                                                                 33.84,
       #                                                                                 29.99,
       #                                                                                 31.75,
       #                                                                                 34.09,
       #                                                                                 32.28,
       #                                                                                 29.16,
       #                                                                                 30.77,
       #                                                                                 30.61,
       #                                                                                 28.49,
       #                                                                                 31.29,
       #                                                                                 28.55,
       #                                                                                 28.70,
       #                                                                                 29.94,
       #                                                                                 28.09,
       #                                                                                 34.38,
       #                                                                                 34.81,
       #                                                                                 29.70,
       #                                                                                 29.09,
       #                                                                                 29.77,
       #                                                                                 31.90,
       #                                                                                 31.82,
       #                                                                                 29.20,
       #                                                                                 32.04,
       #                                                                                 31.22,
       #                                                                                 31.12,
       #                                                                                 36.50,
       #                                                                                 32.89,
       #                                                                                 37.40),
       #                                                                               ncol=1,
       #                                                                               nrow=29,
       #                                                                               dimnames=list(
       #                                                                                 NULL,
       #                                                                                 c("Treatment")
       #                                                                               )
       #                                                                             ),
       #                                                                             class = "numeric",
       #                                                                             cols = list(
       #                                                                               names = TRUE,
       #                                                                               editableNames = TRUE
       #                                                                             ),
       #                                                                             rows = list(
       #                                                                               names = FALSE,
       #                                                                               extend=TRUE,
       #                                                                               delta=1
       #                                                                             )#,
       #                                                                             #cells = list(editableCells = FALSE)
       #                                                                           )
       #                                                                    )
       #                                                                    
       #                                                    )
       #                                                    
       #                                         ),
       #                                         
       #                                         
       #                                         br()
       #                                  ),
#
       #                                  
       #                                  
       #                                ),
       #                                br()
       #                                
       #                       ),
       #                       
       #                       
#
       #           ),
       #           
       #           #br(),
       #           br(),
       #           br()
       #           
       #    ),
           
    ),
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           
           br(),
           column(width=10,
                  h2("Confidence Interval Assumptions")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip5c1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip5c2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )
                  
           ),
           br(),
           br(),
           br(),
           
           
           
           
           column(12,
           br(),
           h3("Normality"),
           "Use the following plots to assess the assumption of normality.",
           br(),
           br(),
           column(6, 
                  h4("Distribution of Data"),
                  br(),
                  plotOutput(ns("histogram2"),height=300),
                  br()#,
                  #plotOutput(ns("histogram3"),height=300),
                  #br()
           ),
           column(6, 
                  h4("Distribution of Sample Means (bootstrapped)"),
                  br(),
                  plotOutput(ns("histogram4"),height=300),
                  #br(),
                  #plotOutput(ns("histogram5"),height=300),
                  br()
                  
           ),
           br(),
           br(),
           br(),
           br(),

           br(),
           br()
           )
    ),
    
    
    

    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = "background-color: white; border-radius: 5px; ",
           br(),
           column(width=10,
                  h2("Tables and Figures for Publication")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;"#, "Learn:"
                                    )),
                  column(width=4,
                         #actionButton(ns("snip1d1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip1d2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           #h2("Tables and Figures for Publication"),
           #br(),
           column(12,
           "The following table is a publication-worthy way to display your results. 
       The figure below is one way to graphically display your results.",
           br(),
       br(),
       
       h4(textOutput(ns("resultsTableTitle"))),
       br(),
           tableOutput(ns("ciForMeanTable")),
           br(),
           br(),
           plotOutput(ns("forestPlotForMean"),inline=TRUE),
           br()
           ),
       br(),
       column(12,
       bsCollapse(id="plotOptions",open="Panel 1",
                  # bsCollapsePanel("Hide Plot Options",
                  #                 ""
                  #            ),
                  bsCollapsePanel("Show Plot Options",
                                  column(4, style = "background-color: white; border-radius: 5px; ",
                                         textInput(ns("chartTitle"),"Enter Chart Title",value="Body Mass Index"),
                                         textInput(ns("subTitle"),"Enter Chart Sub-Title",value="Mean and 95% Confidence Interval"),
                                         numericInput(ns("widthSelect"),"Enter the Chart Width",value="500"),
                                         numericInput(ns("heightSelect"),"Enter the Chart Height",value="600"),
                                         textInput(ns("goalLabel"),"Enter Label for Goal/Null Value",value="Goal"),
                                  ),
                                  column(4, style = "background-color: white; border-radius: 5px; ",
                                         textInput(ns("xLab"),"Enter X-Axis Label",value=""),
                                         textInput(ns("yLab"),"Enter Y-Axis Label",value="Body Mass Index"),
                                         numericInput(ns("titleSize"),"Enter Title Size",value="20"),
                                         numericInput(ns("textSize"),"Enter Text Size",value="15"),
                                         selectInput(ns("plotGoal"),"Include Goal/Null Value",choices=c("Include goal/null value in plot","Exclude goal/null value from plot"),selected="Include goal/null value in plot"),
                                         br(),
                                         br(),
                                         br()
                                  ),
                                  column(4, style = "background-color: white; border-radius: 5px; ",
                                         numericInput(ns("lineSize"),"Enter Line Thickness",value="1"),
                                         selectInput(ns("useLimits"),"Y-Axis Limits",choices=c("Use default y-axis limits","Use y-axis limits entered below"),selected="Use default y-axis limits"),
                                         numericInput(ns("yMax"),"Enter the Y-Axis Maximum",value=100),
                                         numericInput(ns("yMin"),"Enter the Y-Axis Minimum",value=0),
                                         br(),
                                         br(),
                                         br()
                                  )
                                  
                  )
                  
       )
       )
    ),
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           br(),
           column(width=10,
                  h2("Write-Up")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip5f1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         actionButton(ns("snip5f2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )
                  
           ),
           br(),
           br(),
           br(),
           
           column(width=12,
           h3("Methods"),
           "The following is an example of what one might write about this estimate in the methods section of a paper. 
       This example uses the BMI data present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way.",
           br(),
           br(),
           em("The sample mean was calculated, as was a 95% confidence interval using the confidence interval method for 
           normally-distributed means. The distributional assumption of 
       normality was examined graphically using histograms."),
           br(),
           br(),
           h3("Results"),
           "The following is an example of what one might write about the results of this estimate in the results section of a paper. 
       This example uses the BMI data present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way.",
           br(),
           br(),
           em("The mean BMI was 31.56 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          30.6 kg/m",tags$sup("2")," to 32.52 kg/m",tags$sup("2"),". Our data were not consistent with our goal of 30 kg/m",tags$sup("2")," or less, as our entire confidence interval was greater than 30 kg/m",tags$sup("2"),"."),
           
           
           br(),
           br(),
           br()
           )
    ),

  column(12,
         br(),
         br(),
         br()
  ),
  
  column(12, style = " background-color: white; border-radius: 5px; ",
         
         br(),
         column(width=10,
                h2("Save Reproducible Work")),
         column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                column(width=6,h4(style="color:#818e9f;", "Learn:")),
                column(width=4,
                       actionButton(ns("snip5g1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                       actionButton(ns("snip5g2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                       #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                       #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                )
                
         ),
         br(),
         br(),
         br(),
         
         
         
         
         
         #h2("Save Your Work Reproducibly"),
         column(width=12,
                br(),
                "This analysis tool saves files in a reproducible way in an Excel file with multiple sheets. Each time you save your results, it creates an Excel sheet that contains your data 
           and the information needed to run the analysis again if you input the file again. It also creates a sheet that contains all of the non-graphical output from your analysis, as well 
           as information about the analysis tool itself. Click the link below to download your reproducible analysis file and your results:",
           br(),
           br(),
           downloadButton(ns("downloadData"),"Download Reproducible Analysis File & Results"),
           br(),
           br()
           #actionButton(ns("do"), "Click Me"),
           
         ),
         br(),
         br(),
         br()
  ),
  column(12,
         br(),
         br(),
         br()
  ),
  
  )
  
  
  
  
  
  
  
}








ciForMeanServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      version<-reactive({
        1.1
      })
      
      
      
      matrix1a2inReactive <- eventReactive(input$matrix1a2in, {
        req(input$matrix1a2in)
        input$matrix1a2in
      })
      
      
      observe({
        matrix1a1<-matrix1a2inReactive()
        matrix1a1a<-matrix(scan(text=matrix1a1),ncol=1)
        matrix1a2<-as.numeric(matrix1a1a)
        matrix1a3<-matrix(matrix1a2,ncol=1)
        matrix1a4<-na.omit(matrix1a3)
        colnames(matrix1a4)<-input$label1a2
        updateMatrixInput(session,"matrix1a3",matrix1a4)
      })
      
      matrix1a <- reactive({
        #inFile <- input$tTestData
        #if (is.null(inFile))
        #  return(NULL)
        #req(Dat1ab())
        #mat<-as.matrix(readxl::read_excel(inFile$datapath,col_types="numeric"))
        mat<-Dat1ab()
        if(ncol(mat)<3){
          mat<-matrix(c(-99,-99,-99,-99),ncol=2,nrow=2)
          colnames(mat)<-c("Too Few Columns Present.","Too few columns present.")
          mat1<-as.matrix(mat[,2],ncol=1)
        } 
        if(ncol(mat)>=3){
          mat1<-as.matrix(mat[,2],ncol=1)
          if(!is.numeric(mat1)){
            mat1<-matrix(c(-99,-99),ncol=1)
            colnames(mat1)<-"Non-numeric data in column 2."
          }
          if(is.numeric(mat1)){
            colnames(mat1)<-colnames(mat)[2]
          }
          
        } 
        
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          matrix1a<-input$matrix1a3
        }
        if(input$dataInput==3){
          matrix1a<-na.omit(mat1)
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          matrix1a<-input$matrix1a4
        }
        matrix1a
      })
      
      matrix1b<-reactive({
        matrix1a()
      })
      
      dat<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          matrix1a<-input$matrix1a3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          matrix1a<-input$matrix1a4
        }
        
        #dat0<-as.matrix(matrix1In)
        dat0a<-as.matrix(matrix1a)
        
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        #colNames1[]<-"ColName1"
               
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        
        matrix1_2<-na.omit(rbind(matrix1a1))
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
        
      })
      
      dat1<-reactive({
        
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          matrix1a<-input$matrix1a3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          matrix1a<-input$matrix1a4
        }
        
        dat0a<-as.matrix(matrix1a)
        
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        
        matrix1_2<-na.omit(matrix1a1)
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
        
      })
      
      
      bootMean1<-reactive({
        if(input$dataInput==1){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          matrix1a<-input$matrix1a3
          matrix1_0<-input$matrix1a3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1_0<-matrix1a()
          matrix1a<-matrix1a()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          matrix1a<-input$matrix1a4
          matrix1_0<-input$matrix1a4
        }
        
        meanFunc<-function(dat,wt){
          sum(dat * wt)
        }
        
        bootMean<-boot(unlist(matrix1_0[,1]),meanFunc,R=100000, stype = "w")$t
        
        dat0<-as.matrix(bootMean)
        
        colNames1<-vector(length=length(na.omit(dat0)))
        colNames1[]<-colnames(matrix1_0)
        
        matrix1_1<-cbind(na.omit(dat0),colNames1)
        
        matrix1_2<-na.omit(matrix1_1)
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
      })
      
      
      goal<-reactive({
        goal<-input$goal
        goal
      })
      
      matrix1a<-reactive({
        matrix1a<-input$matrix1a
        matrix1a
      })
      
      
      outcomeLabel<-reactive({
        input$outcomeLabel
      })
      
      predLabel<-reactive({
        input$predLabel
      })

      
      
      histogram21<-reactive({
        ggplot(dat1(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + ylab("Count")
        #ggplot() + geom_boxplot(aes(y=matrix1a))
      })

      output$histogram2<-renderPlot({
        histogram21()
      })

      
      histogram41<-reactive({
        bw<-(max(bootMean1()$Outcome)-min(bootMean1()$Outcome))/30
        nObs<-sum(!is.na(bootMean1()$Outcome))
        ggplot(bootMean1(),aes(x=Outcome)) + 
          geom_histogram(
            binwidth=bw#,
            #aes(y=..density..)
          ) + 
          xlab(outcomeLabel()) + 
          xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + 
          ylab("Count") + 
          stat_function(fun = function(x) 
            dnorm(x, mean = mean(bootMean1()$Outcome), sd = sd(bootMean1()$Outcome)) * bw * nObs,color="red")
      })
      
      
      output$histogram4<-renderPlot({
        histogram41()
      })
      
      
      
      ciForMeanTable1<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          matrix1a<-input$matrix1a3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          matrix1a<-input$matrix1a4
        }
        dat0a<-as.matrix(matrix1a)
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        xBar1<-mean(matrix1a)
        se1<-sd(matrix1a)/sqrt(length(matrix1a))
        df1<-length(matrix1a)-1
        lcl1<-xBar1-qt(p=0.975,df=df1)*se1
        ucl1<-xBar1+qt(p=0.975,df=df1)*se1
        Results<-data.frame("Outcome"=paste(outcomeLabel()),
                            "Goal"=paste(round(goal(),digits=2),sep=""),
                            "Mean (95% CI)"=paste(round(xBar1,digits=2)," (",round(lcl1,digits=2),", ",round(ucl1,digits=2),")",sep="")
        )
        colnames(Results)<-c("Outcome","Goal/Null Value","Mean (95% CI)")
        Results
      })

      
      
      
      forestPlotForMean1<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          matrix1a<-input$matrix1a3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          matrix1a<-input$matrix1a4
        }
        dat0a<-as.matrix(matrix1a)
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        matrix1_2<-na.omit(rbind(matrix1a1))
        xBar1<-mean(matrix1a)
        se1<-sd(matrix1a)/sqrt(length(matrix1a))
        df1<-length(matrix1a)-1
        lcl1<-xBar1-qt(p=0.975,df=df1)*se1
        ucl1<-xBar1+qt(p=0.975,df=df1)*se1
      
        dat2<-data.frame("Index"=1,"Estimate"=xBar1,
                         "lcl"=lcl1,"ucl"=ucl1,
                         "Group"="tempGroupName"
                         )
        
        dat2$Group <- as.character(dat2$Group)
        dat2$Group <- factor(dat2$Group, levels=unique(dat2$Group))
        colors<-c("Mean"="black","Goal/Null Value"="red")
        
        plot<-ggplot(dat2,aes(y=Estimate,x=Group)) +
          geom_point(shape = 18, size = input$lineSize+3,color="black") +  
          geom_segment(aes(x = Group, y = lcl, xend = Group, yend = ucl,linetype="Mean & Confidence Interval"),size=input$lineSize,color="black")+
        
          ggtitle(input$chartTitle,subtitle=input$subTitle)+
          xlab(input$xLab)+
          ylab(input$yLab)+
          #scale_x_discrete(name = predLabel(), labels = c(colnames(matrix1a),colnames(matrix1b)))+#, trans = "reverse") +
          theme_bw() +
          theme(panel.border = element_blank(),
                legend.position="right",
                legend.text = element_text(size=input$textSize-2),
                legend.title = element_blank(),
                panel.background = element_blank(),
                panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                axis.ticks.length=unit(input$lineSize*0.15, "cm"),
                axis.ticks = element_line(size=input$lineSize*0.5),
                axis.line = element_line(colour = "black",size=input$lineSize),
                axis.text.y = element_text(size = input$textSize, colour = "black"),
                axis.text.x.bottom = element_blank(),
                axis.text.x=element_blank(),
                axis.title.x =  element_text(size = input$textSize, colour = "black"),
                axis.title.y = element_text(size = input$textSize, colour = "black"),
                plot.title = element_text(size=input$titleSize, colour="black",hjust=0.5),
                plot.subtitle = element_text(size=input$titleSize-4, colour="black",hjust=0.5))         

        if(input$plotGoal ==  "Include goal/null value in plot"){
          plot<-plot+          
            geom_hline(aes(yintercept=input$goal,linetype=input$goalLabel),size=input$lineSize,color="red")+
            scale_linetype_manual(name="Legend",values=c(2,1), 
                                  guide = guide_legend(override.aes = list(color = c("red", "black"))))
        }else{
          plot<-plot#+          
            #scale_linetype_manual(name="Legend",values=c(2,1), guide = guide_legend(override.aes = list(color = c("red", "black"))))
        }
        
        if(input$useLimits !=  "Use default y-axis limits"){
          plot+ylim(c(input$yMin,input$yMax))
        }else{
          plot
        }
        
              })
      
      
      
      
      
      output$forestPlotForMean<-renderPlot({
        forestPlotForMean1()
      },width=reactive({
        selectedWidth()}),
      height=reactive({
        selectedHeight()}))
      
      
      palette<-reactive({
        input$palette
      })
      
      selectedWidth<-reactive({
        input$widthSelect
      })
      
      selectedHeight<-reactive({
        input$heightSelect
      })
      
      
      
      resultsTableTitle1<-reactive({
        paste("Table 1. Mean",outcomeLabel(),"with Confidence Interval and Goal")
      })
      
      output$resultsTableTitle<-renderText({
        resultsTableTitle1()
      })
      
      output$ciForMeanTable<-renderTable({
        ciForMeanTable1()
      })
      
      output$testTable<-renderTable({
        testTable1()
      })
      
      output$expected<-renderTable({
        expected1()
      },rownames=TRUE)
      
      output$propTable<-renderTable({
        propTable1()
      },rownames=TRUE)
      
      goal<-reactive({
        input$goal
      })
      
      
      
      

      
      output$downloadData<-downloadHandler(filename=function(){
        paste0(tempdir(), "/", "ciForMean.xlsx")
      },
      content=function(file){
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          matrix1a<-input$matrix1a3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          matrix1a<-input$matrix1a4
        }
        #if(input$dataInput==1){
        #matrix1a<-input$matrix1a
        #contTabRows<-nrow(matrix1a)
        #contTabCols<-ncol(matrix1a)
        #}
        #if(input$dataInput==3){
        #  matrix1a<-input$matrix1a2
        #}
        
        wb = createWorkbook()
        
        sheet = addWorksheet(wb, "Analysis",gridLines = FALSE)
        
        col1<-matrix(c("CI for Mean","",
                       "Outcome Label:",outcomeLabel(),"",
                       "Predictor Label:","NA","",
                       "Null Hypothesis:",goal(),"",
                       "Plot Title:",input$chartTitle,"",
                       "Plot Sub Title:",input$subTitle,"",
                       "Plot Width:",input$widthSelect,"",
                       "Plot Height:",input$heightSelect,"",
                       "X-Axis Label:",input$xLab,"",
                       "Y-Axis Label:",input$yLab,"",
                       "Plot Title Size:",input$titleSize,"",
                       "Plot Text Size:",input$textSize,"",
                       "Plot Line Size:",input$lineSize,"",
                       "Use Axis Limits:",input$useLimits,"",
                       "Plot Y-Axis Max:",input$yMax,"",
                       "Plot Y-Axis Min:",input$yMin,"",
                       "Plot Palette:","Standard","",
                       "Test Type:","CI compared to goal/null value","",
                       "Estimator Type:","Wald CI for Mean","",
                       "Contingency Table Rows","NA","",
                       "Contingency Table Columns","NA",""),ncol=1)
        colnames(col1)<-"Tool:"
        
        writeData(wb,sheet=sheet,x=as.data.frame(col1), startCol=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x="Contingency Table with Row and Column Labels", startCol=3, rowNames=FALSE)
        writeDataTable(wb,sheet=sheet,x=as.data.frame(matrix1a), startCol=3,startRow = 1, rowNames=FALSE,tableStyle = "TableStyleLight8")
        #writeData(wb,sheet=sheet,x=as.data.frame(matrix1a), startCol=3,startRow = 1, rowNames=FALSE)
        setColWidths(wb,sheet,cols=1,widths = "auto")
        
        sheet = addWorksheet(wb, "Tabular Output",gridLines = FALSE)
        
        headStyle<-createStyle(border = "TopBottom", borderColour ='black', borderStyle="thick",textDecoration = "bold")
        bottomStyle<-createStyle(border="Bottom",borderStyle="thick")
        boldStyle<-createStyle(textDecoration = "bold")
        
        header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny"),ncol=1)
        colnames(header)<-"General Information"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header), startCol=1, startRow=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        header2<-matrix(c("Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus"),ncol=1)
        colnames(header2)<-"Creator"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header2), startCol=1, startRow=8, rowNames=FALSE)
        
        header3<-matrix(c("Confidence Interval for Mean","Core R Packages and Functions: ggplot{ggplot2}"),ncol=1)
        colnames(header3)<-"Tool"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header3), startCol=1, startRow=15, rowNames=FALSE)
        
        
       # header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),
       #                  paste0("System Time:",format(Sys.time(),"%H:%M:%S")),
       #                  "Statistical Planning, Learning, and Analysis Tool",
       #                  paste("Version:",version()),
       #                  "An R tool built with Shiny","",
       #                  "Created by Bryan McNair, MS",
       #                  "Center for Innovative Design and Analysis",
       #                  "Department of Biostatistics and Informatics",
       #                  "Colorado School of Public Health",
       #                  "University of Colorado Anschutz Medical Campus","","",
       #                  "Tool: Confidence Interval for Mean",
       #                  "Core R Packages and Functions: ggplot{ggplot2}"
       #                  ),ncol=1)
       # colnames(header)<-"General Information"
       # 
       # writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
       #expected<-expected1()
       #testTable<-testTable1()
       #propTable<-propTable1()
       #resultsTable<-resultsTable1()
        resultsTableTitle<-resultsTableTitle1()
        ciForMeanTable<-ciForMeanTable1()
        
        writeData(wb,sheet=sheet,x="Publishable Table", startCol=3+4, startRow=1, rowNames=FALSE)
        writeData(wb,sheet=sheet,x=ciForMeanTable, startCol=3+4, startRow=5, rowNames=FALSE)
        setColWidths(wb,sheet,cols=c(1:256),widths = "auto")
        writeData(wb,sheet=sheet,x=resultsTableTitle, startCol=3+4, startRow=3, rowNames=FALSE)
        addStyle(wb,sheet,style=boldStyle,rows=c(1,3),cols=3+4)
        addStyle(wb,sheet,style=headStyle,rows=5,cols=c((3+4):(3+4+2)))
        addStyle(wb,sheet,style=bottomStyle,rows=6,cols=c((3+4):(3+4+2)))
        
     #   offset1<-1+ncol(expected)
     #   writeData(wb,sheet=sheet,x="Test Results not for Publication", startCol=offset1+4+4, startRow=1, rowNames=FALSE)
     #   writeData(wb,sheet=sheet,x="Estimates (frequencies and percentages)", startCol=offset1+4+4, startRow=3, rowNames=FALSE)        
     #   writeData(wb,sheet=sheet,x=propTable, startCol=offset1+4+4, startRow=5, rowNames=TRUE)
     #   
     #   offset2<-nrow(propTable)+3
     #   writeData(wb,sheet=sheet,x="Test Results", startCol=3+offset1+1+4, startRow=5+offset2+1, rowNames=TRUE)
     #   writeData(wb,sheet=sheet,x=testTable, startCol=3+offset1+1+4, startRow=5+offset2+3, rowNames=FALSE)
        
     #   offset3<-max(ncol(propTable),ncol(testTable))+1
     #   writeData(wb,sheet=sheet,x="Publishable Table", startCol=3+offset1+1+offset3+1+4, startRow=1, rowNames=TRUE)
     #   writeData(wb,sheet=sheet,x=resultsTableTitle, startCol=3+offset1+1+offset3+1+4, startRow=3, rowNames=TRUE)
     #   writeData(wb,sheet=sheet,x=resultsTable, startCol=3+offset1+1+offset3+1+4, startRow=5, rowNames=FALSE)
        
        sheet = addWorksheet(wb, "Plot Output",gridLines = FALSE)
    
        histogram2<-histogram21()
        histogram4<-histogram41()
        forestPlotForMean<-forestPlotForMean1()
        
        selectedHeight<-selectedHeight()
        selectedWidth<-selectedWidth()
        
        png(paste0(tempdir(), "/", "histogram2.png"), width=600, height=800, units="px", res=144)
        print(histogram2)
        dev.off()  
        insertImage(wb, sheet=sheet, paste0(tempdir(), "/", "histogram2.png"), startRow=5, startCol=2,width=3, height=3, units="in")
        
        png(paste0(tempdir(), "/", "histogram4.png"), width=600, height=800, units="px", res=144)
        print(histogram4)
        dev.off()  
        insertImage(wb, sheet=sheet, paste0(tempdir(), "/", "histogram4.png"), startRow=5, startCol=6,width=3, height=3, units="in")
        
        png(paste0(tempdir(), "/", "forestPlotForMean.png"), width=selectedWidth*4, height=selectedHeight*4, units="px", res=300)
        print(forestPlotForMean)
        dev.off()  
        insertImage(wb, sheet=sheet, paste0(tempdir(), "/", "forestPlotForMean.png"), startRow=5, startCol=11,width=selectedWidth*4, height=selectedHeight*4, units="px")
        
        writeData(wb,sheet=sheet,x="Distribution of Sample Means (bootstrapped)", startCol=6, startRow=4, rowNames=FALSE,colNames=FALSE)
        
        writeData(wb,sheet=sheet,x="Histograms to Examine Normality (not to publish)", startCol=2, startRow=2, rowNames=FALSE,colNames=FALSE)
        
        writeData(wb,sheet=sheet,x="Figure for Publication", startCol=11, startRow=2, rowNames=FALSE,colNames=FALSE)

        
        saveWorkbook(wb, file,overwrite=TRUE)
        
      })
      
      
      
      
      
      
      Dat1ab <- reactiveVal()
      #Dat1a <- reactiveVal()
      #Dat1b <- reactiveVal()
      
      observeEvent(input[["ciMeanData"]], {
        xlfile <- input[["ciMeanData"]][["datapath"]]
        ext <- tolower(tools::file_ext(xlfile))
        if(ext == "xlsx") {
          sheets <- excel_sheets(xlfile)
          if(length(sheets) == 1L) {
            Dat1ab(read_xlsx(input[["ciMeanData"]][["datapath"]], sheet = 1L))
          } else {
            inputSweetAlert(
              session,
              inputId = "sheet",
              title = "Select the Analysis File Worksheet.",
              type = "question",
              input = "select",
              inputOptions = sheets,
              btn_colors="#818e9f"
            )
          }
        } else {
          sendSweetAlert(
            session,
            title = "Wrong file",
            text = "Please upload an `xlsx` file.",
            type = "error",
            btn_colors="#5f5f62"
          )
        }
      })
      
      
      
      observeEvent(input[["sheet"]], {
        if(read_xlsx(input[["ciMeanData"]][["datapath"]], sheet = input[["sheet"]])[1,1] != "CI for Mean"){
          sendSweetAlert(
            session,
            title = "Incorrect File",
            text = "Not a CI for Mean Analysis File. Please upload an analysis file compatible with the CI for Mean Tool.",
            type = "error",
            btn_colors="#5f5f62"
          )
        }else{
          Dat1ab(read_xlsx(input[["ciMeanData"]][["datapath"]], sheet = input[["sheet"]]))
          dat<-Dat1ab()
          options<-as.matrix(dat[,1])
          matrows<-as.numeric(options[58])
          matcols<-as.numeric(options[61])
          matrix1a<-as.matrix(na.omit(dat[,2]))
          updateMatrixInput(session,"matrix1a",value=matrix1a)
          updateMatrixInput(session,"matrix1aShort",value=matrix(matrix1a[1:4],ncol=1))
          #updateRadioButtons(session,"estType",selected=options[55])
          #updateRadioButtons(session,"testType",selected=options[52])
          #updateSelectInput(session,"palette",selected=options[49])
          updateTextInput(session,"outcomeLabel",value=options[4])
          updateTextInput(session,"predLabel",value=options[7])
          updateNumericInput(session,"goal",value=options[10])
          updateTextInput(session,"chartTitle",value=options[13])
          updateTextInput(session,"subTitle",value=options[16])
          updateNumericInput(session,"widthSelect",value=options[19])
          updateNumericInput(session,"heightSelect",value=options[22])
          updateTextInput(session,"xLab",value=options[25])
          updateTextInput(session,"yLab",value=options[28])
          updateNumericInput(session,"titleSize",value=options[31])
          updateNumericInput(session,"textSize",value=options[34])
          updateNumericInput(session,"lineSize",value=options[37])
          updateSelectInput(session,"useLimits",selected=options[40])
          updateNumericInput(session,"yMax",value=options[43])
          updateNumericInput(session,"yMin",value=options[46])
          
        }
      })
      
      
      
      
      
      
      
      
      
      
      
      
 
      
      
      observeEvent(
        input$snip5a1,{ showModal(modalDialog( tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), column(width = 12,
                                                                                                                                                                      h3("Goal or Null Value"),
                                                                                                                                                                      HTML(paste0(
                                                                                                                                                                       "Confidence intervals can be used for hypothesis testing or comparing your results to a predetermined goal. If the confidence interval contains your goal, you cannot claim a statistically-significant effect. However, if your confidence interval is entirely above or below your goal or null value, you can claim an effect that is significantly above or below the goal or null value. This is useful when you have a single experimental group, with no comparitor group."     
                                                                                                                                                                      )),
                                                                                                                                                                      br(), br() ) ) )) })
      observeEvent(
        input$snip1a2,{showModal(modalDialog(tags$div(style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                                                      h3("Hypotheses"), tags$iframe(width="1280", height="720",
                                                                                    src = "snip5a2.mp4",
                                                                                    #src = "video6i.pdf",
                                                                                    frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(
        input$snip5b1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Data"), ##### Change this one every time and text below
                               "Remember that, for a 2-sample t-test, the outcome is numeric and the predictor is binary (categorical with two categories). 
           One way to organize the required data is with two columns of numbers, one for each predictor category. The numbers themselves represent the observed outcome values.
           This is how we organize our data here, whether it's entered by hand our uploaded from an Excel file.",
           br(),
           br(),
           "Note that you do not need the same number of observations per group for a 2-sample t-test, so it's ok if the columns of numbers below are of unequal length. If uploading from Excel, it's ok if the columns of numbers are of unequal length, but leave missing or unobserved values blank--don't fill them in with 'NA' or '0' or '-99'. This app will fill them in with 'NA' after upload.",
           br(),
           br(),
           "For a paired t-test, each person or experimental unit must have a non-missing outcome value for each time point or replicate. Thus, the two columns of data must be of the same length. Additionally, they must be in the same order for the two columns with respect to people or experimental units. For instance, if the first observation in the first column came from a given person, the first observation in the second column must have come from that same person. While it wouldn't be used by our tool for its calculations, it might be useful to you to use an ID column that identifies people or experimental units. Then, all of the data in a given row should come from the person corresponding to the ID in that row.",
           br(), br() ) ) )) })
      observeEvent(
        input$snip5b2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Data"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip5b2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(
        input$snip5c1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Method Assumptions"), ##### Change this one every time and text below
                               "Wald-type confidence intervals, such as the confidence interval we use for the mean, require that the sample mean is normally distributed. In such a case, sample size doesn't matter (when it comes to normality). You can see histograms of the outcome values in the sample in the left column here. Another way for the sample mean to be normally distributed is for the sample size to be large. According to the Central Limit Theorem, the distribution of the sample mean gets closer and closer to normal as the sample size increases, EVEN IF THE OUTCOME VALUES THEMSELVES AREN'T NORMALLY DISTRIBUTED. You can learn more about the Central Limit Theorem by taking a look at our 'Normality and the Central Limit Theorem' tool.", br(), br(),
                                "The confidence intervals we use for proportions and percentages are not this kind of confidence interval. They are called Clopper Pearson confidence intervals. They are used for proportions and percentages and restrict the interval to the range (0, 1) for proportions and (0%, 100%) for percentages. These intervals do not assume a normal distribution.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip5c2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Model Assumptions"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip5c2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      observeEvent(
        input$snip5d1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Test Output"), ##### Change this one every time and text below
                               "The t-test itself gives a test-statistic value, called the t-value or just t, as can be seen in the 'Test Results' table. Paired with its degrees of freedom, or DF, which is calculated from the sample size, the t-test calculates a p-value. The p-value can be interpretted as 'the probability of observing our results or something more extreme if the null hympothesis is true'. So, the smaller the p-value, the less likely it is that the null hypothesis is true. We usually use a cut off of p<0.05 as the criteria to reject the null hypothesis.",
                               br(),
                               br(),
                               "In addition to the 'Test Results' table, there is an 'Estimates' table. Technically, the results in this table aren't part of the t-test, they're the estimates and confidence intervals we learned about previously. However, it's convention to report estimates and confidence intervals with the results of a test. So, we give those numbers in the 'Estimates' table below. These two tables are not tables that you would disseminate as is. However, results from both tables below will be combined and reported in the 'Tables and Figures for Publication.'",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip5d2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Test Output"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip5d2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(
        input$snip5e1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Tables and Figures for Publication"), ##### Change this one every time and text below
                               "...temp...",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip5e2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Tables and Figures for Publication"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip5e2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(input$snip5f1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
            
            br(),
            column(width = 12,
                   h3("Write up"),
                   "The Statistical Methods section of a paper should included everything another statistician would need 
           to reproduce your results, minus the data. It should also be written in a way that non-statistician 
           scientists or clinicians can read and understand well, even if they're not familiar with all of the statistical 
           methods you used. The balance between statistical completeness and accessibility to a general scientific audience 
           can be tricky to attain. It may be easiest to start with statistical completeness, then revise your draft for clarity 
           and conciseness without losing completeness along the way. Something similar could be said for the results section.",
           br(),
           br(),
           "You may use multiple statistical methods in the same paper or poster. Each one should be included in the statistical 
           methods section. For each method, you should include several things:",
           br(),
           br(),
           "1) The name of the method (be specific)",
           br(),
           "2) What you did with the method (could be written as what the method did)",
           br(),
           "3) The 'input parameters' or 'settings' used",
           br(),
           "4) The assumptions made and how they were evaluated, if they were",
           br(),
           "5) Possibly additional concerns addressed or steps taken (model selection, steps to correct distributional shape or functional form, etc.)",
           br(),
           br(),
           "Can you identify these pieces in the write up below?",
           br(),
           br(),
           em("The sample mean was calculated, as was a 95% confidence interval using the confidence interval method for normally-distributed means. The distributional assumption of normality was examined graphically using histograms."),
       br(),
       br(),
       "Many of the above statements about a methods write-up apply to the results write-up as well. In addition, one must be careful 
           to give results according to the journal's requirements. For instance, the number of decimal places required when reporting 
           different results can differ from journal to journal. Some journals require the reporting of the test statistic value 
           (the value for 't' in the 'Test Results' table above). These requirements should be available on the journal's website. Additionally, 
           one must pay attention to tables, figures, and the text of the results section. All of the results should be reported somewhere, 
           and should all be addressed in the statistical methods section. However, it's possible to leave some results out of the text and 
           just refer the reader to a table, especially when the results aren't of particular interest because they weren't statistically 
           significant or clinically relevant. For instance, one might write, '...all other comparisons did not achieve statistical significance 
           (all p > 0.05). See Table 3 for complete results.'",
       br(),
       br(),
       "There are several pieces that should be reported in a complete write-up of the results for a model or test. These are:",
       br(),
       br(),
       "1) One or more estimates (means, differences in means, proportions, percentages, odds ratios, etc.)",
       br(),
       "2) Confidence intervals for each estimate above (sometimes standard errors are substituted for confidence intervals)",
       br(),
       "3) P-values (sometimes accompanied by the associated test statistic value, such as a t/F/chi-square value) if a hypothesis test was used",
       br(),
       "4) A decision about the hypothesis (was/wasn't significant, reject/fail to reject the null hypothesis) if a hypothesis test was used",
       br(),
       br(),
       "Can you identify these components in the 'Example Results' write-up below?",
       br(),
       br(),
       em("The mean BMI in the control group was 31.56 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          30.6 kg/m",tags$sup("2")," to 32.52 kg/m",tags$sup("2"),". Our data were not consistent with our goal of 30 kg/m",tags$sup("2"),"or less, as our entire confidence interval was greater than 30 kg/m",tags$sup("2"),"."
          ),
       br(),
       br(),
            )
       
          )
        ))
      })
      
      observeEvent(input$snip5f2,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Write-Up"),
            tags$iframe(
              width="1280",
              height="720",
              src = "snip1f2.mp4",
              #src = "video6i.pdf",
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
            ),
            br(),
            br(),
            
          )
        ))
      })
      
      
      
      observeEvent(
        input$snip5g1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Saving your Work Reproducibly"), ##### Change this one every time and text below
                               "Always save your work, and do it in a reproducible way. This means that, if someone needed to reproduce your results, you could simply give them one or more files (that's what you're saving here) and tell them what analysis program or language or tool you used, and they'd be able to reproduce your results exactly. This is helpful if someone challenges your work or you get audited. It's also helpful if you leave an institution, corporation, or clinic and someone there needs to reproduce your results at some point. But it's probably most useful for you. There are any number of reasons you might need to reproduce your owwn results for yourself, such as when you need to pick up where you left off the last time you worked on your analysis.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip5g2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Saving your Work Reproducibly"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip1g2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      

      
      
    }
  )    
}
