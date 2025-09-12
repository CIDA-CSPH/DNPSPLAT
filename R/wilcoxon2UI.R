# Module UI function
wilcoxon2UI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(

    br(),
    
    
    
    
    
    
    
    
    ##################################################
    #   Hypotheses
    ####################################################
    column(12,style = " background-color: white; border-radius: 5px; ",
           
           br(),
           column(width=10,
                  h2("Hypotheses")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         #actionButton(ns("snip1a1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip1a2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                         ,tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
           column(12,
                  br(),
           "For a Wilcoxon Signed-Rank Test, the null hypothesis is that the distribution of the pairwise differences in the numeric outcome across the 
           two time points or replicates differs from 0 by a location shift of some hypothesized number \u03B8. The alternative hypothesis is that the 
           distribution of pairwise differences has some other location parameter not equal to \u03B8.",
           br(),
           br(),
           br()
           ),

           column(width=12,
                  br(),
           HTML(paste0(
             "Enter your null hypothesis H",tags$sub("0")," for the location parameter for the distribution of pairwise differences \u03B8:"
           )),
           br(),
           br(),
           numericInput(ns("nullDiff"),HTML(paste0("H",tags$sub("0"),": \u03B8 ="
           )),value=0),
           br()
           ),

          
    ),
    
    ## Break
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    
    
    
    
    
    
    
    ##################################################
    #   Data
    ####################################################
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           
           br(),
           column(width=10,
                  h2("Data")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         #actionButton(ns("snip1b1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip1b2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                         ,
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )
                  
           ),
           br(),
           br(),
           br(),
           


           column(width=12,
                  br(),
           "Example data are already loaded. To use your own data, enter the labels for your numeric outcome and your binary predictor here. 
           Then, click on 'Paste Data' to paste your data from Excel, click on 'Upload Data' to upload your data from Excel, or click 
           on 'Enter Data by Hand' to type in your data by hand.",
           br(),
           br(),
           br(),
           br(),
           ),
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
                                                column(width=12,
                                                       br(),
                                                       br(),
                                                       textInput(ns("outcomeLabel1"),"Enter Outcome Label",value="Body Mass Index"),
                                                       textInput(ns("predLabel1"),"Enter Predictor Label",value="Treatment Group"),
                                                       br(),
                                                       br(),
                                                ),
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
                                                                           ),
                                                                           column(6, 
                                                                                  style="background-color:white",
                                                                                  matrixInput(
                                                                                    
                                                                                    inputId = ns("matrix1b"),
                                                                                    label = "Enter Group 2 Name & Data",
                                                                                    value = matrix(c(31.80,
                                                                                                     29.82,
                                                                                                     25.94,
                                                                                                     27.61,
                                                                                                     29.97,
                                                                                                     28.28,
                                                                                                     25.19,
                                                                                                     26.70,
                                                                                                     26.79,
                                                                                                     24.46,
                                                                                                     27.36,
                                                                                                     24.68,
                                                                                                     24.72,
                                                                                                     25.89,
                                                                                                     24.04,
                                                                                                     30.30,
                                                                                                     30.72,
                                                                                                     25.75,
                                                                                                     25.17,
                                                                                                     25.66,
                                                                                                     27.80,
                                                                                                     27.82,
                                                                                                     25.08,
                                                                                                     28.11,
                                                                                                     27.24,
                                                                                                     27.32,
                                                                                                     32.44,
                                                                                                     28.84,
                                                                                                     29.88),ncol=1,nrow=29,dimnames=list(NULL,c("Treatment"))),
                                                                                    class = "numeric",
                                                                                    cols = list(
                                                                                      names = TRUE,
                                                                                      editableNames = TRUE
                                                                                    ),
                                                                                    rows = list(
                                                                                      names = FALSE,
                                                                                      extend=TRUE,
                                                                                      delta=1
                                                                                    )
                                                                                    #,
                                                                                    #cells = list(editableCells = FALSE)
                                                                                  ))
                                                                           
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
                                                "Enter your outcome and predictor labels. Then, enter your group names and paste numeric data below. Or, click on the 'Upload Data' tab to upload your data from Excel.",
                                                br(),
                                                br(),
                                                column(width=12,
                                                       br(),
                                                       br(),
                                                       textInput(ns("outcomeLabel2"),"Enter Outcome Label",value="Outcome Label"),
                                                       textInput(ns("predLabel2"),"Enter Predictor Label",value="Predictor Label"),
                                                       br(),
                                                       br(),
                                                ),
                                                br(),
                                                br(),
                                                column(12,
                                                column(6,
                                                       textInput(ns("label1a2"),"Enter Group 1 Label",value="Group 1"),
                                                       textAreaInput(ns("matrix1a2in"),"Paste a column of numeric data from Excel for group 1."),
                                                       br(),
                                                       br()
                                                       ),

                                                column(6,
                                                       textInput(ns("label1b2"),"Enter Group 2 Label",value="Group 2"),
                                                       textAreaInput(ns("matrix1b2in"),"Paste a column of numeric data from Excel for group 2."),
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
                                                               ),
                                                               column(6, 
                                                                      style="background-color:white",
                                                                      matrixInput(
                                                                        
                                                                        inputId = ns("matrix1b3"),
                                                                        label = "Group 2 Data",
                                                                        value = matrix(c(NA),ncol=1,
                                                                                       #nrow=31,
                                                                                       dimnames=list(NULL,c("Group 2"))),
                                                                        class = "numeric",
                                                                        cols = list(
                                                                          names = TRUE,
                                                                          editableNames = TRUE
                                                                        ),
                                                                        rows = list(
                                                                          names = FALSE,
                                                                          extend=TRUE,
                                                                          delta=1
                                                                        )
                                                                        #,
                                                                        #cells = list(editableCells = FALSE)
                                                                      ))
                                                               
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
                                                tags$a(href="wilcoxonTest2Data.xlsx",download="wilcoxonTest2Data.xlsx",
                                                       "Example Analysis File for Wilcoxon Signed-Rank Test",target="_blank"),
                                                br(),
                                                br(),
                                                "You can also use the Analysis file saved after using this tool previously. This is the tab named 'Analysis,' which contains your data in columns 'B' and 'C' in the reproducible file you downladed. The fact that you can upload that file and get the exact same results as you did then is what makes this reproducible research (see last section).",
                                                
                                                br(),
                                                br(),
                                                fileInput(ns("wilcoxonTest2Data"),"Enter data file location",accept=".xlsx"),
                                                br(),
                                                br(),

                                                bsCollapse(id="importedDataView",open="Data Preview",multiple=FALSE,
                                                        
                                                           bsCollapsePanel("View & Edit Full Data",
                                                                           column(width=12,
                                                                                  br(),
                                                                                  br(),
                                                                                  textInput(ns("outcomeLabel3"),"Enter Outcome Label",value="Outcome Label"),
                                                                                  textInput(ns("predLabel3"),"Enter Predictor Label",value="Predictor Label"),
                                                                                  br(),
                                                                                  br(),
                                                                           ),
                                                                           br(),
                                                                           br(),
                                                                           
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
                                                                           ),
                                                                           column(6, 
                                                                                  style="background-color:white",
                                                                                  matrixInput(
                                                                                    
                                                                                    inputId = ns("matrix1b2"),
                                                                                    label = "Uploaded Group 2 Name & Data",
                                                                                    value = matrix(c("",""),ncol=1,nrow=2,dimnames=list(NULL,c("Group 2"))),
                                                                                    class = "numeric",
                                                                                    cols = list(
                                                                                      names = TRUE,
                                                                                      editableNames = TRUE
                                                                                    ),
                                                                                    rows = list(
                                                                                      names = FALSE,
                                                                                      extend=TRUE,
                                                                                      delta=1
                                                                                    )
                                                                                    #,
                                                                                    #cells = list(editableCells = FALSE)
                                                                                  ))
                                                                           
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
                                                "Enter your variable labels, group names, and numeric data in the cells below. Or, click on the 'Upload Data' or 'Paste Data' tabs above to upload your data from Excel.",
                                                br(),
                                                br(),
                                                
                                                
                                                bsCollapse(id="dataByHandView",open="View & Edit Full Data",multiple=FALSE,
                                                       
                                                           bsCollapsePanel("View & Edit Full Data",
                                                                           column(width=12,
                                                                                  br(),
                                                                                  br(),
                                                                                  textInput(ns("outcomeLabel4"),"Enter Outcome Label",value="Outcome Label"),
                                                                                  textInput(ns("predLabel4"),"Enter Predictor Label",value="Predictor Label"),
                                                                                  br(),
                                                                                  br(),
                                                                           ),
                                                                           br(),
                                                                           br(),
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
                                                                           ),
                                                                           column(6, 
                                                                                  style="background-color:white",
                                                                                  matrixInput(
                                                                                    
                                                                                    inputId = ns("matrix1b4"),
                                                                                    label = "Enter Group 2 Name & Data",
                                                                                    value = matrix(c(NA,NA),
                                                                                                   ncol=1,nrow=2,dimnames=list(NULL,c("Group 2"))),
                                                                                    class = "numeric",
                                                                                    cols = list(
                                                                                      names = TRUE,
                                                                                      editableNames = TRUE
                                                                                    ),
                                                                                    rows = list(
                                                                                      names = FALSE,
                                                                                      extend=TRUE,
                                                                                      delta=1
                                                                                    )
                                                                                    #,
                                                                                    #cells = list(editableCells = FALSE)
                                                                                  ))
                                                                           
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
           
    ),
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
        
    
    
    
    
    column(12, style = "background-color: white; border-radius: 5px; ",
           br(),
           column(width=10,
                  h2("Test Output")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         #actionButton(ns("snip1d1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip1d2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                         ,tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
           
           #h2("Test Output"),
           #br(),
          column(width=12,
           br(),
           "Estimates and test output are given in tabular form below. These are for you to use when conducting the test, not for publication. The next section gives tables and figures for publication.",
           h3("Estimates"),
           tableOutput(ns("wilcoxonTest21")),
           br(),
           h3("Test Results"),
           tableOutput(ns("wilcoxonTest22")),
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
           column(width=12,
                  h2("Tables and Figures for Publication")),
           #column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
           #       column(width=6,h4(style="color:#818e9f;", "Learn:")),
           #       column(width=4,
           #              #actionButton(ns("snip1e1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
           #              #actionButton(ns("snip1e2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
           #              #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
           #              tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;"),
           #              tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
           #              
           #       )
           #       
           #),
           br(),
           br(),
           br(),
           

           column(width=12,
                  br(),
                  "The following table is a publication-worthy way to display your results. 
       The figure below is one way to graphically display your results. For an interpretation and write up of these results, see the next section.",

       br(),
           br(),
           br(),
       column(12,
       h4(textOutput(ns("wilcoxonTest2TableTitle"))),
       #br(),
           tableOutput(ns("wilcoxonTest2Table")),
     
           br(),
           br(),
       br(),
       br(),
       br(),
           plotOutput(ns("forestPlot"),inline=TRUE),
       br(),
       br()
       ),
       br(),
       br(),
       column(12,
      # h3("Plot Options"),
      # br(),
      # "The following controls can be used to set the options for your plot.",
      # br(),
      # br(),
       
       bsCollapse(id="plotOptions",open="Panel 1",
                 # bsCollapsePanel("Hide Plot Options",
                 #                 ""
                 #            ),
                  bsCollapsePanel("Show Plot Options",
                                  column(4, style = "background-color: white; border-radius: 5px; ",
                                         textInput(ns("chartTitle"),"Enter Chart Title",value="Body Mass Index by Treatment Group"),
                                         textInput(ns("subTitle"),"Enter Chart Sub-Title",value="Medians and 95% Confidence Intervals"),
                                         numericInput(ns("widthSelect"),"Enter the Chart Width",value="500"),
                                         numericInput(ns("heightSelect"),"Enter the Chart Height",value="600"),
                                  ),
                                  column(4, style = "background-color: white; border-radius: 5px; ",
                                         textInput(ns("xLab"),"Enter X-Axis Label",value="Treatment Group"),
                                         textInput(ns("yLab"),"Enter Y-Axis Label",value="Body Mass Index"),
                                         numericInput(ns("titleSize"),"Enter Title Size",value="20"),
                                         numericInput(ns("textSize"),"Enter Text Size",value="15"),
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
       
      
       ),
       
       
       
       

       
       
       
       
       
       
           br(),
       br()
    )),
    
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
                  #actionButton(ns("snip1f1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                  #actionButton(ns("snip1f2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                  #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                  tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  ,tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )

                                    ),
           br(),
           br(),
           br(),
           
           column(width=12,
           h3("Example Methods"),

           "The following is an EXAMPLE of what one might write about this test in the methods section of a paper. 
       This example uses the BMI data and test present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way. THIS IS ONLY AN EXAMPLE. You must write your own methods and results.",
           br(),
           br(),
           em("After examining the distribution of pairwise BMI change from pre- to post- intervention using a histogram, a parametric test was ruled out 
              in favor of a Wilcoxon signed-rank test, which was used to test for non-zero pre-post BMI changes. In addition, the pseudo-median pairwise change 
              was estimated, along with a 95% confidence interval."),
           br(),
           br(),
           h3("Example Results"),
           "The following is an example of what one might write about the results of this test in the results section of a paper. This example uses the BMI data and test present when this page loads. Refresh this page to see it again if you've changed anything along the way. THIS IS ONLY AN EXAMPLE. You must write your own methods and results.",
           br(),
           br(),
           em("Median BMI pre-intervention was 31.22 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          29.77 kg/m",tags$sup("2")," to 32.28 kg/m",tags$sup("2"),". Median BMI post-intervention was 
          27.32 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          25.75 kg/m",tags$sup("2")," to 28.28 kg/m",tags$sup("2"),". BMI differed significantly from pre- to post-intervention (p<0.0001), 
              as the pseudo-median pairwise change was 4.02 kg/m",tags$sup("2"),", with a 95% confidence interval of 3.98 kg/m",tags$sup("2")," to 4.06 kg/m",tags$sup("2"),"."),

       br(),
       br()
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
    
    
    
    
    
    
    
    
    
    ##################################################
    #   Save reproducible work
    ####################################################
    column(12, style = " background-color: white; border-radius: 5px; ",
           
           br(),
           column(width=10,
                  h2("Save Reproducible Work")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip1g1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         actionButton(ns("snip1g2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )
                  
           ),
           br(),
           br(),
           br(),
           column(width=12,
                  br(),
           "This analysis tool saves files in a reproducible way in an Excel file with multiple sheets. Each time you save your results, it creates an Excel sheet that contains your data 
           and the information needed to run the analysis again if you input the file again. It also creates a sheet that contains all of the non-graphical output from your analysis, as well 
           as information about the analysis tool itself. Click the link below to download your reproducible analysis file and your results:",
           br(),
           br(),
           
       #    tags$a(href=paste0(tempdir(), "/", "2SampTTestOut.xlsx"),download="2SampTTestOut.xlsx",
       #           "Download Reproducible Analysis and Output Files.",target="_blank"),
           downloadButton(ns("downloadData"),"Download Reproducible Analysis File & Results"),
br(),
br()
           ),
           br(),
           br(),
           br()
    ),
    
    
  )
  
  
  

  
  
  
  
}




#################################################################################
#################################################################################
##
##    Server starts here
##
#################################################################################
#################################################################################


wilcoxon2Server <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      version<-reactive({
        1.1
      })
      
      snipsServer("snips")
      ###############################################################
      #   Data Work
      ###############################################################

      matrix1a2inReactive <- eventReactive(input$matrix1a2in, {
        req(input$matrix1a2in)
        input$matrix1a2in
      })
      
      matrix1b2inReactive <- eventReactive(input$matrix1b2in, {
        req(input$matrix1b2in)
        input$matrix1b2in
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
      
      observe({
        matrix1b1<-matrix1b2inReactive()
        matrix1b1b<-matrix(scan(text=matrix1b1),ncol=1)
        matrix1b2<-as.numeric(matrix1b1b)
        matrix1b3<-matrix(matrix1b2,ncol=1)
        matrix1b4<-na.omit(matrix1b3)
        colnames(matrix1b4)<-input$label1b2
        updateMatrixInput(session,"matrix1b3",matrix1b4)
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
          req(input$matrix1b4)
          matrix1a<-input$matrix1a4
          matrix1b<-input$matrix1b4
        }
        matrix1a
      })
      
     
      
      matrix1b <- reactive({
        #req(Dat1ab())
        #mat<-Dat1ab()
        #if(ncol(mat)<3) return(NULL)
        #mat1<-as.matrix(mat[,3],ncol=1)
        #if(!is.numeric(mat1)) return(NULL)
        #colnames(mat1)<-colnames(mat)[3]
        mat<-Dat1ab()
        if(ncol(mat)<3){
          mat<-matrix(c(-99,-99,-99,-99),ncol=2,nrow=2)
          colnames(mat)<-c("Too Few Columns Present.","Too few columns present.")
          mat1<-as.matrix(mat[,2],ncol=1)
        } 
        if(ncol(mat)>=3){
          mat1<-as.matrix(mat[,3],ncol=1)
          if(!is.numeric(mat1)){
            mat1<-matrix(c(-99,-99),ncol=1)
            colnames(mat1)<-"Non-numeric data in column 3."
          }
          if(is.numeric(mat1)){
            colnames(mat1)<-colnames(mat)[3]
          }
          
        } 
        if(input$dataInput==1){
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          req(input$matrix1b3)
          matrix1b<-input$matrix1b3
        }
        if(input$dataInput==3){
          matrix1b<-na.omit(mat1)
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          req(input$matrix1b4)
          matrix1a<-input$matrix1a4
          matrix1b<-input$matrix1b4
        }
        matrix1b
      })
      
      
      dat<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          req(input$matrix1b3)
          matrix1a<-input$matrix1a3
          matrix1b<-input$matrix1b3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          req(input$matrix1b4)
          matrix1a<-input$matrix1a4
          matrix1b<-input$matrix1b4
        }
        
        #dat0<-as.matrix(matrix1In)
        dat0a<-as.matrix(matrix1a)
        dat0b<-as.matrix(matrix1b)
        
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        #colNames1[]<-"ColName1"
        
        colNames2<-vector(length=length(na.omit(dat0b)))
        colNames2[]<-colnames(matrix1b)
        #colNames2[]<-"ColName2"
        
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        matrix1b1<-cbind(na.omit(dat0b),colNames2)
        
        matrix1_2<-na.omit(rbind(matrix1b1,matrix1a1))
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
        
      })
      
      dat1<-reactive({
        
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          req(input$matrix1b3)
          matrix1a<-input$matrix1a3
          matrix1b<-input$matrix1b3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          req(input$matrix1b4)
          matrix1a<-input$matrix1a4
          matrix1b<-input$matrix1b4
        }
        
        dat0a<-as.matrix(matrix1a)
        
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        
        matrix1_2<-na.omit(matrix1a1)
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
        
      })
      
      dat2<-reactive({
        
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          req(input$matrix1b3)
          matrix1a<-input$matrix1a3
          matrix1b<-input$matrix1b3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          req(input$matrix1b4)
          matrix1a<-input$matrix1a4
          matrix1b<-input$matrix1b4
        }
        
        dat0b<-as.matrix(matrix1b)
        
        colNames1<-vector(length=length(na.omit(dat0b)))
        colNames1[]<-colnames(matrix1b)
        
        matrix1b1<-cbind(na.omit(dat0b),colNames1)
        
        matrix1_2<-na.omit(matrix1b1)
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
        
      })
      
      
      
      
      outcomeLabel<-reactive({
        if(input$dataInput==1){
          outcomeLabel<-input$outcomeLabel1
          predLabel<-input$predLabel1
        }
        if(input$dataInput==2){
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        outcomeLabel
      })
      
      predLabel<-reactive({
        if(input$dataInput==1){
          outcomeLabel<-input$outcomeLabel1
          predLabel<-input$predLabel1
        }
        if(input$dataInput==2){
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        predLabel
      })
      
      
      selectedWidth<-reactive({
        input$widthSelect
      })
      
      selectedHeight<-reactive({
        input$heightSelect
      })
      
      

   
   
   
   
   
      
      wilcoxonTest2Table1<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          req(input$matrix1b3)
          matrix1a<-input$matrix1a3
          matrix1b<-input$matrix1b3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          req(input$matrix1b4)
          matrix1a<-input$matrix1a4
          matrix1b<-input$matrix1b4
        }
        
        #dat0<-as.matrix(matrix1In)
        dat0a<-as.matrix(matrix1a)
        dat0b<-as.matrix(matrix1b)
        
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        #colNames1[]<-"ColName1"
        
        colNames2<-vector(length=length(na.omit(dat0b)))
        colNames2[]<-colnames(matrix1b)
        #colNames2[]<-"ColName2"
        
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        matrix1b1<-cbind(na.omit(dat0b),colNames2)
        
        matrix1_2<-na.omit(rbind(matrix1b1,matrix1a1))

        med1<-median(matrix1a)
        med2<-median(matrix1b)
        #deltaXBar<-xBar2-xBar1
        
        #se1<-sd(matrix1a)/sqrt(length(matrix1a))
        #se2<-sd(matrix1b)/sqrt(length(matrix1b))
        #seDelta<-se1+se2
        
        df1<-length(matrix1a)-1
        df2<-length(matrix1b)-1
        
        medCI1<-MedianCI(matrix1a,sides="two.sided")
        medCI2<-MedianCI(matrix1b,sides="two.sided")
        wilcoxTest<-wilcox.test(matrix1a,matrix1b,mu=input$nullDiff,paired=TRUE,conf.int=TRUE)
        deltaMed<-wilcoxTest$estimate
        
        lcl1<-medCI1[2]
        ucl1<-medCI1[3]
        lcl2<-medCI2[2]
        ucl2<-medCI2[3]
        lclDelta<-wilcoxTest$conf.int[1]
        uclDelta<-wilcoxTest$conf.int[2]
        
       #a<-c(1,2,3,4,5,6,7,8,9,10)
       #b<-c(4,5,6,7,8,9,10,11,12,13)
       #wilcoxTest<-wilcox.test(a,b,mu=0,paired=FALSE,conf.int=TRUE)
       #medCI1<-MedianCI(a,sides="two.sided")
       #medCI2<-MedianCI(b,sides="two.sided")
        
        #sp<-sqrt(
        #  (df1*sd(matrix1a)^2 + df2*sd(matrix1b)^2)/(df1 + df2)
        #)
        #
        #t<-(
        #  deltaXBar - input$nullDiff
        #)/(
        #  sp*sqrt(1/length(matrix1a)+1/length(matrix1b))
        #)
        
        #p2Tail<-pt(q=abs(t),df=df1+df2,lower.tail=FALSE)*2
        #pValue<-ifelse(p2Tail<0.0001,"<0.0001",round(p2Tail,digits=4))
        
        #tTest<-t.test(Outcome~Group,data=dat(),mu=input$nullDiff)
        pValue<-ifelse(wilcoxTest$p.value<0.0001,"<0.0001",round(wilcoxTest$p.value,digits=4))
        
        Results<-data.frame("Outcome"=paste(outcomeLabel()),"Group 1"=paste(round(med1,digits=2)," (",round(lcl1,digits=2),", ",round(ucl1,digits=2),")",sep=""),
                            "Group 2"=paste(round(med2,digits=2)," (",round(lcl2,digits=2),", ",round(ucl2,digits=2),")",sep=""),
                            "Pseudo-Median Difference"=paste(round(deltaMed,digits=2)," (",round(lclDelta,digits=2),", ",round(uclDelta,digits=2),")",sep=""),
                            #"t-Value"=round(t,digits=2),
                            "p-Value"=pValue
        )
        colnames(Results)<-c("Outcome",paste(colnames(matrix1a)," Median (95% CI)",sep=""),paste(colnames(matrix1b)," Median (95% CI)",sep=""),"Pseudo-Median Difference (95% CI)",
                             #"t-Value",
                             "p-Value")
        
        Results
        
      })
      
      output$wilcoxonTest2Table<-renderTable({
        #req(Dat1ab())
        wilcoxonTest2Table1()
      })
      

      output$wilcoxonTest2TableTitle<-renderText({
        paste("Table 1.",outcomeLabel(),"by",predLabel())
      })
      
      wilcoxonTest21a<-reactive({

        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          req(input$matrix1b3)
          matrix1a<-input$matrix1a3
          matrix1b<-input$matrix1b3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          req(input$matrix1b4)
          matrix1a<-input$matrix1a4
          matrix1b<-input$matrix1b4
        }
        
        #dat0<-as.matrix(matrix1In)
        dat0a<-as.matrix(matrix1a)
        dat0b<-as.matrix(matrix1b)
        
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        #colNames1[]<-"ColName1"
        
        colNames2<-vector(length=length(na.omit(dat0b)))
        colNames2[]<-colnames(matrix1b)
        #colNames2[]<-"ColName2"
        
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        matrix1b1<-cbind(na.omit(dat0b),colNames2)
        
        matrix1_2<-na.omit(rbind(matrix1b1,matrix1a1))
        
        med1<-median(matrix1a)
        med2<-median(matrix1b)
        
        medCI1<-MedianCI(matrix1a,sides="two.sided")
        medCI2<-MedianCI(matrix1b,sides="two.sided")
        wilcoxTest<-wilcox.test(matrix1a,matrix1b,mu=input$nullDiff,paired=TRUE,conf.int=TRUE)
        deltaMed<-wilcoxTest$estimate
        
        lcl1<-medCI1[2]
        ucl1<-medCI1[3]
        lcl2<-medCI2[2]
        ucl2<-medCI2[3]
        lclDelta<-wilcoxTest$conf.int[1]
        uclDelta<-wilcoxTest$conf.int[2]
    
        pValue<-ifelse(wilcoxTest$p.value<0.0001,"<0.0001",round(wilcoxTest$p.value,digits=4))

        
        data.frame("Group"=c(colNames1[1],colNames2[1],"Change"),"Estimate"=c(med1,med2,deltaMed),"Lower"=c(lcl1,lcl2,lclDelta),"Upper"=c(ucl1,ucl2,uclDelta))
      })
      
      output$wilcoxonTest21<-renderTable({
        wilcoxonTest21a()
      })
      
      wilcoxonTest22a<-reactive({
        if(input$dataInput==3) req(Dat1ab())
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          req(input$matrix1b3)
          matrix1a<-input$matrix1a3
          matrix1b<-input$matrix1b3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          req(input$matrix1b4)
          matrix1a<-input$matrix1a4
          matrix1b<-input$matrix1b4
        }
        
        #dat0<-as.matrix(matrix1In)
        dat0a<-as.matrix(matrix1a)
        dat0b<-as.matrix(matrix1b)
        
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        #colNames1[]<-"ColName1"
        
        colNames2<-vector(length=length(na.omit(dat0b)))
        colNames2[]<-colnames(matrix1b)
        #colNames2[]<-"ColName2"
        
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        matrix1b1<-cbind(na.omit(dat0b),colNames2)
        
        matrix1_2<-na.omit(rbind(matrix1b1,matrix1a1))
        
        med1<-median(matrix1a)
        med2<-median(matrix1b)
        
        medCI1<-MedianCI(matrix1a,sides="two.sided")
        medCI2<-MedianCI(matrix1b,sides="two.sided")
        wilcoxTest<-wilcox.test(matrix1a,matrix1b,mu=input$nullDiff,paired=TRUE,conf.int=TRUE)
        deltaMed<-wilcoxTest$estimate
        
        lcl1<-medCI1[2]
        ucl1<-medCI1[3]
        lcl2<-medCI2[2]
        ucl2<-medCI2[3]
        lclDelta<-wilcoxTest$conf.int[1]
        uclDelta<-wilcoxTest$conf.int[2]
        
        pValue<-ifelse(wilcoxTest$p.value<0.0001,"<0.0001",round(wilcoxTest$p.value,digits=4))
      #data.frame("Method"=wilcoxTest$method,"Test Stat"=wilcoxTest$statistic,"DF"=wilcoxTest$parameter,"p-Value"=pValue)
        data.frame("Method"=wilcoxTest$method,"W"=wilcoxTest$statistic,"p-Value"=pValue)
      })
      
      output$wilcoxonTest22<-renderTable({
        wilcoxonTest22a()
      })
      
      
      forestPlot1<-reactive({
        if(input$dataInput==3) req(Dat1ab())
        
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          req(input$matrix1a3)
          req(input$matrix1b3)
          matrix1a<-input$matrix1a3
          matrix1b<-input$matrix1b3
        }
        if(input$dataInput==3){
          req(Dat1ab())
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        if(input$dataInput==4){
          req(input$matrix1a4)
          req(input$matrix1b4)
          matrix1a<-input$matrix1a4
          matrix1b<-input$matrix1b4
        }
        
        #dat0<-as.matrix(matrix1In)
        dat0a<-as.matrix(matrix1a)
        dat0b<-as.matrix(matrix1b)
        
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        #colNames1[]<-"ColName1"
        
        colNames2<-vector(length=length(na.omit(dat0b)))
        colNames2[]<-colnames(matrix1b)
        #colNames2[]<-"ColName2"
        
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        matrix1b1<-cbind(na.omit(dat0b),colNames2)
        
        matrix1_2<-na.omit(rbind(matrix1b1,matrix1a1))
        
        
        medCI1<-MedianCI(matrix1a,sides="two.sided")
        medCI2<-MedianCI(matrix1b,sides="two.sided")
        wilcoxTest<-wilcox.test(matrix1a,matrix1b,mu=input$nullDiff,paired=FALSE,conf.int=TRUE)
        deltaMed<-wilcoxTest$estimate
        
        med1<-medCI1[1]
        lcl1<-medCI1[2]
        ucl1<-medCI1[3]
        med2<-medCI2[1]
        lcl2<-medCI2[2]
        ucl2<-medCI2[3]
        lclDelta<-wilcoxTest$conf.int[1]
        uclDelta<-wilcoxTest$conf.int[2]

        
        plotUpper<-max(c(ucl1,ucl2))+0.1*abs(ucl1-ucl2)
        plotLower<-min(c(lcl1,lcl2))-0.1*abs(ucl1-ucl2)
        
        dat2<-data.frame("Index"=c(1,2),"Estimate"=c(med1,med2),
                         "lcl"=c(lcl1,lcl2),"ucl"=c(ucl1,ucl2),
                         "Group"=c(colnames(matrix1a),colnames(matrix1b)))
        
        dat2$Group <- as.character(dat2$Group)
        dat2$Group <- factor(dat2$Group, levels=unique(dat2$Group))
        #ggplot(dat1(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + ylab("Count")
        
        plot<-ggplot(dat2,aes(y=Estimate,x=Group)) +
          geom_point(shape = 18, size = input$lineSize+3) +  
          geom_segment(aes(x = Group, y = lcl, xend = Group, yend = ucl),size=input$lineSize)+
          #geom_errorbarh(aes(xmin = lcl, xmax = ucl), height = 0.25) +
          #geom_vline(xintercept = 0, color = "red", linetype = "dashed", cex = 1, alpha = 0.5) +
          #scale_y_continuous(name = "", breaks=1:4, labels = dat$label, trans = "reverse") +
          ggtitle(input$chartTitle,subtitle=input$subTitle)+
          xlab(input$xLab)+
          ylab(input$yLab)+
          
          #xlim(c(0,3))+ 
          scale_x_discrete(name = input$xLab, labels = c(colnames(matrix1a),colnames(matrix1b)))+#, trans = "reverse") +
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
                axis.text.x.bottom = element_text(size = input$textSize, colour = "black"),
                axis.text.x=element_text(angle=input$axisTextAngle),
                axis.title.x = element_text(size = input$textSize, colour = "black"),
                axis.title.y = element_text(size = input$textSize, colour = "black"),
                plot.title = element_text(size=input$titleSize, colour="black",hjust=0.5),
                plot.subtitle = element_text(size=input$titleSize-4, colour="black",hjust=0.5))
        
        if(input$useLimits !=  "Use default y-axis limits"){
          plot+ylim(c(input$yMin,input$yMax))
        }else{
          plot
        }

              })
      
      
      
      forestHeight<-reactive({
        input$forestHeight  
      })
      
      forestWidth<-reactive({
        input$forestWidth 
      })
      
      
      
      output$forestPlot<-renderPlot({
        forestPlot1()
      },width=reactive({
        selectedWidth()}),
      height=reactive({
        selectedHeight()}))
      


      
  
  
  output$downloadData<-downloadHandler(filename=function(){
    paste0(tempdir(), "/", "wilcoxonTest2Out.xlsx")
  },
  content=function(file){
     #observe({
       if(input$dataInput==1){
         matrix1a<-input$matrix1a
         matrix1b<-input$matrix1b
       }
    if(input$dataInput==2){   
      req(input$matrix1a3)
      req(input$matrix1b3)
      matrix1a<-input$matrix1a3
      matrix1b<-input$matrix1b3
    }
       if(input$dataInput==3){
         matrix1a<-input$matrix1a2
         matrix1b<-input$matrix1b2
       }
    if(input$dataInput==4){   
      req(input$matrix1a4)
      req(input$matrix1b4)
      matrix1a<-input$matrix1a4
      matrix1b<-input$matrix1b4
    }

        wb = createWorkbook()
      
        sheet = addWorksheet(wb, "Analysis",gridLines = FALSE)
        
        headStyle<-createStyle(border = "TopBottom", borderColour ='black', borderStyle="thick",textDecoration = "bold")
        bottomStyle<-createStyle(border="Bottom",borderStyle="thick")
        boldStyle<-createStyle(textDecoration = "bold")

        
        col1<-matrix(c("Wilcoxon Signed-Rank Test","",
                       "Outcome Label:",outcomeLabel(),"",
                       "Predictor Label:",predLabel(),"",
                       "Null Hypothesis:",input$nullDiff,"",
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
                       "Plot Y-Axis Min:",input$yMin,""),ncol=1)
        colnames(col1)<-"Tool:"
        #matrix1a<-input$matrix1a
        #matrix1b<-input$matrix1b
        writeData(wb,sheet=sheet,x=as.data.frame(col1), startCol=1, rowNames=FALSE)
        writeData(wb,sheet=sheet,x=as.data.frame(matrix1a), startCol=2, rowNames=FALSE)
        writeData(wb,sheet=sheet,x=as.data.frame(matrix1b), startCol=3, rowNames=FALSE)
        setColWidths(wb,sheet,cols=1,widths = "auto")
        
        sheet = addWorksheet(wb, "Tabular Output",gridLines = FALSE)
        
        
        header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny"),ncol=1)
        colnames(header)<-"General Information"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header), startCol=1, startRow=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        header2<-matrix(c("Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus"),ncol=1)
        colnames(header2)<-"Creator"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header2), startCol=1, startRow=8, rowNames=FALSE)
        
        header3<-matrix(c("Wilcoxon Signed-Rank Test","Core R Packages and Functions: MedianCI {DescTools}; wilcox.test{stats}; ggplot{ggplot2}"),ncol=1)
        colnames(header3)<-"Tool"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header3), startCol=1, startRow=15, rowNames=FALSE)
        
        
        #header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny","","Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus","","","Tool: Wilcoxon Signed-Rank Test","Core R Packages and Functions: MedianCI {DescTools}; wilcox.test{stats}; ggplot{ggplot2}"),ncol=1)
        #colnames(header)<-"General Information"
        #
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)

        wilcoxonTest21a<-wilcoxonTest21a()
        wilcoxonTest22a<-wilcoxonTest22a()      
        
        a<-c("Test Output","","","","")
        b<-c("","","","","")
        c<-c("Estimates:","","","","")
        c2<-colnames(wilcoxonTest21a)
        d<-c("Test Results:","","","","")
        e<-matrix(c(colnames(wilcoxonTest22a),""),nrow=1)
        
     #   colnames(wilcoxonTest11a)<-NULL
     #   colnames(wilcoxonTest12a)<-NULL
        
      #  wilcoxonTest12a<-matrix(c(wilcoxonTest12a,""),nrow=1)
#
      #  #col6<-rbind(a,b,c,c2,ttest1a,b,d,e,ttest2a)
      #  col6<-rbind(a,b,c,c2,matrix(wilcoxonTest11a[1,],nrow=1),matrix(wilcoxonTest11a[2,],nrow=1),matrix(wilcoxonTest11a[3,],nrow=1),b,d,e,matrix(wilcoxonTest12a,nrow=1))
      #  #col6<-rbind(a,b,c,c2,b,d,e)
      #  #col6<-rbind(a,b,c,b,d)
      #  colnames(col6)<-b
        
        writeData(wb,sheet=sheet,x="Test Output", startCol=6, startRow=1, rowNames=FALSE,colNames=FALSE)
        writeData(wb,sheet=sheet,x="Estimates:", startCol=6, startRow=3, rowNames=FALSE,colNames=FALSE)
        writeData(wb,sheet=sheet,x=wilcoxonTest21a, startCol=6, startRow=4, rowNames=FALSE,colNames=TRUE)
        writeData(wb,sheet=sheet,x="Test Results:", startCol=6, startRow=9, rowNames=FALSE,colNames=FALSE)
        writeData(wb,sheet=sheet,x=wilcoxonTest22a, startCol=6, startRow=10, rowNames=FALSE,colNames=TRUE)
        
        
        table<-wilcoxonTest2Table1()
        a<-c("Table for Publication","","","","")
        b<-c("","","","","")
        c<-colnames(table)
        d<-table
        colnames(d)<-NULL
        
        col12<-rbind(a,b,c,d)
        writeData(wb,sheet=sheet,x=as.data.frame(col12), startCol=12, rowNames=FALSE,colNames=FALSE)
        
        setColWidths(wb,sheet,cols=c(1:256),widths = "auto")
        
        sheet = addWorksheet(wb, "Plot Output",gridLines = FALSE)

          forestPlot <- forestPlot1()
          
          forestHeight<-selectedHeight()
          forestWidth<-selectedWidth()
          
          png(paste0(tempdir(), "/", "forestPlot.png"), width=forestWidth*4, height=forestHeight*4, units="px", res=300)
          #png(paste0(tempdir(), "/", "forestPlot.png"), res=300)
          print(forestPlot)
          dev.off()  
          insertImage(wb, sheet=sheet, paste0(tempdir(), "/", "forestPlot.png"), startRow=5, startCol=2,width=forestWidth*4, height=forestHeight*4, units="px")
          #insertImage(wb, sheet=sheet, paste0(tempdir(), "/", "forestPlot.png"), startRow=5, startCol=11)        
          
          writeData(wb,sheet=sheet,x="Figure for Publication", startCol=2, startRow=2, rowNames=FALSE,colNames=FALSE)
        
        #sheet = createSheet(wb, paste(substr(outcomeLabel(), 1, 3),substr(predLabel(),1,3)," Output ",date(),sep=''))
        
        #addDataFrame(dataframe3, sheet=sheet, startColumn=1, row.names=FALSE)
        
          #saveWorkbook(wb, "2SampTTestOut.xlsx",overwrite=TRUE)
          #saveWorkbook(wb, paste0(tempdir(), "/", "2SampTTestOut.xlsx"),overwrite=TRUE)
          saveWorkbook(wb, file,overwrite=TRUE)
        #saveWorkbook(wb, "My_File.xlsx")
        
        #wb
        
      })
      
      
      
      
      
     
      Dat1ab <- reactiveVal()
      #Dat1a <- reactiveVal()
      #Dat1b <- reactiveVal()
      
      observeEvent(input[["wilcoxonTest2Data"]], {
        xlfile <- input[["wilcoxonTest2Data"]][["datapath"]]
        ext <- tolower(tools::file_ext(xlfile))
        if(ext == "xlsx") {
          sheets <- excel_sheets(xlfile)
          if(length(sheets) == 1L) {
            Dat1ab(read_xlsx(input[["wilcoxonTest2Data"]][["datapath"]], sheet = 1L))
            #Dat1a(read_xlsx(input[["tTestData"]][["datapath"]], sheet = 1L,range=cell_cols(1)))
            #Dat1b(read_xlsx(input[["tTestData"]][["datapath"]], sheet = 1L,range=cell_cols(2)))
          } else {
            inputSweetAlert(
              session,
              inputId = "sheet",
              title = "Select the Analysis Worksheet (the one with your data in columns B and C)",
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
        if(read_xlsx(input[["wilcoxonTest2Data"]][["datapath"]], sheet = input[["sheet"]])[1,1] != "Wilcoxon Signed-Rank Test"){
          sendSweetAlert(
            session,
            title = "Incorrect File",
            text = "Not a Wilcoxon Signed-Rank Test Analysis File. Please upload an analysis file compatible with the Wilcoxon Signed-Rank Test Tool.",
            type = "error",
            btn_colors="#5f5f62"
          )
        }else{
          Dat1ab(read_xlsx(input[["wilcoxonTest2Data"]][["datapath"]], sheet = input[["sheet"]]))
          dat<-Dat1ab()
          options<-as.matrix(dat[,1])
          matrix1a<-as.matrix(dat[,2])
          matrix1b<-as.matrix(dat[,3])
          if(!is.numeric(matrix1a) | !is.numeric(matrix1b)){
            sendSweetAlert(
              session,
              title = "Non-Numeric Data",
              text = "Non-numeric data present in columns B and/or C of uploaded file. These columns must only include numeric data, aside from row 1, which contains column labels and can contain character data.",
              type = "error",
              btn_colors="#5f5f62"
            )
          }else{
          updateMatrixInput(session,"matrix1a2",value=matrix1a)
          updateMatrixInput(session,"matrix1b2",value=matrix1b)
          matrix1a2Short<-matrix(matrix1a[1:4],ncol=1)
          colnames(matrix1a2Short)<-colnames(matrix1a)
          updateMatrixInput(session,"matrix1a2Short",value=matrix1a2Short)
          matrix1b2Short<-matrix(matrix1b[1:4],ncol=1)
          colnames(matrix1b2Short)<-colnames(matrix1b)
          updateMatrixInput(session,"matrix1b2Short",value=matrix1b2Short)
          updateTextInput(session,"outcomeLabel3",value=options[4])
          updateTextInput(session,"predLabel3",value=options[7])
          updateNumericInput(session,"nullDiff",value=options[10])
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
        }
      })
          
      
      
      
      
      
      observeEvent(input[["matrix1a"]], {
        matrix1a<-input$matrix1a
        matrix1aShort<-matrix(matrix1a[1:4],ncol=1)
        colnames(matrix1aShort)<-colnames(matrix1a)
        updateMatrixInput(session,"matrix1aShort",value=matrix1aShort)
      })
      
      observeEvent(input[["matrix1b"]], {
        matrix1b<-input$matrix1b
        matrix1bShort<-matrix(matrix1b[1:4],ncol=1)
        colnames(matrix1bShort)<-colnames(matrix1b)
        updateMatrixInput(session,"matrix1bShort",value=matrix1bShort)
      })
      
      
      
      observeEvent(input[["matrix1a3"]], {
        matrix1a3<-input$matrix1a3
        matrix1aShort3<-matrix(matrix1a3[1:4],ncol=1)
        colnames(matrix1aShort3)<-colnames(matrix1a3)
        updateMatrixInput(session,"matrix1aShort3",value=matrix1aShort3)
      })
      
      observeEvent(input[["matrix1b3"]], {
        matrix1b3<-input$matrix1b3
        matrix1bShort3<-matrix(matrix1b3[1:4],ncol=1)
        colnames(matrix1bShort3)<-colnames(matrix1b3)
        updateMatrixInput(session,"matrix1bShort3",value=matrix1bShort3)
      })

      
      
      output[["loadedData"]] <- renderTable({
        req(Dat1ab())
        Dat1ab()
      })
      
      
      
      
      
      
      
      ########################################################
      ##    T-Test Snips
      ########################################################
      
      observeEvent(
        input$snip1a1,{ showModal(modalDialog( tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), column(width = 12,
                                                                                                                                                                      h3("Hypotheses"),
                                                                                                                                                                      HTML(paste0(
                                                                                                                                                                        "The standard null hypothesis H",tags$sub("0")," for a two-sample t-test is that the two means  \u03BC",tags$sub("1")," and \u03BC",tags$sub("2")," (the population means for the two groups) are equal in the population, meaning  \u03BC",tags$sub("1")," = \u03BC",tags$sub("2"),". Stated differently, the standard null hypothesis is that the difference between the two population means is zero, or \u03BC",tags$sub("2")," - \u03BC",tags$sub("1")," = 0. Of course, this doesn't mean that the two SAMPLE means will be equal, even if the null hypothesis is true, due to sampling variability. The question is, are the sample means different enough, given the data, that we can reject the null hypothesis at some level of statistical significance, usually 0.05? And, while the null hypothesis is usually that the population means are equal, or, equivalently, that the difference between the population means is 0, we can decide to use a different value for the null hypothesis if it makes sense to do so. For instance, if we're looking at getting a new car, we may not care that it has exactly the same fuel economy as our old car, because it has other nice features that our old car did not. But, we may not want its fuel economy to drop more than 5 miles per gallon compared to our old car. We could test this difference of 5 mpg with a sufficient sample of each kind of car. Obviously, this might not be practical for a consumer, but may be practical for an automaker.",
                                                                                                                                                                        br(),
                                                                                                                                                                        br(),
                                                                                                                                                                        "The standard null hypothesis for a paired t-test is that the mean change between time points or replicates \u0394\u03BC for a given person or experimental unit is 0 in the population. The associated alternative hypothesis is that the population mean change is not equal to 0. However, under circumstances similar to those above, we might want to use different null and alternative hypotheses that test whether the mean change is no greater than or no less than some value.",
                                                                                                                                                                        br(),
                                                                                                                                                                        br(),
                                                                                                                                                                        "Note that the correct way to interpret \u03BC",tags$sub("2")," - \u03BC",tags$sub("1")," from the two-sample t-test is the 'difference in means', while the correct way to interpret \u0394\u03BC from the paired t-test is the 'mean difference'."
                                                                                                                                                                        
                                                                                                                                                                      )),
                                                                                                                                                                      br(), br() ) ) )) })
      observeEvent(
        input$snip1a2,{showModal(modalDialog(tags$div(style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                                                      h3("Hypotheses"), tags$iframe(width="600", height="400",
                                                                                    src = "snip1a2.mp4",
                                                                                    #src = "video6i.pdf",
                                                                                    frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      observeEvent(
        input$snip1b1,{ ##### Change this one every time
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
        input$snip1b2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height:  450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Data"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip1b2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      observeEvent(
        input$snip1c1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Model Assumptions"), ##### Change this one every time and text below
                               "T-tests require that several assumptions be met to perform optimally. These include:", br(),br(),
                               "1) Independence of observations (partial or complete; see below)", br(),
                               "2) Normality of the outcome", br(),
                               "3) Equal variances/standard deviations in the two groups (only for Student's 2-sample t-test; see below)", br(),
                               h4("Independence of Observations"),
                               "A two-sample t-test assumes that all observations are independent of each other. A paired t-test assumes that all observations at a given time point or replicate are independent of each other, but allows for correlation between the two observations at the two time points/replicate values sampled on the same individual/experimental unit. So, a two-sample t-test assumes complete independence of observations, while a paired t-test allows partial correlation (lack of independence) in a structured, particular way. To do this, the paired t-testt needs to 'know' which observations come from the same person/experimental unit. In our case, it assumes the first observation given in the first column comes from the same person/experimental unit as the first observation given in the second column, etc. So make sure your observations are ordered the same in both columns with respect to person/experimental unit. The inclusion of a Subject ID column is recommended so you can remember and track this, though the ID column isn't actually used by our paired t-test tool. For the two-sample t-test, none of this is true--it doesn't 'care' about order in the two columns.",
                               h4("Normality of the Outcome"),
                               "A two-sample t-test also assumes that the sample means for the two groups are normally distributed, though the distributions for the two means can have different population means (and possibly different standard deviations; see below). The paired t-test assumes that the sample mean of the paired differences is normally distributed. One way for these sample means to be normally distributed is for the actually outcome in the sample to be normally distributed. In such a case, sample size doesn't matter (when it comes to normality). You can see histograms of the outcome values in the sample in the left column of the sample below. Another way for these sample means to be normally distributed is for the sample size to be large. According to the Central Limit Theorem, the distribution of the sample mean gets closer and closer to normal as the sample size increases, EVEN IF THE OUTCOME VALUES THEMSELVES AREN'T NORMALLY DISTRIBUTED. You can learn more about the Central Limit Theorem by taking a look at our 'Normality and the Central Limit Theorem' tool. In the columns of histograms on the t-test pages, the column on the right is what needs to be normal for the two-sample t-test, and the plot on the bottom right is what needs to be normal for the paired t-test.", br(), br(),
                               "There are tests for normality, but we don't use them here. We just examine the distributions with the histograms. This is because tests for normality further risk type I and type II errors, and are often underpowered. Additionally, t-tests are known to perform fairly well, even when the assumption of normality is violated. However, for gross departures from normality, one can turn to a non-parametric test as an alternative, or dichotomize or categorize your outcomes and use a contingency table test. The non-parametric equivalent of the two-sample t-test is the Wilcoxon rank-sum test, also known as the Mann-Whitney test, as it assumes your two groups are independent. The non-parametric equivalend of the paired t-test is the Wilcoxon signed-rank test, as it allows for paired/correlated observations at the two time points/replicate values. If you dichotomize your data and use a contingence table, you would use a chi-square or Fisher's exact test instead of a two-sample t-test, or a McNemar's test instead of a paired t-test.",
                               h4("Equality of Variances"),
                               "Equality of variances, equivalent to equality of standard deviations, is not relevant to a paired t-test, as it is effectively a one-sample t-test on the paired differences. Thus, there is only one variances or standard deviation to worry about. For a two-sample t-test, there is a variance for each of the two groups, so we could have two unequal variances. Student's t-test in its original form assumes equal variances in the two populations. Welch's t-test, also known as the unequal variances t-test, does not assume equal variances in the two groups. The t-test used here is Welch's t-test. While there are ways to test for equality of variances, those tests are not used here. This is because a test for equality of variances, like a test for normality or any other hypothesis test, risks both type I and type II errors, meaning there's some probability of incorrectly assuming equal variances. Additionally, Welch's t-test performs better than Student's t-test with unequal variances AND performs nearly as well as Student's t-test when the variances are equal. Because of this, we recommend against testing for equality of variances and recommend the use of Welch's t-test instead of Student's t-test in all cases. Note that Welch's t-test retains the other assumptions listed above.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip1c2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Model Assumptions"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip1c2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      observeEvent(
        input$snip1d1,{ ##### Change this one every time
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
        input$snip1d2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height:  450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Test Output"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip1d2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      observeEvent(
        input$snip1e1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Tables and Figures for Publication"), ##### Change this one every time and text below
                               "...temp...",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip1e2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height:  450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Tables and Figures for Publication"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip1e2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      observeEvent(input$snip1f1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
            
            br(),
            column(width = 12,
                   h3("Write up"),
                   "The Statistical Methods section of a paper should included everything another statistician would need 
           to reproduce your results, minus the data. It should also be written in a way that non-statistician 
           scientists or clinicians can read and understand well, even if they're not familiar with all of the statistical 
           methods you used. The balance between statistical completeness and accessib8ility to a general sientific audience 
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
           em("An unequal-variances (Welch's) t-test compared mean BMI in the treatment group to that of 
       the control group using a two-tailed type I error rate of \u03B1 = 0.05. The distributional assumption of 
       normality was examined graphically using histograms."),
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
       "3) P-values (sometimes accompanied by the associated test statistic value, such as a t/F/chi-square value)",
       br(),
       "4) A decision about the hypothesis (was/wasn't significant, reject/fail to reject the null hypothesis)",
       br(),
       br(),
       "Can you identify these components in the 'Example Results' write-up below?",
       br(),
       br(),
       em("The mean BMI in the control group was 31.56 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          30.6 kg/m",tags$sup("2")," to 32.52 kg/m",tags$sup("2"),". In the treatment group, the mean was
          27.83 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          26.83 kg/m",tags$sup("2")," to 28.82 kg/m",tags$sup("2"),". Mean BMI differed significantly between the 
          two groups (p<0.0001), as the treatment group mean was 3.73 kg/m",tags$sup("2")," lower than the control 
          group mean, with a 95% confidence interval of 1.82 kg/m",tags$sup("2")," lower to 5.64 kg/m",tags$sup("2")," lower."),
       br(),
       br(),
            )
       
          )
        ))
      })
      
      observeEvent(input$snip1f2,{
        showModal(modalDialog(
          tags$div(
            style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
            h3("Write-Up"),
            tags$iframe(
              width="600",
              height="400",
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
        input$snip1g1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Saving your Work Reproducibly"), ##### Change this one every time and text below
                               "Always save your work, and do it in a reproducible way. This means that, if someone needed to reproduce your results, you could simply give them one or more files (that's what you're saving here) and tell them what analysis program or language or tool you used, and they'd be able to reproduce your results exactly. This is helpful if someone challenges your work or you get audited. It's also helpful if you leave an institution, corporation, or clinic and someone there needs to reproduce your results at some point. But it's probably most useful for you. There are any number of reasons you might need to reproduce your owwn results for yourself, such as when you need to pick up where you left off the last time you worked on your analysis.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip1g2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height:  450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Saving your Work Reproducibly"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip1g2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
  
      
      
            
      
      
      
      
    }
  )    
}
