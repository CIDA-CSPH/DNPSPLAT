# Module UI function
mcnemarsUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           
           br(),
           column(width=10,
                  h2("Hypotheses")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;"#, "Learn:"
                                    )),
                  column(width=4,
                         #actionButton(ns("snip2a1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip2a2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
           column(12,
                  strong("McNemar's Test for Paired Data"),
                  br(),
                  br(),
                  "The null hypothesis for McNemar's test is called marginal homogeneity. Unlike our t-test tools, our McNemar's test tool does not allow you to adjust the null hypothesis.",
                  br(),
                  br(),
                  div(style="background-color: #e8f4f8; padding: 10px; border-radius: 5px; border-left: 4px solid #17a2b8;",
                      strong("IMPORTANT - Data Entry Format:"),
                      br(),
                      "McNemar's test requires a 2×2 table of ", strong("paired observations"), ", NOT marginal totals.",
                      br(),
                      br(),
                      "Your 2×2 matrix should show:",
                      br(),
                      div(style="font-family: monospace; margin: 10px;",
                          "                Post-Yes  Post-No", br(),
                          "Pre-Yes     |    a    |    b    |", br(),
                          "Pre-No      |    c    |    d    |", br()
                      ),
                      "Where:", br(),
                      "• a = people who were Yes both before AND after", br(),
                      "• b = people who were Yes before but No after", br(), 
                      "• c = people who were No before but Yes after", br(),
                      "• d = people who were No both before AND after", br(),
                      br(),
                      strong("All entries must be non-negative whole numbers.")
                  ),
                  br(),
                  br()
           ),
           br(),
           br()
           
    ),
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           h2("Data"),
           br(),
           "Enter the labels for your variables and your data below.",
           br(),
           br(),
           textInput(ns("outcomeLabel"),"Enter Outcome Label",value="Disease Status"),
           textInput(ns("predLabel"),"Enter Time/Replicate Variable Label",value="Time Point"),
           textInput(ns("pred1"),"Enter First Time/Replicate Label",value="Pre-Intervention"),
           textInput(ns("pred2"),"Enter Second Time/Replicate Label",value="Post-Intervention"),
           textInput(ns("outcome1"),"Enter Event Label",value="Disease"),
           textInput(ns("outcome2"),"Enter Non-Event Label",value="No Disease"),
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
                                                "These are simulated data and don't represent real world observations.",
                                                br(),
                                                br(),
                                                column(6, 
                                                                                          style="background-color: white",
                                                       #h4("renderText(ns('predLab'))"),
                                                       #br(),
                                                       #br(),
                                                       #h4("renderText(ns('outcomedLab'))"),
                                                                                          matrixInput(
                                                                                            inputId = ns("matrix1a"),
                                                                                            label = NULL,
                                                                                            value = matrix(
                                                                                              c(22,2,10,6),
                                                                                              ncol=2,
                                                                                              nrow=2,
                                                                                              dimnames=list(
                                                                                                c("Disease","No Disease"),
                                                                                                c("Disease","No Disease")
                                                                                                )
                                                                                              ),
                                                                                            class = "numeric",
                                                                                            cols = list(
                                                                                              names = TRUE,
                                                                                              extend=FALSE,
                                                                                              editableNames = TRUE
                                                                                              ),
                                                                                            rows = list(
                                                                                              names = TRUE,
                                                                                              extend=FALSE,
                                                                                              editableNames = TRUE,
                                                                                              delta=1
                                                                                              )#,
                                                                                            #cells = list(editableCells = FALSE)
                                                                                            )
                                                                                          ),
                                                column(6,
                                                      div(style="color: #6c757d; font-size: 0.9em; margin-top: 10px;",
                                                          icon("info-circle"), 
                                                          strong(" Example explanation:"), br(),
                                                          "• Top-left (22): Had disease both before AND after", br(),
                                                          "• Top-right (2): Had disease before, NOT after", br(),
                                                          "• Bottom-left (10): NO disease before, HAD disease after", br(),
                                                          "• Bottom-right (6): NO disease both before AND after"
                                                      )
                                                ),
                                                                                  
                                                br(),
                                      
                                         br(),
                                  
                                                br(),
                                                
                                         ),
                                       ),
                                       br()
                                       
                              ),
                              
                              tabPanel("Paste Data",value=2,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Paste Data"),
                                                "Paste variable labels and values below. Or, click on Upload Data to upload from Excel.",
                                                br(),
                                                br(),
                                                column(6, 
                                                       style="background-color: white",
                                                       #h4("renderText(ns('predLab'))"),
                                                       #br(),
                                                       #br(),
                                                       #h4("renderText(ns('outcomedLab'))"),
                                                       matrixInput(
                                                         inputId = ns("matrix1a2"),
                                                         label = NULL,
                                                         value = matrix(
                                                           c(22,2,10,6),
                                                           ncol=2,
                                                           nrow=2,
                                                           dimnames=list(
                                                             c("Disease","No Disease"),
                                                             c("Disease","No Disease")
                                                           )
                                                         ),
                                                         class = "numeric",
                                                         cols = list(
                                                           names = TRUE,
                                                           extend=FALSE,
                                                           editableNames = TRUE
                                                         ),
                                                         rows = list(
                                                           names = TRUE,
                                                           extend=FALSE,
                                                           editableNames = TRUE,
                                                           delta=1
                                                         )#,
                                                         #cells = list(editableCells = FALSE)
                                                       )
                                                ),
                                                column(6,br()),
                                                
                                                br(),
                                                
                                                br(),
                                                
                                                br(),
                                                
                                         ),
                                       ),
                                       br()
                                       
                              ),
                              
                              tabPanel("Upload Data",value=3,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                
                                                column(12,
                                                       h3("Upload Data"),
                                                       "Upload your Analysis File below. You can download an example Analysis File to see its formatting by clicking this link:",
                                                       br(),
                                                       br(),
                                                       tags$a(href="mcnemarsAnalysisFileExample.xlsx",download="mcnemarsAnalysisFileExample.xlsx",
                                                              "Example Analysis File for McNemar's Test",target="_blank"),
                                                       br(),
                                                       br(),
                                                       "You can also use the Analysis file saved after using this tool previously. This is the tab named 'Analysis' in the reproducible file you downloaded. The fact that you can upload that file and get the exact same results as you did then is what makes this reproducible research (see last section).",
                                                       
                                                       br(),
                                                       br(),
                                                       
                                                       fileInput(ns("mcnemarsData"),"Enter data file location",accept=".xlsx"),
                                                       br(),
                                                       
                                                       
                                                       
                                                       br()
                                                ),
                                                
                                                h3("Data Read"),

                                                column(6, 
                                                       style="background-color: white",
                                                       #h4("renderText(ns('predLab'))"),
                                                       #br(),
                                                       #br(),
                                                       #h4("renderText(ns('outcomedLab'))"),
                                                       matrixInput(
                                                         inputId = ns("matrix1a3"),
                                                         label = NULL,
                                                         value = matrix(
                                                           c(22,2,10,6),
                                                           ncol=2,
                                                           nrow=2,
                                                           dimnames=list(
                                                             c("Disease","No Disease"),
                                                             c("Disease","No Disease")
                                                           )
                                                         ),
                                                         class = "numeric",
                                                         cols = list(
                                                           names = TRUE,
                                                           extend=FALSE,
                                                           editableNames = TRUE
                                                         ),
                                                         rows = list(
                                                           names = TRUE,
                                                           extend=FALSE,
                                                           editableNames = TRUE,
                                                           delta=1
                                                         )#,
                                                         #cells = list(editableCells = FALSE)
                                                       )
                                                ),
                                                column(6,br()),
                                                
                                                br(),
                                                
                                                br(),
                                                
                                                br(),

                                                
                                         ),
                                       ),
                                       br()
                                       
                              ),
                              
                              
                              tabPanel("Enter Data by Hand",value=4,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Enter Data by Hand"),
                                                "Enter variable labels and values below.",
                                                br(),
                                                br(),
                                                column(6, 
                                                       style="background-color: white",
                                                       #h4("renderText(ns('predLab'))"),
                                                       #br(),
                                                       #br(),
                                                       #h4("renderText(ns('outcomedLab'))"),
                                                       matrixInput(
                                                         inputId = ns("matrix1a4"),
                                                         label = NULL,
                                                         value = matrix(
                                                           c(22,2,10,6),
                                                           ncol=2,
                                                           nrow=2,
                                                           dimnames=list(
                                                             c("Disease","No Disease"),
                                                             c("Disease","No Disease")
                                                           )
                                                         ),
                                                         class = "numeric",
                                                         cols = list(
                                                           names = TRUE,
                                                           extend=FALSE,
                                                           editableNames = TRUE
                                                         ),
                                                         rows = list(
                                                           names = TRUE,
                                                           extend=FALSE,
                                                           editableNames = TRUE,
                                                           delta=1
                                                         )#,
                                                         #cells = list(editableCells = FALSE)
                                                       )
                                                ),
                                                column(6,br()),
                                                
                                                br(),
                                                
                                                br(),
                                                
                                                br(),
                                                
                                         ),
                                       ),
                                       br()
                                       
                              ),
                              
                            #  tabPanel("Paste Data",
                            #           style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                            #           br(),
                            #           fluidPage(
                            #             column(12,style = " background-color: white; border-radius: 5px; ",
                            #                    h3("Data Entry by Pasting"),
                            #                    "Enter your group names and paste your data (values separated by spaces) in the cells below.",
                            #                    br(),
                            #                    br(),
                            #                    column(6, 
                            #                           style="background-color: white",
                            #                           textInput(ns("group1Name"),"Enter Group 1 Name",value="Control"),
                            #                           textInput(ns("group1Data"),"Enter Group 1 Data",value="35.74 33.84 29.99 31.75 34.09 32.28 29.16 30.77 30.61 28.49 31.29 28.55 28.70 29.94 28.09 34.38 34.81 29.70 29.09 29.77 31.90 31.82 29.20 32.04 31.22 31.12 36.50 32.89 37.40")
                            #                    ),
                            #                    column(6, 
                            #                           style="background-color: white",
                            #                           textInput(ns("group2Name"),"Enter Group 2 Name",value="Treatment"),
                            #                           textInput(ns("group2Data"),"Enter Group 2 Data",value="31.80 29.82 25.94 27.61 29.97 28.28 25.19 26.70 26.79 24.46 27.36 24.68 24.72 25.89 24.04 30.30 30.72 25.75 25.17 25.66 27.80 27.82 25.08 28.11 27.24 27.32 32.44 28.84 29.88 33.29 33.97")
                            #                    ),
                            #                    br()
                            #             ),
                            #             br()
                            #           ),
                            #           br()
                            #           
                            #  )
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
                         actionButton(ns("snip2d1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip2d2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
           
           #h2("Test Output"),
           #br(),
           column(width=12,
                  
                  br(),
                  "Estimates and test output are given in tabular form below. These are for you to use when conducting the test, not for publication. The next section gives tables and figures for publication.",
                  br(),

           h4("Estimates"),
           tableOutput(ns("propTable")),
           br(),
           br(),
           h3("Test Results"),
           tableOutput(ns("testTable")),
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
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip2e1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip2e2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;"),
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                         
                  )
                  
           ),
           br(),
           br(),
           br(),
           
           
           column(width=12,
           br(),
           h3("Results Table"),
           "You can include a comparison estimate in your 
           results table. This can either be an odds ratio or a risk ratio. Pick an option below",
           br(),
           br(),
           radioButtons(
             inputId=ns("estType"),
             label=NULL,
             choiceNames = c("Odds Ratio & 95% CI","Risk Ratio & 95% CI"),
             choiceValues=c(1,2),
             selected = 1,
             inline = FALSE,
             width = NULL
           ),
           br(),
           h4(textOutput(ns("reultsTableTitle"))),
           br(),
           tableOutput(ns("resultsTable")),
           br(),
           br(),
           "Click on the 'Learn:' buttons above and to the right for information about graphical representations of your results.",
           br(),
           br(),
           br(),
           
           plotOutput(ns("stackedPlot"),inline=TRUE),
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
                                                    textInput(ns("chartTitle"),"Enter Chart Title",value="Disease Status by Treatment Group"),
                                                    textInput(ns("subTitle"),"Enter Chart Sub-Title",value="Stacked Treatment Group Percentages"),
                                                    numericInput(ns("widthSelect"),"Enter the Chart Width",value="500"),
                                                    numericInput(ns("heightSelect"),"Enter the Chart Height",value="600"),
                                                    selectInput(
                                                      ns("palette"),
                                                      label="Select a color palette for your plot.",
                                                      choices=c(
                                                        "Accent",
                                                        "Spectral",
                                                        "Dark2",
                                                        "Greys",
                                                        "Purples",
                                                        "Oranges",
                                                        "Greens",
                                                        "Blues",
                                                        "Reds",
                                                        "Set1",
                                                        "Set2",
                                                        "Set3",
                                                        "Pastel1",
                                                        "Pastel2",
                                                        "Pastel3",
                                                        "PuBu",
                                                        "BuPu",
                                                        "RdYlGn",
                                                        "RdYlBu",
                                                        "PuOr",
                                                        "PRGn",
                                                        "PiYG",
                                                        "BrBG"
                                                      ),
                                                      selected = "BuPu",
                                                      multiple = FALSE,
                                                      selectize = TRUE,
                                                      width = NULL,
                                                      size = NULL
                                                    )
                                             ),
                                             column(4, style = "background-color: white; border-radius: 5px; ",
                                                    textInput(ns("xLab"),"Enter X-Axis Label",value="Treatment Group"),
                                                    textInput(ns("yLab"),"Enter Y-Axis Label",value="Percentage of Treatment Group"),
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
           
           
           
           )),
    
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           br(),
           column(width=10,
                  h2("Write Up")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip2f1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         actionButton(ns("snip2f2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )
                  
           ),
           br(),
           br(),
           br(),
           column(width=12,
           "Because there are many possible analytic scenarios that depend on the numbers of rows and columns in your table, your write-up may differ substantially from the example given here, which pertains to the data and results present when the page is first loaded.",
           h3("Methods"),
           em("A McNemar's test was used to test the association between treatment (pre/post) and disease status for statistical significance. Odds ratios and Wald 95% confidence intervals were also calculated."),
           br(),
           br(),
           h3("Results"),
           em("After the study period, 16 of 40 (40%) treatment group patients were disease free, while 8 of 32 (20%) control group patients were disease-free. This was a statistically-significant treament effect (p=0.043), as the odds of being disease-free in the treatment group were 2.67 times the odds of being disease-free in the control group (OR: 2.67; 95% CI: 0.98 to 7.25)."),
           
           
           br(),
           br(),
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
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           br(),
           column(width=10,
                  h2("Save Reproducible Work")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip2g1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         actionButton(ns("snip2g2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
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
           and the information needed to run the analysis again if you input the information in the first tab again. It also creates a sheet that contains all of the non-graphical output from your analysis, as well 
           as information about the analysis tool itself. Click the link below to download your reproducible analysis file and your results:",
           br(),
           br(),
           downloadButton(ns("downloadData"),"Download Reproducible Analysis File & Results"),
           br(),
           br()
           #actionButton(ns("do"), "Click Me"),
           
           ),
    ),
    
    
    
    
    
    
    
    
    
    
    
    
    
  )
  
  
  
  
  
  
  
  
}









mcnemarsServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      version<-reactive({
        1.1
      })
      
      outcomeLab<-reactive({
        input$outcomeLabel
      })
      
      predLab<-reactive({
        input$predLabel
      })
      
      dat<-reactive({
        if(input$dataInput==1){
          
        }
        matrix1a<-input$matrix1a
        matrix1b<-input$matrix1b
        
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
        
        matrix1a<-input$matrix1a
        
        dat0a<-as.matrix(matrix1a)
        
        colNames1<-vector(length=length(na.omit(dat0a)))
        colNames1[]<-colnames(matrix1a)
        
        matrix1a1<-cbind(na.omit(dat0a),colNames1)
        
        matrix1_2<-na.omit(matrix1a1)
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
        
      })
      
      dat2<-reactive({
        
        matrix1b<-input$matrix1b
        
        dat0b<-as.matrix(matrix1b)
        
        colNames1<-vector(length=length(na.omit(dat0b)))
        colNames1[]<-colnames(matrix1b)
        
        matrix1b1<-cbind(na.omit(dat0b),colNames1)
        
        matrix1_2<-na.omit(matrix1b1)
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
        
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
      
      p1<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
        }
        # Validate matrix entries before McNemar's test
        if (any(matrix1a < 0)) {
          stop("Error: All matrix entries must be non-negative. McNemar's test requires counts of paired observations, not differences or negative values.")
        }
        if (any(!is.finite(matrix1a))) {
          stop("Error: All matrix entries must be finite numbers.")
        }
        if (any(matrix1a != round(matrix1a))) {
          stop("Error: All matrix entries must be whole numbers (counts of observations).")
        }
        
        test <- mcnemar.test(matrix1a)
        test$p.value
      })
      
      testTable1<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
        }
        
        test<-mcnemar.test(x=matrix1a)
        
        pValue<-pValue<-ifelse(test$p.value<0.0001,"<0.0001",round(test$p.value,digits=4))
        
        results<-data.frame("Test"=test$method,"Chi-Squared"=test$statistic,"DF"=test$parameter,"P-Value"=pValue)
        colnames(results)<-c("Test","Chi-Squared","DF","P-Value")
        results
      
      })
      
      output$testTable<-renderTable({
        testTable1()
      })
      
      
      contTable<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
        }
        row1<-c(matrix1a[1,1]+matrix1a[1,2],matrix1a[1,1]+matrix1a[2,1])
        row2<-c(matrix1a[2,1]+matrix1a[2,2],matrix1a[1,2]+matrix1a[2,2])
        table<-rbind(row1,row2)
        colnames(table)<-c(input$pred1,input$pred2)
        rownames(table)<-c(input$outcome1,input$outcome2)
        table
      })
      
      
      
      
      
      
      
      
      propTable1<-reactive({
        #tbl1<-table(stack(input$matrix1a)[2:1] )
        dat<-contTable()
        tableOut<-dat
        tbl1<-prop.table(dat,margin=2)*100
        for(j in 1:(ncol(dat))){
          for(k in 1:(nrow(dat))){
            tableOut[k,j]<-paste(dat[k,j]," (",round(tbl1[k,j],digits=2),"%)",sep="")
          }
        }
        
        tableOut
      })
      
      output$propTable<-renderTable({
        propTable1()
      },rownames=TRUE,colnames=TRUE)
      
      resultsTable1<-reactive({
        dat<-contTable()
        tableOut<-rbind("",cbind("","",dat,""))
        tbl1<-prop.table(contTable(),margin=2)*100
        oddsRatios<-matrix(nrow=nrow(tbl1),ncol=1)
        oddsRatios[]<-(tbl1[,ncol(tbl1)]/100 / (1-tbl1[,ncol(tbl1)]/100)) / (tbl1[,1]/100 / (1-tbl1[,1]/100))
        riskRatios<-matrix(nrow=nrow(tbl1),ncol=1)
        riskRatios[]<-(tbl1[,ncol(tbl1)]/100) / (tbl1[,1]/100)
        seLogRR<-matrix(ncol=1,nrow=nrow(dat))
        upperRR<-matrix(ncol=1,nrow=nrow(dat))
        lowerRR<-matrix(ncol=1,nrow=nrow(dat))
        for(j in 1:nrow(dat)){
          seLogRR[j]<-sqrt( sum(dat[-j,2])/(dat[j,2]*sum(dat[,2])) + sum(dat[-j,1])/(dat[j,1]*sum(dat[,1]))  )
        }
        upperRR<-exp(log(riskRatios)+1.96*seLogRR)
        lowerRR<-exp(log(riskRatios)-1.96*seLogRR)
        seLogOR<-matrix(ncol=1,nrow=nrow(dat))
        upperOR<-matrix(ncol=1,nrow=nrow(dat))
        lowerOR<-matrix(ncol=1,nrow=nrow(dat))
        for(j in 1:nrow(dat)){
          seLogOR[j]<-sqrt( 1/dat[j,1] + 1/dat[j,2] + 1/(sum(dat[-j,1])) + 1/(sum(dat[-j,2])) )
        }
        upperOR<-exp(log(oddsRatios)+1.96*seLogOR)
        lowerOR<-exp(log(oddsRatios)-1.96*seLogOR)
        for(j in 3:(ncol(dat)+2)){
          for(k in 2:(nrow(dat)+1)){
            tableOut[k,j]<-paste(dat[k-1,j-2]," (",round(tbl1[k-1,j-2],digits=2),"%)",sep="")
          }
        }
        tableOut[1,1]<-input$outcomeLabel
        tableOut[-1,2]<-rownames(dat)
        tableOut[1,ncol(tableOut)]<-pvalue(p1())
       
        
        colnames(tableOut)<-c("Outcome","Category",colnames(dat),"p-Value")

          if(input$estType==1){
            tableOut<-cbind(tableOut[,-ncol(tableOut)],c("",paste(round(oddsRatios,digits=2)," (",round(lowerOR,digits=2),", ",round(upperOR,digits=2),")",sep="")),tableOut[,ncol(tableOut)])
            colnames(tableOut)<-c("Outcome","Category",colnames(dat),"Odds Ratio (95% CI)","p-Value")
          }
          if(input$estType==2){
            tableOut<-cbind(tableOut[,-ncol(tableOut)],c("",paste(round(riskRatios,digits=2)," (",round(lowerRR,digits=2),", ",round(upperRR,digits=2),")",sep="")),tableOut[,ncol(tableOut)])
            colnames(tableOut)<-c("Outcome","Category",colnames(dat),"Risk Ratio (95% CI)","p-Value")
          }

        tableOut
      })
      
      
      output$resultsTable<-renderTable({
        resultsTable1()
      },rownames=FALSE,colnames=TRUE)
      
      
      
      
      
      
      
      observeEvent(
        input$snip2a1,{ showModal(modalDialog( tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), column(width = 12,
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
        input$snip2a2,{showModal(modalDialog(tags$div(style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                                                      h3("Hypotheses"), tags$iframe(width="1280", height="720",
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
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Data"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip1b2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(
        input$snip2c1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Model Assumptions"), ##### Change this one every time and text below
                               
                               
                               
                               "Contingency table tests require that several assumptions be met to perform optimally. These include:", br(),br(),
                               "1) Independence of observations (partial or complete; see below)", br(),
                               "2) Categorical outcome (binomial or multinomial distribution)", br(),
                               "3) Categorical predictor (binary or nominal data scale)", br(),
                               "4) Sufficient sample size/cell counts (chi-square and McNemar's, but not Fisher's)",
                               h4("Independence of Observations"),
                               "Chi-square and Fisher's exact test assume that all observations are independent of each other. A McNemar's 
                               test assumes that all observations at a given time point or replicate are independent of each other, 
                               but allows for correlation between the two observations at the two time points/replicate values sampled on 
                               the same individual/experimental unit. So, chi-square and Fisher's assume complete independence of observations, 
                               while McNemar's allows partial correlation (lack of independence) in a structured, particular way. 
                               To do this, McNemar's test needs to 'know' which observations come from the same person/experimental unit. 
                               This is reflected in the structure of the table under 'Data' under the 'McNemar's Test' tab.",
                               h4("Distribution of the Outcome"),
                               "As long as the outcome and predictor data are categorical of some type and there aren't additional 
                               considerations that would suggest a more complicated model like logistic regression or a generalized 
                               linear mixed model (considerations like additional repeated measures beyond two time points/replicates, 
                               the desire to control for multiple predictors, etc.), we use these tests. We don't test for distributions 
                               or examine them with histograms as we do with other tests.",
                               h4("Sample Size and Expected Cell Counts"),
                               "The chi-square test and McNemar's test but make asymptotic distributional assumptions for their test statistic, a quantity that works in the background to calculate the p-value. In both cases, the test statistic that gives us our p-value approximates a chi-square distribution more and more closesly as the expected cell counts get large and when the null hypothesis is true. In fact, it does this quite well. Conventionally, we use these tests if all of our expected cell counts are five or greater. If any expected cell counts are less than five, we worry that our asymptotic distributional assumptions my no longer hold, and we switch to the Fisher's exact test, which has no test statistic and makes no asymptotic distributional assumptions. Thus, it is considered non-parametric and works for small samples where the chi-square test's asymptotic assumptions are likely violated. You can also use Fisher's exact test for larger cell counts, but it can take a long time for a computer to finish the calculations. In that case, the chi-square test is likely fine. The one probalematic situation is that in which you have a table with a large sample size, likely distributed over many rows and columns, but one or a few cells have very low cell counts. In this case, we don't want to use a chi-square test due to the small cell counts, but Fisher's exact test will take a long time to run, because there's a large sample size distributed over the big table. In that case, you should consult a statistician, as there are simulation-based options that aren't available here.",
                               "You can examine the distributional assumptions by looking at the expected cell counts table here. Then, pick which test you need directly below that table.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip2c2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Model Assumptions"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip2c2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      observeEvent(
        input$snip2d1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Test Output"), ##### Change this one every time and text below
                               h4("Chi-square and McNemar's Test"), 
                               "The chi-square test itself gives a test-statistic value, called the chi-square value or just chi-square, as can be seen in the 'Test Results' 
                               table if you've chosen the chi-square test. McNemar's  test does the same. Paired with its degrees of freedom, or DF, which is calculated from the sample size, 
                               the chi-square or McNemar's test calculates a p-value. The p-value can be interpretted as 'the probability of observing our results or something 
                               more extreme if the null hympothesis is true'. So, the smaller the p-value, the less likely it is that the null hypothesis is true. 
                               We usually use a cut off of p<0.05 as the criteria to reject the null hypothesis.",
                               br(),
                               br(),
                               h3("Fisher's Exact Test"), 
                               "All of this still applies if you've chosen Fisher's 
                               exact test, except you won't see a test statistic or degrees of freedom. This is because Fisher's exact test does not involve a test statistic, 
                               and calculates p-values directly from the hyper greometric distribution.",
                               br(),
                               br(),
                               "In addition to the 'Test Results' table, there is an 'Estimates' table. Technically, the results in this table 
                               aren't part of the test, they're the estimates we learned about previously. However, it's convention to report 
                               estimates and with the results of a test. So, we give those numbers in the 'Estimates' table below.",
                               br(),
                               br(), 
                               "These two tables are not tables that you would disseminate as is. However, results from both tables below will 
                               be combined and reported in the 'Tables and Figures for Publication.'",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip2d2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Test Output"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip2d2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(
        input$snip2e1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Tables and Figures for Publication"), ##### Change this one every time and text below
                               "If your frequency table has two columns, you can include a comparison estimate in your 
           results table. This can either be an odds ratio or a risk ratio. 95% confidence intervals will be added
           to the odds ratios and risk ratios if you've selected a chi-squared test. Confidence intervals will not be added if
           you've selected a Fisher's exact test. This is because the confidence intervals we use here, like the chi-squared test
           itself, are based on the assumption that none of the cells counts are too small. If your expected cell counts are too small
           for a chi-squared test, they're likely too small for the types of confidence intervals we use here. These confidence intervals 
           are called Wald confidence intervals. Neither odds ratios, risk ratios, nor confidence intervals will be displayed if your table has more that two columns, as many possible combinations are then possible for comparison. Speak with a statistician if you'd like help with one of these possible comparisons.",
           br(),
           br(),
           "There are many ways to graphically display your results. The option you choose will likely depend on how many rows and columns you have in your table and what your clinical question of interest is. You may want to use a forest plot for odds ratios or rate ratios with 95% confidence intervals. Another option would be a stacked bar chart with one bar per column. We shy away from pie charts because humans perceive length or distance, as in bar charts and forest plots, better than they perceive area or angle, as in a bar chart. Because there are many graphical options that depend on your situation, we have not included a 'default' option here. it will probablly be easiest for you to create your own graph in Excel or a similar program.",
           
           
           br(), br() ) ) )) })
      observeEvent(
        input$snip2e2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Tables and Figures for Publication"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip1e2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(input$snip2f1,{
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
           em("After expected cell counts were examined to ensure that model assumptions were met, a chi-squared test was used to test the association between treatment group and disease status for statistical significance. Odds ratios and Wald 95% confidence intervals were also calculated."),
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
           em("After the study period, 16 of 40 (40%) treatment group patients were disease free, while 8 of 32 (20%) control group patients were disease-free. This was not a statistically-significant treament effect (p=0.088), as the odds of being disease-free in the treatment group were 2.67 times the odds of being disease-free in the control group (OR: 2.67; 95% CI: 0.985 to 7.25)."),
           br(),
           br(),
            )
           
          )
        ))
      })
      
      observeEvent(input$snip2f2,{
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
        input$snip2g1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Saving your Work Reproducibly"), ##### Change this one every time and text below
                               "Always save your work, and do it in a reproducible way. This means that, if someone needed to reproduce your results, you could simply give them one or more files (that's what you're saving here) and tell them what analysis program or language or tool you used, and they'd be able to reproduce your results exactly. This is helpful if someone challenges your work or you get audited. It's also helpful if you leave an institution, corporation, or clinic and someone there needs to reproduce your results at some point. But it's probably most useful for you. There are any number of reasons you might need to reproduce your owwn results for yourself, such as when you need to pick up where you left off the last time you worked on your analysis.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip2g2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Saving your Work Reproducibly"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip1g2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      
  #    stackedPlot1<-reactive({
  #      matrix1a1<-input$matrix1a
  #      matrix1a<-matrix(nrow=2,ncol=2)
  #      matrix1a[1,1]<-matrix1a1[1,1]+matrix1a1[2,1]
  #      matrix1a[2,1]<-matrix1a1[1,2]+matrix1a1[2,2]
  #      matrix1a[1,2]<-matrix1a1[1,1]+matrix1a1[1,2]
  #      matrix1a[2,2]<-matrix1a1[2,1]+matrix1a1[2,2]
  #      
  #      outcome1<-outcome1()
  #      outcome2<-outcome2()
  #      pred1<-pred1()
  #      pred2<-pred2()
  #      
  #      matrix1b<-matrix(ncol=2,nrow=2)
  #      #matrix1a<-matrix1b
  #      for(j in 1:ncol(matrix1a)){
  #        denom<-sum(matrix1a[,j])
  #        for(k in 1:nrow(matrix1a)){
  #          matrix1b[k,j]<-matrix1a[k,j]/denom*100
  #        }
  #      }
  #      colnames(matrix1b)<-c(pred1,pred2)
  #      rownames(matrix1b)<-c(outcome1,outcome2)
  #      
  #      dat2<-matrix(ncol=3,nrow=4)
  #      dat2Row<-1
  #      for(j in 1:2){
  #        for(k in 1:2){
  #          dat2[dat2Row,1]<-matrix1b[k,j]
  #          dat2[dat2Row,2]<-colnames(matrix1b)[j]
  #          dat2[dat2Row,3]<-rownames(matrix1b)[k]
  #          dat2Row<-dat2Row+1
  #        }
  #      }
#
  #     dat3<-data.frame(Percentage=dat2[,1],Column=dat2[,2],Row=dat2[,3])
  #   colnames(dat3)<-c("Percentage","Group","Row")
  #     plot<-ggplot(dat3, aes(fill=Row, y=as.numeric(Percentage), x=Group)) + 
  #       labs(fill=outcomeLabel())+
  #       geom_col(position="stack",color="black") +  
  #       ylab("Percent") + 
  #       ggtitle(paste(outcomeLabel(),"by",predLabel()),subtitle="Category Percentages")+
  #       xlab(predLabel())+
  #       ylim(c(0,100))+
  #       theme_bw() +
  #       theme(panel.border = element_blank(),
  #             panel.background = element_blank(),
  #             panel.grid.major = element_blank(), 
  #             panel.grid.minor = element_blank(), 
  #             axis.line = element_line(colour = "black"),
  #             axis.text.y = element_text(size = 12, colour = "black"),
  #             axis.text.x.bottom = element_text(size = 12, colour = "black"),
  #             axis.title.x = element_text(size = 14, colour = "black"),
  #              axis.title.y = element_text(size = 14, colour = "black"),
  #              plot.title = element_text(size=16, colour="black",hjust=0.5),
  #              plot.subtitle = element_text(size=14, colour="black",hjust=0.5))
  #      
  #      palette<-palette()
  #      
  #      plot+scale_fill_brewer(palette = palette)
  #      
  #      
  #    })
      
      
      
      
      stackedPlot1<-reactive({
        matrix1a<-matrix1a()
        matrix1b<-matrix1a
        for(j in 1:ncol(matrix1a)){
          denom<-sum(matrix1a[,j])
          for(k in 1:nrow(matrix1a)){
            matrix1b[k,j]<-matrix1a[k,j]/denom*100
          }
        }
        dat2<-matrix(ncol=3,nrow=length(matrix1b))
        dat2Row<-1
        for(j in 1:ncol(matrix1b)){
          for(k in 1:nrow(matrix1b)){
            dat2[dat2Row,1]<-matrix1b[k,j]
            dat2[dat2Row,2]<-colnames(matrix1a)[j]
            dat2[dat2Row,3]<-rownames(matrix1a)[k]
            dat2Row<-dat2Row+1
          }
        }
        dat3<-data.frame(Percentage=dat2[,1],Column=dat2[,2],Row=dat2[,3])
        colnames(dat3)<-c("Percentage","Group","Row")
        
        plot<-ggplot(dat3, aes(fill=Row, y=as.numeric(Percentage), x=factor(Group,level=unique(Group)))) + 
          labs(fill=outcomeLabel())+
          geom_col(position="stack",color="black") +  
          ylab(input$yLab) + 
          ggtitle(input$chartTitle,subtitle=input$subTitle)+
          xlab(input$xLab)+
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
        
        palette<-palette()
        
        if(input$useLimits !=  "Use default y-axis limits"){
          plot+scale_fill_brewer(palette = palette)+ylim(c(input$yMin,input$yMax))
        }else{
          plot+scale_fill_brewer(palette = palette)
        }
      })
      
      
      output$stackedPlot<-renderPlot({
        stackedPlot1()
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
        paste("Table 1.",outcomeLabel(),"by",predLabel())
      })
      
      output$reultsTableTitle<-renderText({
        resultsTableTitle1()
      })
      
      
      outcome1<-reactive({
        input$outcome1
      })
      
      outcome2<-reactive({
        input$outcome2
      })
      
      pred1<-reactive({
        input$pred1
      })
      
      pred2<-reactive({
        input$pred2
      })
      
      

      
      
      output$downloadData<-downloadHandler(filename=function(){
        paste0(tempdir(), "/", "mcnemarsOut.xlsx")
      },
      content=function(file){
        
        #if(input$dataInput==1){
        matrix1a<-input$matrix1a
        contTabRows<-nrow(matrix1a)
        contTabCols<-ncol(matrix1a)
        #}
        #if(input$dataInput==3){
        #  matrix1a<-input$matrix1a2
        #}
        
        wb = createWorkbook()
        
        sheet = addWorksheet(wb, "Analysis",gridLines = FALSE)
        
        headStyle<-createStyle(border = "TopBottom", borderColour ='black', borderStyle="thick",textDecoration = "bold")
        bottomStyle<-createStyle(border="Bottom",borderStyle="thick")
        boldStyle<-createStyle(textDecoration = "bold")
        
        col1<-matrix(c("McNemar's Test","",
                       "Outcome Label:",outcomeLabel(),"",
                       "Predictor Label:",predLabel(),"",
                       "Null Hypothesis:","Standard (independence)","",
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
                       "Plot Palette:",input$palette,"",
                       "Test Type:","McNemar's Test","",
                       "Estimator Type:",input$estType,"",
                       "Contingency Table Rows",contTabRows,"",
                       "Contingency Table Columns",contTabCols,"",
                       "First Time/Replicate Label",input$pred1,"",
                       "Second Time/Replicate Label",input$pred2,"",
                       "Event Label",input$outcome1,"",
                       "Non-Event Label",input$outcome2,""),ncol=1)
        colnames(col1)<-"Tool:"
        
        writeData(wb,sheet=sheet,x=as.data.frame(col1), startCol=1, rowNames=FALSE)
        writeData(wb,sheet=sheet,x="Contingency Table with Row and Column Labels", startCol=3, rowNames=FALSE)
        addStyle(wb,sheet,style=boldStyle,rows=1,cols=3)
        writeDataTable(wb,sheet=sheet,x=as.data.frame(matrix1a), startCol=3,startRow = 3, rowNames=TRUE,tableStyle = "TableStyleLight8")
        #writeData(wb,sheet=sheet,x=as.data.frame(matrix1a), startCol=3,startRow = 3, rowNames=TRUE)
        setColWidths(wb,sheet,cols=1,widths = "auto")
        
        sheet = addWorksheet(wb, "Tabular Output",gridLines = FALSE)
        
        
        header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny"),ncol=1)
        colnames(header)<-"General Information"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header), startCol=1, startRow=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        header2<-matrix(c("Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus"),ncol=1)
        colnames(header2)<-"Creator"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header2), startCol=1, startRow=8, rowNames=FALSE)
        
        header3<-matrix(c("McNemar's Test","Core R Packages and Functions: mcnemar.test{stats}; ggplot{ggplot2}"),ncol=1)
        colnames(header3)<-"Tool"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header3), startCol=1, startRow=15, rowNames=FALSE)
        
        
        #header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny","","Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus","","","Tool: McNemar's Test","Core R Packages and Functions: mcnemar.test{stats}; ggplot{ggplot2}"),ncol=1)
        #colnames(header)<-"General Information"
        #
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        ##expected<-expected1()
        #testTable<-testTable1()
        #propTable<-propTable1()
        #resultsTable<-resultsTable1()
        #resultsTableTitle<-resultsTableTitle1()
        #
        ##writeData(wb,sheet=sheet,x="Model Assumptions", startCol=3+4, startRow=1, rowNames=FALSE)
        ##writeData(wb,sheet=sheet,x="Expected Cell Counts (under the null hypothesis)", startCol=3+4, startRow=3, rowNames=FALSE)
        ##writeData(wb,sheet=sheet,x=expected, startCol=3+4, startRow=5, rowNames=TRUE)
        #
        #offset1<-1
        #writeData(wb,sheet=sheet,x="Test Results not for Publication", startCol=offset1+4+4, startRow=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x="Estimates (frequencies and percentages)", startCol=offset1+4+4, startRow=3, rowNames=FALSE)        
        #writeData(wb,sheet=sheet,x=propTable, startCol=offset1+4+4, startRow=5, rowNames=TRUE)
        #
        #offset2<-nrow(propTable)+3
        #writeData(wb,sheet=sheet,x="Test Results", startCol=3+offset1+1+4, startRow=5+offset2+1, rowNames=TRUE)
        #writeData(wb,sheet=sheet,x=testTable, startCol=3+offset1+1+4, startRow=5+offset2+3, rowNames=FALSE)
        #
        #offset3<-max(ncol(propTable),ncol(testTable))+1
        #writeData(wb,sheet=sheet,x="Publishable Table", startCol=3+offset1+1+offset3+1+4, startRow=1, rowNames=TRUE)
        #writeData(wb,sheet=sheet,x=resultsTableTitle, startCol=3+offset1+1+offset3+1+4, startRow=3, rowNames=TRUE)
        #writeData(wb,sheet=sheet,x=resultsTable, startCol=3+offset1+1+offset3+1+4, startRow=5, rowNames=FALSE)
        #
        #setColWidths(wb,sheet,cols=c(1:256),widths = "auto")
        
        
        
        
        testTable<-testTable1()
        propTable<-propTable1()
        resultsTable<-resultsTable1()
        resultsTableTitle<-resultsTableTitle1()
        
        #writeData(wb,sheet=sheet,x="Model Assumptions", startCol=3+4, startRow=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x="Expected Cell Counts (under the null hypothesis)", startCol=3+4, startRow=3, rowNames=FALSE)
        #addStyle(wb,sheet,style=boldStyle,rows=c(1,3),cols=3+4)
        #writeDataTable(wb,sheet=sheet,x=as.data.frame(expected), startCol=3+4, startRow=5, rowNames=TRUE,tableStyle = "TableStyleLight8")
        
        offset1<-1
        writeData(wb,sheet=sheet,x="Test Results not for Publication", startCol=offset1+4+4, startRow=1, rowNames=FALSE)
        writeData(wb,sheet=sheet,x="Estimates (frequencies and percentages)", startCol=offset1+4+4, startRow=3, rowNames=FALSE)  
        addStyle(wb,sheet,style=boldStyle,rows=c(1,3),cols=offset1+4+4)
        writeDataTable(wb,sheet=sheet,x=as.data.frame(propTable), startCol=offset1+4+4, startRow=5, rowNames=TRUE,tableStyle = "TableStyleLight8")
        
        offset2<-nrow(propTable)+3
        writeData(wb,sheet=sheet,x="Test Results", startCol=3+offset1+1+4, startRow=5+offset2+1, rowNames=TRUE)
        addStyle(wb,sheet,style=boldStyle,rows=5+offset2+1,cols=3+offset1+1+4)
        writeDataTable(wb,sheet=sheet,x=as.data.frame(testTable), startCol=3+offset1+1+4, startRow=5+offset2+3, rowNames=FALSE,tableStyle = "TableStyleLight8")
        
        offset3<-max(ncol(propTable),ncol(testTable))+1
        mergeCells(wb,sheet,cols=c((3+offset1+1+offset3+1+4):(3+offset1+1+offset3+1+4+5)),rows=3)
        writeData(wb,sheet=sheet,x="Publishable Table", startCol=3+offset1+1+offset3+1+4, startRow=1, rowNames=TRUE)
        writeData(wb,sheet=sheet,x=resultsTableTitle, startCol=3+offset1+1+offset3+1+4, startRow=3, rowNames=TRUE)
        writeData(wb,sheet=sheet,x=as.data.frame(resultsTable), startCol=3+offset1+1+offset3+1+4, startRow=5, rowNames=FALSE)
        
        addStyle(wb,sheet,style=boldStyle,rows=c(1,3),cols=3+offset1+1+offset3+1+4)
        addStyle(wb,sheet,style=headStyle,rows=5,cols=c((3+offset1+1+offset3+1+4):(3+offset1+1+offset3+1+4+ncol(resultsTable)-1)))
        addStyle(wb,sheet,style=bottomStyle,rows=5+nrow(resultsTable),cols=c((3+offset1+1+offset3+1+4):(3+offset1+1+offset3+1+4+ncol(resultsTable)-1)))
        
        setColWidths(wb,sheet,cols=c(1:256),widths = "auto")
        
        
        
        
        
        
        sheet = addWorksheet(wb, "Plot Output",gridLines = FALSE)
        
        stackedPlot<-stackedPlot1()
        
        
        stackedHeight<-selectedHeight()
        stackedWidth<-selectedWidth()
        
        png(paste0(tempdir(), "/", "stackedPlot.png"), width=stackedWidth*4, height=stackedHeight*4, units="px", res=300)
        print(stackedPlot)
        dev.off()  
        insertImage(wb, sheet=sheet, paste0(tempdir(), "/", "stackedPlot.png"), startRow=5, startCol=2,width=stackedWidth*4, height=stackedHeight*4, units="px")
        
        writeData(wb,sheet=sheet,x="Figure for Publication", startCol=2, startRow=2, rowNames=FALSE,colNames=FALSE)
        addStyle(wb,sheet,style=boldStyle,rows=2,cols=2)
        
        saveWorkbook(wb, file,overwrite=TRUE)
        
      })
      
      
      
      
      
      
      Dat1ab <- reactiveVal()
      #Dat1a <- reactiveVal()
      #Dat1b <- reactiveVal()
      
      observeEvent(input[["mcnemarsData"]], {
        xlfile <- input[["mcnemarsData"]][["datapath"]]
        ext <- tolower(tools::file_ext(xlfile))
        if(ext == "xlsx") {
          sheets <- excel_sheets(xlfile)
          if(length(sheets) == 1L) {
            Dat1ab(read_xlsx(input[["mcnemarsData"]][["datapath"]], sheet = 1L))
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
        if(read_xlsx(input[["mcnemarsData"]][["datapath"]], sheet = input[["sheet"]])[1,1] != "McNemar's Test"){
          sendSweetAlert(
            session,
            title = "Incorrect File",
            text = "Not a McNemar's Test Analysis File. Please upload an analysis file compatible with the McNemar's Test Tool.",
            type = "error",
            btn_colors="#5f5f62"
          )
        }else{
          Dat1ab(read_xlsx(input[["mcnemarsData"]][["datapath"]], sheet = input[["sheet"]]))
          dat<-Dat1ab()
          options<-as.matrix(dat[,1])
          matrows<-as.numeric(options[58])
          matcols<-as.numeric(options[61])
          matrix1a<-as.matrix(dat[3:(2+matrows),4:(3+matcols)])
          #rownms<-as.matrix(dat[3:(2+matrows),3])
          #rownms1<-unlist(rownms)
          #rownames(matrix1a)<-rownms1
          #rownames(matrix1a)[1]<-rownms1[1]
          #rownames(matrix1a)[2]<-rownms1[2]
          #rownames(matrix1a)[3]<-rownms1[3]
          rn<-vector(length=matrows)
          rn2<-as.matrix(dat[3:(2+matrows),3])
          for(j in 1:matrows) rn[j]<-rn2[j]
          rownames(matrix1a)<-rn
          #rownames(matrix1a)<-as.matrix(dat[3:(2+matrows),3])
          colnames(matrix1a)<-dat[2,4:(3+matcols)]
          updateMatrixInput(session,"matrix1a3",value=matrix1a)
          updateRadioButtons(session,"estType",selected=options[55])
          #updateRadioButtons(session,"testType",selected=options[52])
          updateSelectInput(session,"palette",selected=options[49])
          updateTextInput(session,"outcomeLabel",value=options[4])
          updateTextInput(session,"predLabel",value=options[7])
          #updateNumericInput(session,"nullDiff",value=options[10])
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
          
          updateTextInput(session,"pred1",value=options[64])
          updateTextInput(session,"pred2",value=options[67])
          updateTextInput(session,"outcome1",value=options[70])
          updateTextInput(session,"outcome2",value=options[73])
          
        }
      })
      
      
      
      
      
      
      
      
      
      
      
    }
  )    
}
