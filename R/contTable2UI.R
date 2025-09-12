# Module UI function
contTable2UI <- function(id) {
  
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
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip2a1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip2a2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
           column(12,
                  "The null hypothesis for a contingency table test is that the marginal distributions are independent of each other. Click on the buttons next to 'Learn:' to the right to learn more. Unlike our t-test tools, this tool does not allow you to modify this 'standard' null hypothesis of independence of the marginal distributions.",
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
           
           br(),
           column(width=12,
                  h2("Data")),
           #column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  #column(width=6,#h4(style="color:#818e9f;", "Learn:")
                  #       ),
                  #column(width=4,
                  ##       actionButton(ns("snip6a1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip6a2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                  #       tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  #)),
           br(),
           br(),
           br(),
           
           column(width=12,
                  
                  "Enter your data below or learn more using the buttons next to 'Learn:' to the right.",
                  br(),
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
                                                       "These example data are simulated and do not represent observations from real participants.",
                                                             br(),
                                                              br(),
                                                              br(),
                                                              textInput(ns("outcomeLabel"),"Outcome Label",value="Disease Status"),
                                                              textInput(ns("predLabel"),"Predictor Label",value="Treatment Group"),
                                                              br(),
                                                              br(),
                                                              
                                                              column(12, 
                                                                     style="background-color: white",
                                                                     matrixInput(
                                                                       inputId = ns("matrix1a"),
                                                                       label = "Contingency Table",
                                                                       value = matrix(
                                                                         c(32,8,24,16),
                                                                         ncol=2,
                                                                         nrow=2,
                                                                         dimnames=list(
                                                                           c("Disease","Disease-Free"),
                                                                           c("Control","Treatment")
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
                                                              
                                                              br(),
                                                              column(2,
                                                                     numericInput(ns("contTabRows"),"Rows",value=2,min=2,step=1,width="50px")
                                                              ),
                                                              column(10,
                                                                     numericInput(ns("contTabCols"),"Columns",value=2,min=2,step=1,width="50px")
                                                              ),
                                                              br(),
                                                    
                                                       br(),
                                                       br()
                                                ),
                                                
                                              ),
                                              
                                     ),
                                     
                                     
                                     tabPanel("Paste Data",value=2,
                                              style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                              br(),
                                              fluidPage(
                                                column(12,style = " background-color: white; border-radius: 5px; ",
                                                       h3("Example Data"),
                                                       "You can type or paste your variable labels and data values below.",
                                                       br(),
                                                       br(),
                                                       br(),
                                                       textInput(ns("outcomeLabel2"),"Enter Outcome Label",value="Disease Status"),
                                                       textInput(ns("predLabel2"),"Enter Predictor Label",value="Treatment Group"),
                                                       br(),
                                                       br(),
                                                       
                                                       column(12, 
                                                              style="background-color: white",
                                                              matrixInput(
                                                                inputId = ns("matrix1a2"),
                                                                label = "Contingency Table",
                                                                value = matrix(
                                                                  c(32,8,24,16),
                                                                  ncol=2,
                                                                  nrow=2,
                                                                  dimnames=list(
                                                                    c("Disease","Disease-Free"),
                                                                    c("Control","Treatment")
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
                                                       
                                                       br(),
                                                       column(2,
                                                              numericInput(ns("contTabRows2"),"Rows",value=2,min=2,step=1,width="50px")
                                                       ),
                                                       column(10,
                                                              numericInput(ns("contTabCols2"),"Columns",value=2,min=2,step=1,width="50px")
                                                       ),
                                                       br(),
                                                       
                                                       br(),
                                                       br()
                                                ),
                                                
                                              ),
                                              
                                     ),
                                     
                                     
                                     tabPanel("Upload Data",value=3,
                                              style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                              br(),
                                              fluidPage(

                                                       column(12,style = " background-color: white; border-radius: 5px; ",
                                                              br(),
                                                              h3("Upload Data"),
                                                              "Upload your Analysis File below. You can download an example Analysis File to see its formatting by clicking this link:",
                                                              br(),
                                                              br(),
                                                              tags$a(href="Chi2FishersAnalysisFileExample.xlsx",download="Chi2FishersAnalysisFileExample.xlsx",
                                                                     "Example Analysis File for Chi-Square and Fisher's Exact Tests",target="_blank"),
                                                              br(),
                                                              br(),
                                                              "You can also use the Analysis file saved after using this tool previously. This is the tab named 'Analysis' in the reproducible file you downloaded. The fact that you can upload that file and get the exact same results is what makes this reproducible research (see last section). Once you've uploaded your data, look at the Data Read below to be sure your data were read correctly.",
                                                              
                                                              br(),
                                                              br(),
                                                              
                                                              fileInput(ns("chi2FishersData"),"Enter data file location",accept=".xlsx"),
                                                              br(),
                                                              
                                                              
                                                              
                                                              br(),
                                                              
                                      
                                                              h3("Data Read"),
                                                              br(),
                                                              textInput(ns("outcomeLabel3"),"Outcome Label",value="Disease Status"),
                                                              textInput(ns("predLabel3"),"Predictor Label",value="Treatment Group"),
                                                              br(),
                                                              br(),
                                                              
                                                              column(12, 
                                                                     style="background-color: white",
                                                                     matrixInput(
                                                                       inputId = ns("matrix1a3"),
                                                                       label = "Contingency Table",
                                                                       value = matrix(
                                                                         c(32,8,24,16),
                                                                         ncol=2,
                                                                         nrow=2,
                                                                         dimnames=list(
                                                                           c("Disease","Disease-Free"),
                                                                           c("Control","Treatment")
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
                                                              
                                                              br(),
                                                              column(2,
                                                                     numericInput(ns("contTabRows3"),"Rows",value=2,min=2,step=1,width="50px")
                                                              ),
                                                              column(10,
                                                                     numericInput(ns("contTabCols3"),"Columns",value=2,min=2,step=1,width="50px")
                                                              ),
                                                              br()
                                                       ),
                                                       br(),
                                                
                                              ),
                                              
                                     ),
                                     
                                     tabPanel("Enter Data by Hand",value=4,
                                              style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                              br(),
                                              fluidPage(
                                                column(12,style = " background-color: white; border-radius: 5px; ",
                                                       h3("Example Data"),
                                                       "Enter your variable labels and data values below.",
                                                       br(),
                                                       br(),
                                                       br(),
                                                       textInput(ns("outcomeLabel4"),"Enter Outcome Label",value="Disease Status"),
                                                       textInput(ns("predLabel4"),"Enter Predictor Label",value="Treatment Group"),
                                                       br(),
                                                       br(),
                                                       
                                                       column(12, 
                                                              style="background-color: white",
                                                              matrixInput(
                                                                inputId = ns("matrix1a4"),
                                                                label = "Contingency Table",
                                                                value = matrix(
                                                                  c(32,8,24,16),
                                                                  ncol=2,
                                                                  nrow=2,
                                                                  dimnames=list(
                                                                    c("Disease","Disease-Free"),
                                                                    c("Control","Treatment")
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
                                                       
                                                       br(),
                                                       column(2,
                                                              numericInput(ns("contTabRows4"),"Rows",value=2,min=2,step=1,width="50px")
                                                       ),
                                                       column(10,
                                                              numericInput(ns("contTabCols4"),"Columns",value=2,min=2,step=1,width="50px")
                                                       ),
                                                       br(),
                                                       
                                                       br(),
                                                       br()
                                                ),
                                                
                                              ),
                                              
                                     ),
                                     
                                    
                                   
                                     
                                     
                                     
                         ),
                         
                         #br(),
                         br(),
                         br()
                         
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
                  h2("Model Assumptions")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip2c1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip2c2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
           
           #h2("Test Output"),
           #br(),
           column(width=12,
           
           "Use the table below to examine the expected cell counts. If any of the expected cell counts are below 5, choose Fisher's exact test below. If all of the expected cell counts are 5 or greater, choose chi-squared test below.",
           br(),
           br(),
           h3("Expected Cell Counts"),
           tableOutput(ns("expected")),
           br(),
           #actionButton(ns("reset"), label="Reset Tables and Figure", style="width: 45px; height: 20px; font-size: 100%;  background-size: cover; background-position: center;"),
           #br(),
           h3("Choose a Test"),
           "Based on your examination of the expected cell counts above (your evaluation of the test assumptions), pick a test.",
           br(),
           br(),
           radioButtons(
             inputId=ns("testType"),
             label=NULL,
             choiceNames = c("Chi-Squared Test","Fisher's Exact Test"),
             choiceValues=c(1,2),
             selected = 1,
             inline = FALSE,
             width = NULL
           ),
           #column(6, 
           #       h4("Distribution of Data"),
           #       br(),
           #       plotOutput(ns("histogram2"),height=300),
           #       br(),
           #       plotOutput(ns("histogram3"),height=300),
           #       br()
           #),
           #column(6, 
           #       h4("Distribution of Sample Means (bootstrapped)"),
           #       br(),
           #       plotOutput(ns("histogram4"),height=300),
           #       br(),
           #       plotOutput(ns("histogram5"),height=300),
           #       br()
           #       
           #),
           br(),
           #br(),
           #br(),
          
           #br(),
           #br(),
      #     column(12, 
      #            br(),
      #            br(),
      #            h3("Equality of Variances"),
      #            "Student's t-test in its original form assumes equal variances in the two populations. Welch's t-test, 
      # also known as the unequal variances t-test, does not assume equal variances in the two groups. The 
      # t-test used below is Welch's t-test. While there are ways to test for equality of variances, those tests 
      # are not used here. This is because a test for equality of variances, 
      # like any hypothesis test, risks both Type I and Type II errors, meaning there's some probability of incorrectly 
      # assuming equal variances. Additionally, Welch's t-test performs better than Student's t-test with unequal variances 
      # AND performs nearly as well as Student's t-test when the variances are equal. Because of this, we recommend against testing
      # for equality of variances and recommend the use of Welch's 
      # t-test instead of Student's t-test in all cases. Note that Welch's t-test
      # retains the normality assumption addressed above.",
      #            br(),
      #            br()
      #     ),
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
           h4("Test Results"),
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
           "If your frequency table has two columns, you can include a comparison estimate in your 
           results table. This can either be an odds ratio or a risk ratio. 95% confidence intervals will be added
           to the odds ratios and risk ratios only if you've selected a chi-squared test. Pick an option below 
           (has no effect on tables that have more than two columns 
           of frequencies and percents.)",
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
           
           h4(textOutput(ns("resultsTableTitle"))),
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
          h3("Example Methods"),
          "The following is an EXAMPLE of what one might write about this test in the methods section of a paper. 
       This example uses the data and test present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way. THIS IS ONLY AN EXAMPLE. You must write your own methods and results.",
           br(),
           br(),
           em("After expected cell counts were examined to ensure that model assumptions were met, a chi-squared test was used to test the association between treatment group and disease status for statistical significance. Odds ratios and Wald 95% confidence intervals were also calculated."),
           br(),
           br(),
           h3("Example Results"),
       "The following is an example of what one might write about the results of this test in the results section of a paper. 
       This example uses the data and test present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way. THIS IS ONLY AN EXAMPLE. You must write your own methods and results.",
       br(),
       br(),
           em("After the study period, 16 of 40 (40%) treatment group patients were disease free, while 8 of 32 (20%) control group patients were disease-free. This was not a statistically-significant treament effect (p=0.088), as the odds of being disease-free in the treatment group were 2.67 times the odds of being disease-free in the control group (OR: 2.67; 95% CI: 0.985 to 7.25)."),
           
           
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








contTable2Server <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      version<-reactive({
        1.1
      })
      
      #matrix1a<-reactive({
      #  matrix1a<-input$matrix1a
      #  matrix1a<-na.omit(matrix1a)
      #  matrix1b<-t(matrix1a)
      #  matrix1b<-na.omit(matrix1b)
      #  matrix1a<-t(matrix1b)
      #  if(all(is.null(matrix1a[,ncol(matrix1a)]))){
      #    matrix1a<-matrix1a[,-ncol(matrix1a)]
      #  }
      #  matrix1a
      #})
      
      
      
      
      
      
      matrix1a<-reactiveVal()
      matrix1a2<-reactiveVal()
      matrix1a3<-reactiveVal()
      matrix1a4<-reactiveVal()
      
      observeEvent(input$matrix1a,{
        matrix1a<-input$matrix1a
        matrix1a<-na.omit(matrix1a)
        matrix1b<-t(matrix1a)
        matrix1b<-na.omit(matrix1b)
        matrix1a<-t(matrix1b)
        if(all(is.null(matrix1a[,ncol(matrix1a)]))){
          matrix1a<-matrix1a[,-ncol(matrix1a)]
        }
        if(all(is.na(matrix1a[,ncol(matrix1a)]))){
          matrix1a<-matrix1a[,-ncol(matrix1a)]
        }
        if(all(is.null(matrix1a[nrow(matrix1a),]))){
          matrix1a<-matrix1a[-nrow(matrix1a),]
        }
        if(all(is.na(matrix1a[nrow(matrix1a),]))){
          matrix1a<-matrix1a[-nrow(matrix1a),]
        }
        matrix1a(matrix1a)
      })
      observeEvent(input$matrix1a2,{
        matrix1a<-input$matrix1a2
        matrix1a<-na.omit(matrix1a)
        matrix1b<-t(matrix1a)
        matrix1b<-na.omit(matrix1b)
        matrix1a<-t(matrix1b)
        if(all(is.null(matrix1a[,ncol(matrix1a)]))){
          matrix1a<-matrix1a[,-ncol(matrix1a)]
        }
        if(all(is.na(matrix1a[,ncol(matrix1a)]))){
          matrix1a<-matrix1a[,-ncol(matrix1a)]
        }
        if(all(is.null(matrix1a[nrow(matrix1a),]))){
          matrix1a<-matrix1a[-nrow(matrix1a),]
        }
        if(all(is.na(matrix1a[nrow(matrix1a),]))){
          matrix1a<-matrix1a[-nrow(matrix1a),]
        }
        matrix1a2(matrix1a)
      })
      observeEvent(input$matrix1a3,{
        matrix1a<-input$matrix1a3
        matrix1a<-na.omit(matrix1a)
        matrix1b<-t(matrix1a)
        matrix1b<-na.omit(matrix1b)
        matrix1a<-t(matrix1b)
        if(all(is.null(matrix1a[,ncol(matrix1a)]))){
          matrix1a<-matrix1a[,-ncol(matrix1a)]
        }
        if(all(is.na(matrix1a[,ncol(matrix1a)]))){
          matrix1a<-matrix1a[,-ncol(matrix1a)]
        }
        if(all(is.null(matrix1a[nrow(matrix1a),]))){
          matrix1a<-matrix1a[-nrow(matrix1a),]
        }
        if(all(is.na(matrix1a[nrow(matrix1a),]))){
          matrix1a<-matrix1a[-nrow(matrix1a),]
        }
        matrix1a3(matrix1a)
      })
      observeEvent(input$matrix1a4,{
        matrix1a<-input$matrix1a4
        matrix1a<-na.omit(matrix1a)
        matrix1b<-t(matrix1a)
        matrix1b<-na.omit(matrix1b)
        matrix1a<-t(matrix1b)
        if(all(is.null(matrix1a[,ncol(matrix1a)]))){
          matrix1a<-matrix1a[,-ncol(matrix1a)]
        }
        if(all(is.na(matrix1a[,ncol(matrix1a)]))){
          matrix1a<-matrix1a[,-ncol(matrix1a)]
        }
        if(all(is.null(matrix1a[nrow(matrix1a),]))){
          matrix1a<-matrix1a[-nrow(matrix1a),]
        }
        if(all(is.na(matrix1a[nrow(matrix1a),]))){
          matrix1a<-matrix1a[-nrow(matrix1a),]
        }
        matrix1a4(matrix1a)
      })
      
      
      
      
      
      
      
      matrix1aNAOmit<-reactive({
        #matrix1a<-input$matrix1a
        #na.omit(matrix1a)
        matrix1a()
      })
      matrix1aNAOmit2<-reactive({
        #matrix1a<-input$matrix1a
        #na.omit(matrix1a)
        matrix1a2()
      })
      matrix1aNAOmit3<-reactive({
        #matrix1a<-input$matrix1a
        #na.omit(matrix1a)
        matrix1a3()
      })
      matrix1aNAOmit4<-reactive({
        #matrix1a<-input$matrix1a
        #na.omit(matrix1a)
        matrix1a4()
      })
      
      checkNA<-reactive({
        matrix1aTemp<-matrix1a()
          anyNA(matrix1aTemp)
      })
      checkNA2<-reactive({
        matrix1aTemp<-matrix1a2()
        anyNA(matrix1aTemp)
      })
      checkNA3<-reactive({
        matrix1aTemp<-matrix1a3()
        anyNA(matrix1aTemp)
      })
      checkNA4<-reactive({
        matrix1aTemp<-matrix1a4()
        anyNA(matrix1aTemp)
      })
      

      
      
      observeEvent(c(input$contTabCols,input$contTabRows),{
        colnms<-vector(length=input$contTabCols)
        rownms<-vector(length=input$contTabRows)
        for(j in 1:input$contTabRows){
          rownms[j]<-paste("Row",j)
        }
        for(j in 1:input$contTabCols){
          colnms[j]<-paste("Column",j)
        }
        if(input$contTabCols==2 & input$contTabRows==2){
          updateMatrixInput(session,"matrix1a",value= matrix(
            c(32,8,24,16),
            ncol=2,
            nrow=2,
            dimnames=list(
              c("Disease","Disease-Free"),
              c("Control","Treatment")
            )
          ))
        }else{
          updateMatrixInput(session,"matrix1a",value= matrix(1,
                                                             ncol=input$contTabCols,
                                                             nrow=input$contTabRows,
                                                             dimnames=list(
                                                               rownms, colnms
                                                             )))
        }
      })
      observeEvent(c(input$contTabCols2,input$contTabRows2),{
        colnms<-vector(length=input$contTabCols2)
        rownms<-vector(length=input$contTabRows2)
        for(j in 1:input$contTabRows2){
          rownms[j]<-paste("Row",j)
        }
        for(j in 1:input$contTabCols2){
          colnms[j]<-paste("Column",j)
        }
        if(input$contTabCols2==2 & input$contTabRows2==2){
          updateMatrixInput(session,"matrix1a2",value= matrix(
            c(32,8,24,16),
            ncol=2,
            nrow=2,
            dimnames=list(
              c("Disease","Disease-Free"),
              c("Control","Treatment")
            )
          ))
        }else{
          updateMatrixInput(session,"matrix1a2",value= matrix(1,
                                                             ncol=input$contTabCols2,
                                                             nrow=input$contTabRows2,
                                                             dimnames=list(
                                                               rownms, colnms
                                                             )))
        }
      })
      observeEvent(c(input$contTabCols3,input$contTabRows3),{
        colnms<-vector(length=input$contTabCols3)
        rownms<-vector(length=input$contTabRows3)
        for(j in 1:input$contTabRows3){
          rownms[j]<-paste("Row",j)
        }
        for(j in 1:input$contTabCols3){
          colnms[j]<-paste("Column",j)
        }
        if(input$contTabCols3==2 & input$contTabRows3==2){
          updateMatrixInput(session,"matrix1a3",value= matrix(
            c(32,8,24,16),
            ncol=2,
            nrow=2,
            dimnames=list(
              c("Disease","Disease-Free"),
              c("Control","Treatment")
            )
          ))
        }else{
          updateMatrixInput(session,"matrix1a3",value= matrix(1,
                                                             ncol=input$contTabCols3,
                                                             nrow=input$contTabRows3,
                                                             dimnames=list(
                                                               rownms, colnms
                                                             )))
        }
      })
      observeEvent(c(input$contTabCols4,input$contTabRows4),{
        colnms<-vector(length=input$contTabCols4)
        rownms<-vector(length=input$contTabRows4)
        for(j in 1:input$contTabRows4){
          rownms[j]<-paste("Row",j)
        }
        for(j in 1:input$contTabCols4){
          colnms[j]<-paste("Column",j)
        }
        if(input$contTabCols4==2 & input$contTabRows4==2){
          updateMatrixInput(session,"matrix1a4",value= matrix(
            c(32,8,24,16),
            ncol=2,
            nrow=2,
            dimnames=list(
              c("Disease","Disease-Free"),
              c("Control","Treatment")
            )
          ))
        }else{
          updateMatrixInput(session,"matrix1a4",value= matrix(1,
                                                             ncol=input$contTabCols4,
                                                             nrow=input$contTabRows4,
                                                             dimnames=list(
                                                               rownms, colnms
                                                             )))
        }
      })
      
     
      
     


      
      expected<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        
        if(checkNA2()==FALSE){
          chisq <- chisq.test(matrix1a)
          expected<-chisq$expected
        }else{
          expected<-"Finish entering data in contingency table above or reload the page."
        }
        expected
      })
      
      p1<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        if(checkNA2()==FALSE){
          chisq <- chisq.test(matrix1a)
          p1<-chisq$p.value
        }else{
          p1<-"Finish entering data in contingency table above or reload the page."
        }
        p1
      })
      
      p2<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        if(checkNA2()==FALSE){
          fisher <- fisher.test(matrix1a)
          p2<-fisher$p.value
        }else{
          p2<-"Finish entering data in contingency table above or reload the page."
        }
        p2
      })
      
      statistic<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        if(checkNA2()==FALSE){
          chisq <- chisq.test(matrix1a)
          statistic<-chisq$statistic
        }else{
          statistic<-"Finish entering data in contingency table above or reload the page."
        }
        statistic
      })
      
      df<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        if(checkNA2()==FALSE){
          chisq <- chisq.test(matrix1a)
          df<-chisq$parameter
        }else{
          df<-"Finish entering data in contingency table above or reload the page."
        }
        df
      })
      
      
      expected1<-reactive({
        expected()
      })


      testTable1<-reactive({
        testDF1<-data.frame("Method"="Chi-Squared Test","Chi-Squared"=statistic(),"DF"=df(),"p-Value"=pvalue(p1()))
        testDF2<-data.frame("Method"="Fisher's Exact Test","p-Value"=pvalue(p2()))
        if(input$testType==1) testDF<-testDF1
        if(input$testType==2) testDF<-testDF2
        testDF
      })
      
      propTable1<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        dat<-matrix1a
        tableOut<-dat
        tbl1<-prop.table(dat,margin=2)*100
        for(j in 1:(ncol(dat))){
          for(k in 1:(nrow(dat))){
            tableOut[k,j]<-paste(dat[k,j]," (",round(tbl1[k,j],digits=2),"%)",sep="")
          }
        }
        tableOut
      })
      

      
      resultsTable1<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        dat<-matrix1a
        tableOut<-rbind("",cbind("","",dat,""))
        tbl1<-prop.table(dat,margin=2)*100
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
        tableOut[1,1]<-outcomeLabel
        tableOut[-1,2]<-rownames(dat)
        if(input$testType==1) tableOut[1,ncol(tableOut)]<-pvalue(p1())
        if(input$testType==2) tableOut[1,ncol(tableOut)]<-pvalue(p2())
        colnames(tableOut)<-c("Outcome","Category",colnames(dat),"p-Value")
        if(ncol(tbl1)==2 && input$testType==1){
          if(input$estType==1){
            tableOut<-cbind(tableOut[,-ncol(tableOut)],c("",paste(round(oddsRatios,digits=2)," (",round(lowerOR,digits=2),", ",round(upperOR,digits=2),")",sep="")),tableOut[,ncol(tableOut)])
            colnames(tableOut)<-c("Outcome","Category",colnames(dat),"Odds Ratio (95% CI)","p-Value")
          }
          if(input$estType==2){
            tableOut<-cbind(tableOut[,-ncol(tableOut)],c("",paste(round(riskRatios,digits=2)," (",round(lowerRR,digits=2),", ",round(upperRR,digits=2),")",sep="")),tableOut[,ncol(tableOut)])
            colnames(tableOut)<-c("Outcome","Category",colnames(dat),"Risk Ratio (95% CI)","p-Value")
          }
        }
        if(ncol(tbl1)==2 && input$testType==2){
          if(input$estType==1){
            tableOut<-cbind(tableOut[,-ncol(tableOut)],c("",round(oddsRatios,digits=2)),tableOut[,ncol(tableOut)])
            colnames(tableOut)<-c("Outcome","Category",colnames(dat),"Odds Ratio","p-Value")
          }
          if(input$estType==2){
            tableOut<-cbind(tableOut[,-ncol(tableOut)],c("",round(riskRatios,digits=2)),tableOut[,ncol(tableOut)])
            colnames(tableOut)<-c("Outcome","Category",colnames(dat),"Risk Ratio","p-Value")
          }
        }
        tableOut
      })

      
      
 #     dat<-reactive({
 #       
 #       matrix1a<-input$matrix1a
 #       matrix1b<-input$matrix1b
 #       
 #       #dat0<-as.matrix(matrix1In)
 #       dat0a<-as.matrix(matrix1a)
 #       dat0b<-as.matrix(matrix1b)
 #       
 #       colNames1<-vector(length=length(na.omit(dat0a)))
 #       colNames1[]<-colnames(matrix1a)
 #       #colNames1[]<-"ColName1"
 #       
 #       colNames2<-vector(length=length(na.omit(dat0b)))
 #       colNames2[]<-colnames(matrix1b)
 #       #colNames2[]<-"ColName2"
 #       
 #       matrix1a1<-cbind(na.omit(dat0a),colNames1)
 #       matrix1b1<-cbind(na.omit(dat0b),colNames2)
 #       
 #       matrix1_2<-na.omit(rbind(matrix1b1,matrix1a1))
 #       
 #       dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
 #       
 #       dat1
 #       
 #     })
 #     
 #     dat1<-reactive({
 #       
 #       matrix1a<-input$matrix1a
 #       
 #       dat0a<-as.matrix(matrix1a)
 #       
 #       colNames1<-vector(length=length(na.omit(dat0a)))
 #       colNames1[]<-colnames(matrix1a)
 #       
 #       matrix1a1<-cbind(na.omit(dat0a),colNames1)
 #       
 #       matrix1_2<-na.omit(matrix1a1)
 #       
 #       dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
 #       
 #       dat1
 #       
 #     })
      
  #    dat2<-reactive({
  #      
  #      matrix1b<-input$matrix1b
  #      
  #      dat0b<-as.matrix(matrix1b)
  #      
  #      colNames1<-vector(length=length(na.omit(dat0b)))
  #      colNames1[]<-colnames(matrix1b)
  #      
  #      matrix1b1<-cbind(na.omit(dat0b),colNames1)
  #      
  #      matrix1_2<-na.omit(matrix1b1)
  #      
  #      dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
  #      
  #      dat1
  #      
  #    })
 
    
      
      
      outcomeLabel<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        outcomeLabel
      })
      
      predLabel<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        predLabel
      })

      
      
      stackedPlot1<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        #matrix1a<-matrix1a()
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
          labs(fill=outcomeLabel)+
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
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
        paste("Table 1.",outcomeLabel,"by",predLabel)
      })
      
      output$resultsTableTitle<-renderText({
        resultsTableTitle1()
      })
      
      output$resultsTable<-renderTable({
        resultsTable1()
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
      
      
      
      
      output$downloadData<-downloadHandler(filename=function(){
        paste0(tempdir(), "/", "Chi2FisherOut.xlsx")
      },
      content=function(file){

        #if(input$dataInput==1){
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          outcomeLabel<-input$outcomeLabel
          predLabel<-input$predLabel
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a2
          outcomeLabel<-input$outcomeLabel2
          predLabel<-input$predLabel2
        }
        if(input$dataInput==3){
          matrix1a<-input$matrix1a3
          outcomeLabel<-input$outcomeLabel3
          predLabel<-input$predLabel3
        }
        if(input$dataInput==4){
          matrix1a<-input$matrix1a4
          outcomeLabel<-input$outcomeLabel4
          predLabel<-input$predLabel4
        }
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
        
        col1<-matrix(c("Chi2FisherExact","",
                       "Outcome Label:",outcomeLabel,"",
                       "Predictor Label:",predLabel,"",
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
                       "Test Type:",input$testType,"",
                       "Estimator Type:",input$estType,"",
                       "Contingency Table Rows",contTabRows,"",
                       "Contingency Table Columns",contTabCols,""),ncol=1)
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
        
        header3<-matrix(c("Chi-Square & Fisher's Exact Tests","Core R Packages and Functions: chisq.test{stats}; fisher.test{stats}; ggplot{ggplot2}"),ncol=1)
        colnames(header3)<-"Tool"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header3), startCol=1, startRow=15, rowNames=FALSE)
        
        
        #header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny","","Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus","","","Tool: Chi-Square & Fisher's Exact Tests","Core R Packages and Functions: chisq.test{stats}; fisher.test{stats}; ggplot{ggplot2}"),ncol=1)
        #colnames(header)<-"General Information"
        #
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        expected<-expected1()
        testTable<-testTable1()
        propTable<-propTable1()
        resultsTable<-resultsTable1()
        resultsTableTitle<-resultsTableTitle1()
        
        writeData(wb,sheet=sheet,x="Model Assumptions", startCol=3+4, startRow=1, rowNames=FALSE)
        writeData(wb,sheet=sheet,x="Expected Cell Counts (under the null hypothesis)", startCol=3+4, startRow=3, rowNames=FALSE)
        addStyle(wb,sheet,style=boldStyle,rows=c(1,3),cols=3+4)
        writeDataTable(wb,sheet=sheet,x=as.data.frame(expected), startCol=3+4, startRow=5, rowNames=TRUE,tableStyle = "TableStyleLight8")
        
        offset1<-1+ncol(expected)
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
      
      observeEvent(input[["chi2FishersData"]], {
        xlfile <- input[["chi2FishersData"]][["datapath"]]
        ext <- tolower(tools::file_ext(xlfile))
        if(ext == "xlsx") {
          sheets <- excel_sheets(xlfile)
          if(length(sheets) == 1L) {
            Dat1ab(read_xlsx(input[["chi2FishersData"]][["datapath"]], sheet = 1L))
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
        if(read_xlsx(input[["chi2FishersData"]][["datapath"]], sheet = input[["sheet"]])[1,1] != "Chi2FisherExact"){
          sendSweetAlert(
            session,
            title = "Incorrect File",
            text = "Not a Chi-Square/Fisher's Exact Test Analysis File. Please upload an analysis file compatible with the Chi-Square/Fisher's Exact Test Tool.",
            type = "error",
            btn_colors="#5f5f62"
          )
        }else{
          Dat1ab(read_xlsx(input[["chi2FishersData"]][["datapath"]], sheet = input[["sheet"]]))
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
          updateRadioButtons(session,"testType",selected=options[52])
          updateSelectInput(session,"palette",selected=options[49])
            updateTextInput(session,"outcomeLabel3",value=options[4])
            updateTextInput(session,"predLabel3",value=options[7])
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
          
        }
      })
      
      
      
      
      
      
      
      
      
      
      
      
      
      observeEvent(
        input$snip2a1,{ showModal(modalDialog( tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), column(width = 12,
                                                                                                                                                                      h3("Hypotheses"),
                                                                                                                                                                      "The null hypothesis for a contingency table test like a chi-square test or a Fisher's exact test is that the marginal distribution across the rows is independent of the marginal distribution across the columns. Under this null hypothesis, the probability of being in a given row is the same across all of the columns. Equivalently, the probability of being in a given column is the same across all of the rows. More simply put, it doesn't matter what column you are in, you always have the same probability of being in a given row.",
                                                                                                                                                                      br(), br() ) ) )) })
      observeEvent(
        input$snip2a2,{showModal(modalDialog(tags$div(style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                                                      h3("Hypotheses"), tags$iframe(width="600", height="400",
                                                                                    src = "snip2a2.mp4",
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
                style = "height: 400px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Data"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
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
                style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Model Assumptions"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip2c2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      observeEvent(
        input$snip2d1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Test Output"), ##### Change this one every time and text below
                               "The chi-square test itself gives a test-statistic value, called the chi-square value or just chi-square, as can be seen in the 'Test Results' 
                               table if you've chosen the chi-square test. Paired with its degrees of freedom, or DF, which is calculated from the sample size, 
                               the chi-square test calculates a p-value. The p-value can be interpretted as 'the probability of observing our results or something 
                               more extreme if the null hympothesis is true'. So, the smaller the p-value, the less likely it is that the null hypothesis is true. 
                               We usually use a cut off of p<0.05 as the criteria to reject the null hypothesis. All of this still applies if you've chosen Fisher's 
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
                style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Test Output"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
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
           "There are many ways to graphically display your results. The option you choose will likely depend on how many rows and columns you have in your table and what your clinical question of interest is. You may want to use a forest plot for odds ratios or rate ratios with 95% confidence intervals. Another option would be a stacked bar chart with one bar per table column. That's the plot we've included here. We shy away from pie charts because humans perceive length or distance, as in bar charts and forest plots, better than they perceive area or angle, as in a pie chart.",
           
           
                               br(), br() ) ) )) })
      observeEvent(
        input$snip2e2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Tables and Figures for Publication"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
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
                style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Saving your Work Reproducibly"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip1g2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      

      
      
      
      
    }
  )    
}



