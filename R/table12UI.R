# Module UI function
table12UI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           
           br(),
           column(width=10,
                  h2("Data")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip6a1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip6a2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )),
           br(),
           br(),
           br(),
           
           column(width=12,
          
                  "Enter your data below of learn more using the buttons next to 'Learn:' to the right.",
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
                                                    
                                                
                                                
                                                
                                                column(3,
                                                       numericInput(ns("numDataRows"),"Data Rows (observations)",value=10,min=2,step=1,width="100px")
                                                ),
                                                column(3,
                                                       numericInput(ns("numDataCols"),"Numeric Variables",value=2,min=1,step=1,width="100px")
                                                ),
                                                column(6,
                                                       numericInput(ns("catDataCols"),"Categorical Variables",value=3,min=1,step=1,width="100px")
                                                ),
                                                br(),
                                                br(),
                                                    
                                         column(12, 
                                                style="background-color: white",
                                                matrixInput(
                                                  inputId = ns("matrix1b"),
                                                  label = "Enter numeric variables",
                                                  value = matrix(
                                                    cbind(
                                                      c(35.74,
                                                        33.84,
                                                        29.99,
                                                        31.75,
                                                        34.09,
                                                        32.28,
                                                        29.16,
                                                        30.77,
                                                        30.61,
                                                        28.49),
                                                      
                                                      c(47,
                                                        53,
                                                        38,
                                                        41,
                                                        46,
                                                        56,
                                                        37,
                                                        46,
                                                        52,
                                                        43)),
                                                      ncol=2,
                                                      
                                                      dimnames=list(
                                                        NULL,
                                                        c("BMI","Age")
                                                      )),
                                                    
                                                    class = "numeric",
                                                    cols = list(
                                                      names = TRUE,
                                                      extend=FALSE,
                                                      editableNames = TRUE
                                                    ),
                                                    rows = list(
                                                      names = FALSE,
                                                      extend=FALSE,
                                                      delta=1
                                                    )#,
                                                    #cells = list(editableCells = FALSE)
                                                  )
                                                ),
                                         
                                         br(),
                                        
                                         
                                         
                                         column(12, 
                                                style="background-color: white",
                                                matrixInput(
                                                  inputId = ns("matrix1c"),
                                                  label = "Enter categorical variables",
                                                  value = matrix(
                                                   
                                                      cbind(c("Male",
                                                        "Male",
                                                        "Female",
                                                        "Male",
                                                        "Male",
                                                        "Female",
                                                        "Female",
                                                        "Male",
                                                        "Male",
                                                        "Female"),
                                                        c("African American",
                                                          "Asian",
                                                          "Caucasian",
                                                          "Hispanic",
                                                          "African American",
                                                          "Hispanic",
                                                          "Caucasian",
                                                          "Asian",
                                                          "Hispanic",
                                                          "African American"
                                                          ),
                                                        c("Treatment",
                                                          "Treatment",
                                                          "Treatment",
                                                          "Treatment",
                                                          "Treatment",
                                                          "Control",
                                                          "Control",
                                                          "Control",
                                                          "Control",
                                                          "Control"
                                                          )
                                                      )
                                                   ,
                                                    ncol=3,
                                                    
                                                    dimnames=list(
                                                      NULL,
                                                      c("Sex","Race","Study Group")
                                                    )),
                                                  
                                                  class = "character",
                                                  cols = list(
                                                    names = TRUE,
                                                    extend=FALSE,
                                                    editableNames = TRUE
                                                  ),
                                                  rows = list(
                                                    names = FALSE,
                                                    extend=FALSE,
                                                    delta=1
                                                  )#,
                                                  #cells = list(editableCells = FALSE)
                                                )
                                         ),
                                         
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
                                                h3("Paste Data"),
                                                "Paste one or more columns of numeric or categorical data from Excel by copying an area of a spreadsheet (can be multiple columns and rows all at once) and pasting it in the field below. The first/top row should contain column/variable labels. After pasting, look at the table below the paste field to see that your data have been read in correctly.",
                                                br(),
                                                br(),
                                                
                                            

                                                column(12,
                                                       textAreaInput(ns("matrix1a2in"),"Paste data here.",
                                                                     value="Num Var 1\tNum Var 2\tCat Var 3\n1\t2\tA\n3\t4\tB",width="400px",height="400px",cols=3),
                                                      
                                                      br(),
                                                      br(),
   
                                                ),
                                                br(),
                                                br(),
                                                
                                                
                                                h2("The Following Data Have Been Read"),
                                                DTOutput(ns("matrix12")),
                                                
                                                
                                                br(),
                                                
                                                
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
                                                h3("Upload Data"),
                                                "Select your analysis file and upload it below. You can download an example dataset to see its formatting by clicking this link:",
                                                br(),
                                                br(),
                                                tags$a(href="table1In.xlsx",download="table1In.xlsx",
                                                       "Example Analysis File for Descriptive Statistics Tables",target="_blank"),
                                                br(),
                                                br(),
                                                "You can also use the Analysis file saved after using this tool previously. This is the tab named 'Analysis' in the reproducible file you downladed. The fact that you can upload that file and get the exact same results is what makes this reproducible research (see last section).",
                                                
                                                br(),
                                                br(),
                                                fileInput(ns("table1Data"),"Enter data file location",accept=".xlsx"),
                                                br(),
                                                br(),
                                         
                                                
                                                
                                                DTOutput(ns("matrix1")),
                                                
                                                
                                                br(),
                                                
                                              
                                                br(),
                                                
                                                
                                                
                                                br()
                                                
                                                
                                                
                                                
                                                
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
                                                "Enter your data by hand here. Or, click on Upload Data or Paste Data to upload or paste your data from Excel.",
                                                br(),
                                                br(),
                                                
                                                
                                                
                                                
                                                column(3,
                                                       numericInput(ns("numDataRows4"),"Data Rows (observations)",value=2,min=2,step=1,width="100px")
                                                ),
                                                column(3,
                                                       numericInput(ns("numDataCols4"),"Numeric Variables",value=2,min=1,step=1,width="100px")
                                                ),
                                                column(6,
                                                       numericInput(ns("catDataCols4"),"Categorical Variables",value=2,min=1,step=1,width="100px")
                                                ),
                                                br(),
                                                br(),
                                                
                                                column(12, 
                                                       style="background-color: white",
                                                       matrixInput(
                                                         inputId = ns("matrix1b4"),
                                                         label = "Enter numeric variables",
                                                         value = matrix(
                                                           cbind(
                                                             c(1,2),
                                                             
                                                             c(3,4)),
                                                           ncol=2,
                                                           
                                                           dimnames=list(
                                                             NULL,
                                                             c("Num Var 1","Num Var 2")
                                                           )),
                                                         
                                                         class = "numeric",
                                                         cols = list(
                                                           names = TRUE,
                                                           extend=FALSE,
                                                           editableNames = TRUE
                                                         ),
                                                         rows = list(
                                                           names = FALSE,
                                                           extend=FALSE,
                                                           delta=1
                                                         )#,
                                                         #cells = list(editableCells = FALSE)
                                                       )
                                                ),
                                                
                                                br(),
                                                
                                                
                                                
                                                column(12, 
                                                       style="background-color: white",
                                                       matrixInput(
                                                         inputId = ns("matrix1c4"),
                                                         label = "Enter categorical variables",
                                                         value = matrix(
                                                           
                                                           cbind(c("A",
                                                                   "B"),
                                                                 c("C",
                                                                   "D"
                                                                 )
                                                           )
                                                           ,
                                                           ncol=2,
                                                           
                                                           dimnames=list(
                                                             NULL,
                                                             c("Cat Var 1","Cat Var 2")
                                                           )),
                                                         
                                                         class = "character",
                                                         cols = list(
                                                           names = TRUE,
                                                           extend=FALSE,
                                                           editableNames = TRUE
                                                         ),
                                                         rows = list(
                                                           names = FALSE,
                                                           extend=FALSE,
                                                           delta=1
                                                         )#,
                                                         #cells = list(editableCells = FALSE)
                                                       )
                                                ),
                                                
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
    

    
    
    
    
    
    column(12, style = "background-color: white; border-radius: 5px; ",
           
           br(),
           column(width=10,
                  h2("Table for Publication")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip6e1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip1e2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;"),
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                         
                  )),
                  
           #),
           br(),
           br(),
           br(),
           
           
           column(width=12,
                  br(),
                  "The following table is a publication-worthy way to display your results. For an interpretation and write up of these results, see the next section. To stratify your table, select a stratifying variable below.",
                  br(),
                  br(),
                  br(),
                  selectInput(ns("stratifier"),"Select Stratifying Variable",choices=c("Sex","Race","Study Group","No Stratification"),selected="Study Group"),
                  br(),
                  br(),
                  br(),
                  "Note: If your table is treating numeric values as categories and assigning them percentages rather than means, medians, etc., you need to open your Analysis file is Excel and reformat the numbers with a number format, rather than some other format. Then, resave the Analysis file and upload it into this tool again.",
                  br(),
                  br(),
                  br(),
                  h4("Table1. Baseline Sample Characteristics"),
                  tableOutput(ns("table1Table2")),
                  br(),
                  br(),
           ),
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
                         actionButton(ns("snip6g1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         actionButton(ns("snip6g2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
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
    )
    )
  
    
    
    
    
    
    #column(12, style = " background-color: white; border-radius: 5px; ",
    #       h2("Write-Up"),
    #       h3("Methods"),
    #       "The following is an example of what one might write about this test in the methods section of a paper. 
    #   This example uses the BMI data and test present when this page loads. Refresh this page to see it again if 
    #   you've changed anything along the way.",
    #       br(),
    #       br(),
    #       em("An unequal-variances (Welch's) t-test compared mean BMI in the treatment group to that of 
    #   the control group using a two-tailed type I error rate of \u03B1 = 0.05. The distributional assumption of 
    #   normality was examined graphically using histograms."),
    #       br(),
    #       br(),
    #       h3("Results"),
    #       "The following is an example of what one might write about the results of this test in the results section of a paper. 
    #   This example uses the BMI data and test present when this page loads. Refresh this page to see it again if 
    #   you've changed anything along the way.",
    #       br(),
    #       br(),
    #       em("The mean BMI in the control group was 31.56 kg/m",tags$sup("2"),", with a 95% confidence interval of 
    #      30.6 kg/m",tags$sup("2")," to 32.52 kg/m",tags$sup("2"),". In the treatment group, the mean was
    #      27.83 kg/m",tags$sup("2"),", with a 95% confidence interval of 
    #      26.83 kg/m",tags$sup("2")," to 28.82 kg/m",tags$sup("2"),". Mean BMI differed significantly between the 
    #      two groups (p<0.0001), as the treatment group mean was 3.73 kg/m",tags$sup("2")," lower than the control 
    #      group mean, with a 95% confidence interval of 1.82 kg/m",tags$sup("2")," lower to 5.64 kg/m",tags$sup("2")," lower."),
    #       
    #       
    #       br(),
    #       br(),
    #       br()
    #),
    #column(12,
    #       br(),
    #       br(),
    #       br()
    #)
  
  
  
  
  
  
  
  
  
}








table12Server <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      version<-reactive({
        1.1
      })
      
      
      
#      observeEvent(c(input$numDataCols,input$numDataRows),{
#        colnms<-vector(length=input$numDataCols)
#        for(j in 1:input$numDataCols){
#          colnms[j]<-paste("Num. Var.",j)
#        }
#        if(input$numDataCols==2 & input$numDataRows==10){
#          updateMatrixInput(session,"matrix1b",value= matrix(
#            cbind(
#              c(35.74,
#                33.84,
#                29.99,
#                31.75,
#                34.09,
#                32.28,
#                29.16,
#                30.77,
#                30.61,
#                28.49),
#              
#              c(47,
#                53,
#                38,
#                41,
#                46,
#                56,
#                37,
#                46,
#                52,
#                43)),
#            ncol=2,
#            
#            dimnames=list(
#              NULL,
#              c("BMI","Age")
#            )))
#        }else{
#          updateMatrixInput(session,"matrix1b",value= matrix(1,
#                                                             ncol=input$numDataCols,
#                                                             nrow=input$numDataRows,
#                                                             dimnames=list(
#                                                               NULL, colnms
#                                                             )))
#        }
#        
#      })
#      
#      
#      
#      observeEvent(c(input$catDataCols,input$numDataRows),{
#        colnms<-vector(length=input$catDataCols)
#        for(j in 1:input$catDataCols){
#          colnms[j]<-paste("Cat. Var.",j)
#        }
#         if(input$catDataCols==3 & input$numDataRows==10){
#           updateMatrixInput(session,"matrix1c",value= matrix(
#             
#             cbind(c("Male",
#                     "Male",
#                     "Female",
#                     "Male",
#                     "Male",
#                     "Female",
#                     "Female",
#                     "Male",
#                     "Male",
#                     "Female"),
#                   c("African American",
#                     "Asian",
#                     "Caucasian",
#                     "Hispanic",
#                     "African American",
#                     "Hispanic",
#                     "Caucasian",
#                     "Asian",
#                     "Hispanic",
#                     "African American"
#                   ),
#                   c("Treatment",
#                     "Treatment",
#                     "Treatment",
#                     "Treatment",
#                     "Treatment",
#                     "Control",
#                     "Control",
#                     "Control",
#                     "Control",
#                     "Control"
#                   )
#             )
#             ,
#             ncol=3,
#             
#             dimnames=list(
#               NULL,
#               c("Sex","Race","Study Group")
#             )))
#         }else{
#        updateMatrixInput(session,"matrix1c",value= matrix(1,
#                                                           ncol=input$catDataCols,
#                                                           nrow=input$numDataRows,
#                                                           dimnames=list(
#                                                             NULL, colnms
#                                                           )))
#         }
#        
#      })
#      
#      
#      
      
 #    observeEvent(c(input$numDataCols2,input$numDataRows3),{
 #      colnms<-vector(length=input$numDataCols2)
 #      for(j in 1:input$numDataCols2){
 #        colnms[j]<-paste("Num. Var.",j)
 #      }
 #      if(input$numDataCols2==2 & input$numDataRows3==10){
 #        updateMatrixInput(session,"matrix1b2",value= matrix(
 #          cbind(
 #            c(35.74,
 #              33.84,
 #              29.99,
 #              31.75,
 #              34.09,
 #              32.28,
 #              29.16,
 #              30.77,
 #              30.61,
 #              28.49),
 #            
 #            c(47,
 #              53,
 #              38,
 #              41,
 #              46,
 #              56,
 #              37,
 #              46,
 #              52,
 #              43)),
 #          ncol=2,
 #          
 #          dimnames=list(
 #            NULL,
 #            c("BMI","Age")
 #          )))
 #      }else{
 #        updateMatrixInput(session,"matrix1b2",value= matrix(1,
 #                                                           ncol=input$numDataCols2,
 #                                                           nrow=input$numDataRows3,
 #                                                           dimnames=list(
 #                                                             NULL, colnms
 #                                                           )))
 #      }
 #      
 #    })
 #    
 #    
 #    
 #    observeEvent(c(input$catDataCols2,input$numDataRows3),{
 #      colnms<-vector(length=input$catDataCols2)
 #      for(j in 1:input$catDataCols2){
 #        colnms[j]<-paste("Cat. Var.",j)
 #      }
 #      if(input$catDataCols2==3 & input$numDataRows3==10){
 #        updateMatrixInput(session,"matrix1c2",value= matrix(
 #          
 #          cbind(c("Male",
 #                  "Male",
 #                  "Female",
 #                  "Male",
 #                  "Male",
 #                  "Female",
 #                  "Female",
 #                  "Male",
 #                  "Male",
 #                  "Female"),
 #                c("African American",
 #                  "Asian",
 #                  "Caucasian",
 #                  "Hispanic",
 #                  "African American",
 #                  "Hispanic",
 #                  "Caucasian",
 #                  "Asian",
 #                  "Hispanic",
 #                  "African American"
 #                ),
 #                c("Treatment",
 #                  "Treatment",
 #                  "Treatment",
 #                  "Treatment",
 #                  "Treatment",
 #                  "Control",
 #                  "Control",
 #                  "Control",
 #                  "Control",
 #                  "Control"
 #                )
 #          )
 #          ,
 #          ncol=3,
 #          
 #          dimnames=list(
 #            NULL,
 #            c("Sex","Race","Study Group")
 #          )))
 #      }else{
 #        updateMatrixInput(session,"matrix1c2",value= matrix(1,
 #                                                           ncol=input$catDataCols2,
 #                                                           nrow=input$numDataRows3,
 #                                                           dimnames=list(
 #                                                             NULL, colnms
 #                                                           )))
 #      }
 #      
 #    })
      
      ##################################################
      ##    These observers allow the now number and column number inputs to change the sizes of the matrices for the example data tab (input$dataInput=1) and for the Enter Data by Hand tab (input$dataInput=4)
      observeEvent(c(input$numDataCols,input$numDataRows),{
        matrix1bin<-input$matrix1b
        excessCols<-input$numDataCols-ncol(matrix1bin)
        excessRows<-input$numDataRows-nrow(matrix1bin)
        
        if(excessCols>=0 && excessRows>=0){
          tempRows<-nrow(matrix1bin)
          temp1<-matrix(0,nrow=tempRows,ncol=excessCols)
          temp2<-cbind(matrix1bin,temp1)
          temp3<-matrix(0,nrow=excessRows,ncol=ncol(temp2))
          temp4<-rbind(temp2,temp3)
        }
        
        if(excessCols<0){
          temp4<-matrix1bin[,1:input$numDataCols]
        }
        
        if(excessRows<0){
          temp4<-matrix1bin[1:input$numDataRows,]
        }

        updateMatrixInput(session,"matrix1b",value= matrix(temp4,
                                                            ncol=input$numDataCols,
                                                            nrow=input$numDataRows,
                                                            dimnames=list(
                                                              NULL, colnames(temp4)
                                                            )))
 
      })
      
      
      observeEvent(c(input$catDataCols,input$numDataRows),{
        matrix1cin<-input$matrix1c
        excessCols<-input$catDataCols-ncol(matrix1cin)
        excessRows<-input$numDataRows-nrow(matrix1cin)
        
        if(excessCols>=0 && excessRows>=0){
          tempRows<-nrow(matrix1cin)
          temp1<-matrix(0,nrow=tempRows,ncol=excessCols)
          temp2<-cbind(matrix1cin,temp1)
          temp3<-matrix(0,nrow=excessRows,ncol=ncol(temp2))
          temp4<-rbind(temp2,temp3)
        }
        
        if(excessCols<0){
          temp4<-matrix1cin[,1:input$catDataCols]
        }
        
        if(excessRows<0){
          temp4<-matrix1cin[1:input$numDataRows,]
        }

        updateMatrixInput(session,"matrix1c",value= matrix(temp4,
                                                            ncol=input$catDataCols,
                                                            nrow=input$numDataRows,
                                                            dimnames=list(
                                                              NULL, colnames(temp4)
                                                            )))
  
      })
      
      
      observeEvent(c(input$numDataCols4,input$numDataRows4),{
        matrix1b4in<-input$matrix1b4
        excessCols<-input$numDataCols4-ncol(matrix1b4in)
        excessRows<-input$numDataRows4-nrow(matrix1b4in)
        
        if(excessCols>=0 && excessRows>=0){
          tempRows<-nrow(matrix1b4in)
          temp1<-matrix(0,nrow=tempRows,ncol=excessCols)
          temp2<-cbind(matrix1b4in,temp1)
          temp3<-matrix(0,nrow=excessRows,ncol=ncol(temp2))
          temp4<-rbind(temp2,temp3)
        }
        
        if(excessCols<0){
          temp4<-matrix1b4in[,1:input$numDataCols4]
        }

        if(excessRows<0){
          temp4<-matrix1b4in[1:input$numDataRows4,]
        }

          updateMatrixInput(session,"matrix1b4",value= matrix(temp4,
                                                             ncol=input$numDataCols4,
                                                             nrow=input$numDataRows4,
                                                             dimnames=list(
                                                               NULL, colnames(temp4)
                                                             )))
        
      })
      
      observeEvent(c(input$catDataCols4,input$numDataRows4),{
        matrix1c4in<-input$matrix1c4
        excessCols<-input$catDataCols4-ncol(matrix1c4in)
        excessRows<-input$numDataRows4-nrow(matrix1c4in)
        
        if(excessCols>=0 && excessRows>=0){
          tempRows<-nrow(matrix1c4in)
          temp1<-matrix(0,nrow=tempRows,ncol=excessCols)
          temp2<-cbind(matrix1c4in,temp1)
          temp3<-matrix(0,nrow=excessRows,ncol=ncol(temp2))
          temp4<-rbind(temp2,temp3)
        }
        
        if(excessCols<0){
          temp4<-matrix1c4in[,1:input$catDataCols4]
        }
        
        if(excessRows<0){
          temp4<-matrix1c4in[1:input$numDataRows4,]
        }

        updateMatrixInput(session,"matrix1c4",value= matrix(temp4,
                                                            ncol=input$catDataCols4,
                                                            nrow=input$numDataRows4,
                                                            dimnames=list(
                                                              NULL, colnames(temp4)
                                                            )))
        
      })
      
      
 #     observeEvent(c(input$catDataCols,input$numDataRows),{
 #       colnms<-vector(length=input$catDataCols)
 #       for(j in 1:input$catDataCols){
 #         colnms[j]<-paste("Cat. Var.",j)
 #       }
 #       if(input$catDataCols==3 & input$numDataRows==10){
 #         updateMatrixInput(session,"matrix1c",value= matrix(
 #           
 #           cbind(c("Male",
 #                   "Male",
 #                   "Female",
 #                   "Male",
 #                   "Male",
 #                   "Female",
 #                   "Female",
 #                   "Male",
 #                   "Male",
 #                   "Female"),
 #                 c("African American",
 #                   "Asian",
 #                   "Caucasian",
 #                   "Hispanic",
 #                   "African American",
 #                   "Hispanic",
 #                   "Caucasian",
 #                   "Asian",
 #                   "Hispanic",
 #                   "African American"
 #                 ),
 #                 c("Treatment",
 #                   "Treatment",
 #                   "Treatment",
 #                   "Treatment",
 #                   "Treatment",
 #                   "Control",
 #                   "Control",
 #                   "Control",
 #                   "Control",
 #                   "Control"
 #                 )
 #           )
 #           ,
 #           ncol=3,
 #           
 #           dimnames=list(
 #             NULL,
 #             c("Sex","Race","Study Group")
 #           )))
 #       }else{
 #         updateMatrixInput(session,"matrix1c",value= matrix(1,
 #                                                            ncol=input$catDataCols,
 #                                                            nrow=input$numDataRows,
 #                                                            dimnames=list(
 #                                                              NULL, colnms
 #                                                            )))
 #       }
 #       
 #     })
 #     
      
      
      
      
      
      
      
#    
#    
#    
#    matrix1_1<-reactive({
#      
#      mat1<-matrix(
#        cbind(
#          c(35.74,
#            33.84,
#            29.99,
#            31.75,
#            34.09,
#            32.28,
#            29.16,
#            30.77,
#            30.61,
#            28.49),
#          
#          c(47,
#            53,
#            38,
#            41,
#            46,
#            56,
#            37,
#            46,
#            52,
#            43)),
#        ncol=2,
#        
#        dimnames=list(
#          NULL,
#          c("BMI","Age")
#        ))
#      
#      
#      mat2<-matrix(
#        
#        cbind(c("Male",
#                "Male",
#                "Female",
#                "Male",
#                "Male",
#                "Female",
#                "Female",
#                "Male",
#                "Male",
#                "Female"),
#              c("African American",
#                "Asian",
#                "Caucasian",
#                "Hispanic",
#                "African American",
#                "Hispanic",
#                "Caucasian",
#                "Asian",
#                "Hispanic",
#                "African American"
#              ),
#              c("Treatment",
#                "Treatment",
#                "Treatment",
#                "Treatment",
#                "Treatment",
#                "Control",
#                "Control",
#                "Control",
#                "Control",
#                "Control"
#              )
#        )
#        ,
#        ncol=3,
#        
#        dimnames=list(
#          NULL,
#          c("Sex","Race","Study Group")
#        ))
#      
#      mat<-cbind(mat1,mat2)
#      
#      mat
#      

#      
#      
#    })
      
      
      output$matrix1<-renderDT({
        req(Dat1b())
        Dat1b()
      },editable='all')
      
      
      output$matrix12<-renderDT({
        req(Dat1b2())
        Dat1b2()
      },editable='all')
      


      ########################################
      ##    This observer updates the stratifier selector when a different input$dataInput tab is selected
      observeEvent(input$dataInput,{
        #req(input$dataInput)
        if(input$dataInput==1){
          updateSelectInput(session,"stratifier",label="Select Stratifying Variable",choices=c(colnames(input$matrix1c),"No Stratification"),selected="Study Group")
        }
        if(input$dataInput==2){
          req(Dat1b2())
          updateSelectInput(session,"stratifier",label="Select Stratifying Variable",choices=c(colnames(Dat1b2()),"No Stratification"))
        }
        if(input$dataInput==3){
          req(Dat1b())
          updateSelectInput(session,"stratifier",label="Select Stratifying Variable",choices=c(colnames(Dat1b()),"No Stratification"))
        }
        if(input$dataInput==4){
          updateSelectInput(session,"stratifier",label="Select Stratifying Variable",choices=c(colnames(matrix1c()),"No Stratification"))
        }
      })
      
      
      
      stratifier<-reactive({
        input$stratifier
      })
      
      
      matrix1b<-reactive({
        if(input$dataInput != 2){
          matrix1b<-input$matrix1b
          matrix1b2<-input$matrix1b2
          if(input$dataInput==1){
            matrix1bOut<-matrix1b
          }
          if(input$dataInput==3){
            #req(Dat1ab())
            matrix1bOut<-matrix1b2
          }
          if(input$dataInput==4){
            #req(Dat1ab())
            matrix1bOut<-input$matrix1b4
          }
          matrix1bOut
        }
      })
      
      matrix1c<-reactive({
        if(input$dataInput != 2){
          matrix1c<-input$matrix1c
          matrix1c2<-input$matrix1c2
          if(input$dataInput==1){
            matrix1cOut<-matrix1c
          }
          if(input$dataInput==3){
            #req(Dat1ab())
            matrix1cOut<-matrix1c2
          }
          if(input$dataInput==4){
            #req(Dat1ab())
            matrix1cOut<-input$matrix1c4
          }
          matrix1cOut
        }
      })
    

      
      matrix1a<-reactive({
        if(input$dataInput==1){
          stratifier<-input$stratifier
          matrix1c<-input$matrix1c
          if(stratifier=="No Stratification") matrix1a<-NULL
          if(stratifier !="No Stratification") matrix1a<-matrix1c[,which(colnames(matrix1c)==stratifier)]
          matrix1a
        }
        if(input$dataInput==4){
          stratifier<-stratifier()
          matrix1c<-matrix1c()
          if(stratifier=="No Stratification") matrix1a<-NULL
          if(stratifier !="No Stratification") matrix1a<-matrix1c[,which(colnames(matrix1c)==stratifier)]
          matrix1a
        }
      })
      


      
      
      table1Table2a<-reactive({
        matrix1a<-matrix1a()
        matrix1b<-matrix1b()
        matrix1c<-matrix1c()
        stratifier<-stratifier()

        if(input$dataInput==1){
          #matrix1a<-matrix1a()
          matrix1b<-input$matrix1b
          matrix1c<-input$matrix1c
          stratifier<-stratifier()
          if(stratifier !="No Stratification"){
            #matrix1d<-matrix1c[,-which(colnames(matrix1c)==stratifier)]
            #matrix1a<-matrix1c[,which(colnames(matrix1c)==stratifier)]
            mat<-data.frame(matrix1b,matrix1c)
            colnames(mat)<-c(colnames(matrix1b),colnames(matrix1c))
            mat2<-mat[,!(names(mat) %in% stratifier)]
            #mat2<-as.matrix(matrix1a,ncol=1)
            mat<-mat[,names(mat) %in% stratifier]
            
            
            tab<-table1(
              ~ .| mat,
              data=mat2,
              #labels=labs,
              groupspan = NULL,
              rowlabelhead = "",
              transpose = FALSE,
              topclass = "Rtable1",
              footnote = NULL,
              caption = NULL,
              render = render.default,
              render.strat = render.strat.default,
              extra.col = NULL,
              extra.col.pos = NULL
            )
          }
          if(stratifier=="No Stratification"){
            mat<-data.frame(matrix1b,matrix1c)
            
            colnames(mat)<-c(colnames(matrix1b),colnames(matrix1c))
            tab<-table1(
              ~ .,
              data=mat,
              #labels=labs,
              groupspan = NULL,
              rowlabelhead = "",
              transpose = FALSE,
              topclass = "Rtable1",
              footnote = NULL,
              caption = NULL,
              render = render.default,
              render.strat = render.strat.default,
              extra.col = NULL,
              extra.col.pos = NULL
            )
          }
        }

        if(input$dataInput==2){
          req(Dat1b2())
          mat3<-Dat1b2()
          

          if(stratifier !="No Stratification"){
            mat<-mat3[,-which(colnames(mat3)==stratifier)]
            mat2<-mat3[,which(colnames(mat3)==stratifier)]
            
            tab<-table1(
              ~ .| mat2,
              data=mat,
              #labels=labs,
              groupspan = NULL,
              rowlabelhead = "",
              transpose = FALSE,
              topclass = "Rtable1",
              footnote = NULL,
              caption = NULL,
              render = render.default,
              render.strat = render.strat.default,
              extra.col = NULL,
              extra.col.pos = NULL
            )
          }
          if(stratifier=="No Stratification"){
            tab<-table1(
              ~ .,
              data=mat3,
              #labels=labs,
              groupspan = NULL,
              rowlabelhead = "",
              transpose = FALSE,
              topclass = "Rtable1",
              footnote = NULL,
              caption = NULL,
              render = render.default,
              render.strat = render.strat.default,
              extra.col = NULL,
              extra.col.pos = NULL
            )
          }  
          
        }
        
        if(input$dataInput==3){
          req(Dat1b())
          mat3<-Dat1b()
          
          
          if(stratifier !="No Stratification"){
            mat<-mat3[,-which(colnames(mat3)==stratifier)]
            mat2<-mat3[,which(colnames(mat3)==stratifier)]

            tab<-table1(
              ~ .| mat2,
              data=mat,
              #labels=labs,
              groupspan = NULL,
              rowlabelhead = "",
              transpose = FALSE,
              topclass = "Rtable1",
              footnote = NULL,
              caption = NULL,
              render = render.default,
              render.strat = render.strat.default,
              extra.col = NULL,
              extra.col.pos = NULL
            )
          }
          if(stratifier=="No Stratification"){
            tab<-table1(
              ~ .,
              data=mat3,
              #labels=labs,
              groupspan = NULL,
              rowlabelhead = "",
              transpose = FALSE,
              topclass = "Rtable1",
              footnote = NULL,
              caption = NULL,
              render = render.default,
              render.strat = render.strat.default,
              extra.col = NULL,
              extra.col.pos = NULL
            )
          }  
          
        }
        
        if(input$dataInput==4){
          matrix1b<-input$matrix1b4
          matrix1c<-input$matrix1c4
          stratifier<-stratifier()
          if(stratifier !="No Stratification"){
            mat<-data.frame(matrix1b,matrix1c)
            colnames(mat)<-c(colnames(matrix1b),colnames(matrix1c))
            mat2<-mat[,!(names(mat) %in% stratifier)]
            mat<-mat[,names(mat) %in% stratifier]
            
            
            tab<-table1(
              ~ .| mat,
              data=mat2,
              #labels=labs,
              groupspan = NULL,
              rowlabelhead = "",
              transpose = FALSE,
              topclass = "Rtable1",
              footnote = NULL,
              caption = NULL,
              render = render.default,
              render.strat = render.strat.default,
              extra.col = NULL,
              extra.col.pos = NULL
            )
          }
          if(stratifier=="No Stratification"){
            mat<-data.frame(matrix1b,matrix1c)
            
            colnames(mat)<-c(colnames(matrix1b),colnames(matrix1c))
            tab<-table1(
              ~ .,
              data=mat,
              #labels=labs,
              groupspan = NULL,
              rowlabelhead = "",
              transpose = FALSE,
              topclass = "Rtable1",
              footnote = NULL,
              caption = NULL,
              render = render.default,
              render.strat = render.strat.default,
              extra.col = NULL,
              extra.col.pos = NULL
            )
          }
        }
       

        tab
        
      })
      
      output$table1Table2<-renderUI({
        if(input$dataInput==3){
          req(Dat1ab())
        }
        if(input$dataInput==2){
          req(Dat1b2())
        }
        table1Table2a()
      })
      
      
      
      
      
      
      output$downloadData<-downloadHandler(filename=function(){
        paste0(tempdir(), "/", "table1Out.xlsx")
      },
      content=function(file){
        

        matrix1b<-matrix1b()
        matrix1c<-matrix1c()
        dataRows<-nrow(matrix1b)
        numDataCols<-ncol(matrix1b)
        catDataCols<-ncol(matrix1c)
        dat<-cbind(matrix1b,matrix1c)
        
        matrix1b4<-input$matrix1b4
        matrix1c4<-input$matrix1c4
        dataRows4<-nrow(matrix1b4)
        numDataCols4<-ncol(matrix1b4)
        catDataCols4<-ncol(matrix1c4)
        dat4<-cbind(matrix1b4,matrix1c4)

        stratifier<-stratifier()
        
        wb = createWorkbook()
        
        sheet = addWorksheet(wb, "Analysis",gridLines = FALSE)
        
        col11<-matrix(c("Descriptive Tables"),ncol=1)
        colnames(col11)<-"Tool:"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(col11), startCol=1, startRow=1, rowNames=FALSE)
        
        col12<-matrix(stratifier)
        colnames(col12)<-"Stratifier:"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(col12), startCol=1, startRow=4, rowNames=FALSE)
        dataValidation(wb, sheet, col = 1, rows = 5, type = "list", value = "'Analysis'!$B$1:$IV$1")
        
        hiddenStyle<-createStyle(fontColour ='white',hidden=TRUE)
        writeData(wb,sheet,x="No Stratification",startRow = 1,startCol = 256)
        addStyle(wb,sheet,style=hiddenStyle,rows=1,cols=256)
        
        
        if(input$dataInput==1) writeDat<-dat
        if(input$dataInput==2) writeDat<-Dat1b2()
        if(input$dataInput==3) writeDat<-Dat1b()
        if(input$dataInput==4) writeDat<-Dat1b()
        
        
        writeDataTable(wb,sheet=sheet,x=as.data.frame(writeDat), startCol=2,startRow = 1, rowNames=FALSE,tableStyle = "TableStyleLight8")
        
        sheet = addWorksheet(wb, "Tabular Output",gridLines = FALSE)
        
        

                
        header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny"),ncol=1)
        colnames(header)<-"General Information"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header), startCol=1, startRow=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        header2<-matrix(c("Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus"),ncol=1)
        colnames(header2)<-"Creator"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header2), startCol=1, startRow=8, rowNames=FALSE)
        
        header3<-matrix(c("Descriptive Statistics: Numbers and Tables","Core R Packages and Functions: table1{table1}"),ncol=1)
        colnames(header3)<-"Tool"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header3), startCol=1, startRow=15, rowNames=FALSE)
        
        table1<-table1Table2a()
        df<-as.data.frame(read_html(table1) %>% html_table(fill=TRUE))
        
        
        N<-matrix(c("N",sub("[^.]+\\.+[^.]+\\.([^.]+)\\..*", "\\1", colnames(df)[-1])),nrow=1)
        
        colLabels<-matrix(c("",sub("([^.]+)\\..*", "\\1", colnames(df)[-1])),nrow=1)
        
        
        df2<-as.data.frame(rbind(N,as.matrix(df)))
        
        colnames(df2)<-colLabels
        
        for(j in 1:nrow(df2)){
          if(df2[j,2] !="") df2[j,1]<-paste("     ",df2[j,1],sep="")
        }
        
        
        headStyle<-createStyle(border = "TopBottom", borderColour ='black', borderStyle="thick",textDecoration = "bold")
        bottomStyle<-createStyle(border="Bottom",borderStyle="thick")
        boldStyle<-createStyle(textDecoration = "bold")
     #     border = NULL,
     #     borderColour = openxlsx_getOp("borderColour", "black"),
     #     borderStyle = openxlsx_getOp("borderStyle", "thin"),
     #     locked = NULL
     #   )
        
        writeData(wb,sheet=sheet,x="Table for Publication", startCol=5, startRow=1, rowNames=FALSE)
        addStyle(wb,sheet,style=boldStyle,rows=1,cols=5)
        #writeDataTable(wb,sheet=sheet,x=df2, startCol=5, startRow=3, rowNames=FALSE,headerStyle = headStyle,#tableStyle=tabStyle,
        #               withFilter = FALSE,bandedRows = FALSE)
        writeData(wb,sheet=sheet,x=df2, startCol=5, startRow=3, rowNames=FALSE)
        addStyle(wb,sheet,style=headStyle,rows=3,cols=c(5:(5+ncol(df2)-1)))
        addStyle(wb,sheet,style=bottomStyle,rows=3+nrow(df2),cols=c(5:(5+ncol(df2)-1)))
        
        
        setColWidths(wb,sheet,cols=c(1:256),widths = "auto")
        
        sheet = addWorksheet(wb, "Plot Output",gridLines = FALSE)
        
        writeData(wb,sheet=sheet,x="No plot output is generated with this tool.", startCol=2, startRow=2, rowNames=FALSE)
        addStyle(wb,sheet,style=boldStyle,rows=2,cols=2)
        

        saveWorkbook(wb, file,overwrite=TRUE)
        
      })
      
      
      
      
      
      
      Dat1ab <- reactiveVal()
      Dat1b <- reactiveVal()
      
      observeEvent(input[["table1Data"]], {
        xlfile <- input[["table1Data"]][["datapath"]]
        ext <- tolower(tools::file_ext(xlfile))
        if(ext == "xlsx") {
          sheets <- excel_sheets(xlfile)
          if(length(sheets) == 1L) {
            Dat1ab(read_xlsx(input[["table1Data"]][["datapath"]], sheet = 1L))
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
        if(read_xlsx(input[["table1Data"]][["datapath"]], sheet = input[["sheet"]])[1,1] != "Descriptive Tables"){
          sendSweetAlert(
            session,
            title = "Incorrect File",
            text = "Not a Descriptive Tables Analysis File. Please upload an analysis file compatible with the Descriptive Tables Tool.",
            type = "error",
            btn_colors="#5f5f62"
          )
        }else{
          Dat1ab(read_xlsx(input[["table1Data"]][["datapath"]], sheet = input[["sheet"]]))
          dat<-Dat1ab()
          options<-as.matrix(dat[,1])
          dat2<-as.data.frame(dat[,-1])
          #matrix1<-Dat1b()
          
          matrix12 <- lapply(dat2, function(col) {
            if (suppressWarnings(all(!is.na(as.numeric(as.character(col)))))) {
              as.numeric(as.character(col))
            } else {
              col
            }
          })
          
          #colnames(matrix12)<-colnames(dat2)
          
          
          updateSelectInput(session,"stratifier",choices=c(colnames(dat2),"No Stratification"),selected=options[4])
          
          Dat1b(dat2)
          
        }
      })
      
      
      
      
      Dat1ab2 <- reactiveVal()
      Dat1b2 <- reactiveVal()
      
      observeEvent(input[["matrix1a2in"]], {

          Dat1ab2(input$matrix1a2in)
          dat<-Dat1ab2()
          #dat2<-as.data.frame(dat[-1,])
          #clnms<-as.data.frame(dat[1,])
          rows<-unlist(strsplit(as.character(dat),split="\n"))
          df<-data.frame()
          for(j in 1:length(rows)){
            df<-rbind(df,unlist(strsplit(as.character(rows[j]),split="\t")))
          }
          
          clnms<-df[1,]
          
          matrix12<-df[-1,]
          
          #for(i in 1:nrow(matrix12)){
          #  for(j in 1:ncol(matrix12)){
          #    if(matrix12[i,j]=="") maxtrix12[i,j]<-NA
          #    if(matrix12[i,j]==" ") maxtrix12[i,j]<-NA
          #  }
          #}
          
          matrix12<-data.frame(matrix12)
          
          matrix12<-apply(matrix12, 2, function(x) gsub("^$|^ $", as.numeric(NA), x))
          
          matrix12<-data.frame((matrix12))

          matrix12 <- lapply(matrix12, function(col) {
            if (suppressWarnings(all(!is.na(as.numeric(as.character(na.omit(col))))))) {
              as.numeric(as.character(col))
            } else {
              col
            }
          })
          

          
          matrix12<-data.frame((matrix12))
          

          #matrix12 <- lapply(matrix12, function(col) {
          #  if (suppressWarnings(all(!is.na(as.numeric(as.character(col)))))) {
          #    as.numeric(as.character(col))
          #  } else {
          #    col
          #  }
          #})
          
          matrix12<-data.frame(matrix12)
          
          req(matrix12)
          colnames(matrix12)<-clnms
          dataInput<-input$dataInput
          if(dataInput==2){
            updateSelectInput(session,"stratifier",choices=c(colnames(matrix12),"No Stratification"),selected="No Stratification")
          }
          
          Dat1b2(matrix12)
       
      })
      
      
      
      
      
      
      
      
      
      
      
      observeEvent(
        input$snip6a1,{ showModal(modalDialog( tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), column(width = 12,
                                                                                                                                                                      h3("Data"),
                                                                                                                                                                      HTML(paste0(
                                                                                                                                                                        h4("Numeric Data"),
                                                                                                                                                                        "Whether interval or ratio, discrete (integer) or continuous, all numeric data can be summarized by the same desriptive statistics, such as means, standard deviations, medians, ranges, and interquartile ranges. Enter values for any numeric variables in the columns labelled, 'Enter numeric variables.'",
                                                                                                                                                                        br(),
                                                                                                                                                                        br(),
                                                                                                                                                                        h4("Categorical Data"),
                                                                                                                                                                        "Nominal and ordinal data are examples of categorical data. Descriptive statistics such as counts/frequencies and percentages can be used to summarize categorical variables. Enter data for these variables in the columns labelled, 'Enter categorical variables.'",
                                                                                                                                                                        br(),
                                                                                                                                                                        br(),
                                                                                                                                                                        h4("Stratifying variable"),
                                                                                                                                                                        "A categorical variable can be used to stratify the results into two or more strata. Enter values for this variable in the column labelled, 'Enter stratifying variable'."           
                                                                                                                                                                      )),
                                                                                                                                                                      br(), br() ) ) )) })
      observeEvent(
        input$snip6a2,{showModal(modalDialog(tags$div(style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                                                      h3("Hypotheses"), tags$iframe(width="1280", height="720",
                                                                                    src = "snip6a2.mp4",
                                                                                    #src = "video6i.pdf",
                                                                                    frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(
        input$snip6b1,{ ##### Change this one every time
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
        input$snip6b2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Data"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip6b2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(
        input$snip6c1,{ ##### Change this one every time
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
        input$snip6c2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Model Assumptions"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip6c2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      observeEvent(
        input$snip6d1,{ ##### Change this one every time
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
        input$snip6d2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Test Output"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip6d2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(
        input$snip6e1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Table for Publication"), ##### Change this one every time and text below
                               "This table gives multiple descriptive statistics. For instance, it gives a row with means and standard deviations and a row with medians, minimums, and maximums for each numeric variable. You probably don't want to include both rows for each variable. Some journals require one or the other. Some journals allow you to choose. Once you've decided, it's easiest to highlight the whole table, copy it into Excel, then delete the parts that you don't need. Additionally, for categorical variables with only two categories, you can keep a single row if you want, as the percentages for the other row can be calculated by the fact that percentages add to 100%. For categorical variables with more than two categories, you will likely want to keep everything.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip6e2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Tables and Figures for Publication"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip6e2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(input$snip6f1,{
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
      
      observeEvent(input$snip6f2,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Write-Up"),
            tags$iframe(
              width="1280",
              height="720",
              src = "snip6f2.mp4",
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
        input$snip6g1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Saving your Work Reproducibly"), ##### Change this one every time and text below
                               "Always save your work, and do it in a reproducible way. This means that, if someone needed to reproduce your results, you could simply give them one or more files (that's what you're saving here) and tell them what analysis program or language or tool you used, and they'd be able to reproduce your results exactly. This is helpful if someone challenges your work or you get audited. It's also helpful if you leave an institution, corporation, or clinic and someone there needs to reproduce your results at some point. But it's probably most useful for you. There are any number of reasons you might need to reproduce your owwn results for yourself, such as when you need to pick up where you left off the last time you worked on your analysis.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip6g2,{ ##### Change this one every time
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
