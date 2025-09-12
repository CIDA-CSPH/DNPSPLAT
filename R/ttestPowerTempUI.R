# Module UI function
pairedTTestUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    
    column(12,style = " background-color: white; border-radius: 4px; ",
           h2("Hypotheses"),
           br(),
           HTML(paste0(
             "The standard null hypothesis for a paired t-test is that the mean change between time points or replicates for a given person or experimental unit is 0 in the population. The associated alternative hypothesis is that the population mean change is not equal to 0. However, under certain circumstances, we might want to use different null and alternative hypotheses. Enter your null hypothesis H",tags$sub("0")," for the mean difference/change in the population \u0394\u03BC."
           )),
           br(),
           br(),
           numericInput(ns("nullDiff"),HTML(paste0(
             "H",tags$sub("0"),": \u0394\u03BC ="
           )),value=0),
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
           "Enter the labels for your numeric outcome and your binary predictor here. 
           Then, enter your group names and numeric data by hand or click on the 'Upload Data' 
           tab to upload your data from Excel. There is a link to an example dataset for formatting 
           purposes under that tab as well. remember that your data are paired from one replicate/time point to the other, so keep your observations in the same order with respect to people or experimental units. For instance, the first observation under time point/replicate 1 should come from the same person or experimental unit as the first observation under time point/replicate 2. There should also be the same number of observations in the two columns, as everyone has to have values at both time points/replicates. To upload data from Excel, use the 'Upload Data' tab above.",
           br(),
           br(),
           textInput(ns("outcomeLabel"),"Enter Outcome Label",value="Body Mass Index"),
           textInput(ns("predLabel"),"Enter Predictor Label",value="Pre/Post Intervention"),
           
           #"Enter your data by hand or paste it.",
           #"You can explore the impacts of the means, the standard deviations, the sample size, the correlation, and different distributions on your paired t-test by generating/simulating data. You can also use your own data, which can be loaded from a file, entered by hand, or pasted.",
           br(),
           br(),
           br(),
           
           column(width=9, style="background-color: white",
                  
                  tabsetPanel(type = "tabs", id=ns("dataInput"),
                              
                              tabPanel("Enter Data by Hand", value=1,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(

                                         br(),
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Data Entry by Hand"),
                                                "Enter your replicate/time point names and data in the cells below. The order of observations among participants/sample units must be the same in the two columns.",
                                                br(),
                                                br(),
                                                column(6, 
                                                                                          style="background-color: white",
                                                                                          matrixInput(
                                                                                            inputId = ns("matrix1a"),
                                                                                            label = "Enter Replicate/Time Point 1 Name & Data",
                                                                                            
                                                                                              value = matrix(c(35.74,
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
                                                                                                               33.97,
                                                                                                               37.40
                                                                                                               

                                                                                                               ),
                                                                                              ncol=1,
                                                                                              nrow=30,
                                                                                              dimnames=list(
                                                                                                NULL,
                                                                                                c("Pre-Intervention")
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
                                                                                     label = "Enter Replicate/Time Point 2 Name & Data",
                                                                                     
                                                                                                    value = matrix(
                                                                                                      c(31.80,
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
                                                                                                        29.88,
                                                                                                        33.29
                                                                                                        
                                                                                                        
                                                                                                        ),
                                                                                                    ncol=1,nrow=30,dimnames=list(NULL,c("Post-Intervention"))),
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
                                                                                   )),
                                                br()
                                                
                                         ),
                                         br(),
                                         br(),
                                         #actionButton('save_inputs', 'Save inputs'),
                                         br()
                                       ),
                                       br()
                                       
                              ),
                              
                             # tabPanel("Paste Data", value=2,
                             #          style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                             #          br(),
                             #          fluidPage(
                             #            column(12,style = " background-color: white; border-radius: 5px; ",
                             #                   h3("Data Entry by Pasting"),
                             #                   "Enter your replicate/time point names and paste your data (values separated by spaces) in the cells below. The order of observations across participants/sample units must be the same for each replicate/time point.",
                             #                   br(),
                             #                   br(),
                             #                   column(6, 
                             #                          style="background-color: white",
                             #                          textInput(ns("group1Name"),"Enter Replicate/Time Point 1 Name",value="Pre-Intervention"),
                             #                          textInput(ns("group1Data"),"Enter Replicate/Time Point 1 Data",value="35.74 33.84 29.99 31.75 34.09 32.28 29.16 30.77 30.61 28.49 31.29 28.55 28.70 29.94 28.09 34.38 34.81 29.70 29.09 29.77 31.90 31.82 29.20 32.04 31.22 31.12 36.50 32.89 33.97 37.40")
                             #                   ),
                             #                   column(6, 
                             #                          style="background-color: white",
                             #                          textInput(ns("group2Name"),"Enter Replicate/Time Point 2 Name",value="Post-Intervention"),
                             #                          textInput(ns("group2Data"),"Enter Replicate/Time Point 2 Data",value="31.80 29.82 25.94 27.61 29.97 28.28 25.19 26.70 26.79 24.46 27.36 24.68 24.72 25.89 24.04 30.30 30.72 25.75 25.17 25.66 27.80 27.82 25.08 28.11 27.24 27.32 32.44 28.84 29.88 33.29")
                             #                   ),
                             #                   br()
                             #            ),
                             #            br()
                             #          ),
                             #          br()
                             #          
                             # )

tabPanel("Upload Data",value=3,
         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
         br(),
         fluidPage(
           column(12,style = " background-color: white; border-radius: 5px; ",
                  h3("Upload Data"),
                  "Upload your data (Excel file with two columns of numbers in two left-most columns with replicate/time point names as text in the first row, followed by a column of subject IDs in the third row). You can download an example dataset to see its formatting ",
                  tags$a(href="pairedTTestData.xlsx",download="pairedTTestData.xlsx",
                         "by clicking on this link.",target="_blank"),
                  br(),
                  br(),
                  #column(6, 
                  #       style="background-color: white",
                  #       textInput(ns("group1Name"),"Enter Group 1 Name",value="Control"),
                  #       #textInput(ns("group1Data"),"Enter Group 1 Data",value="35.74 33.84 29.99 31.75 34.09 32.28 29.16 30.77 30.61 28.49 31.29 28.55 28.70 29.94 28.09 34.38 34.81 29.70 29.09 29.77 31.90 31.82 29.20 32.04 31.22 31.12 36.50 32.89 37.40")
                  #),
                  #column(6, 
                  #       style="background-color: white",
                  #       textInput(ns("group2Name"),"Enter Group 2 Name",value="Treatment"),
                  #       #textInput(ns("group2Data"),"Enter Group 2 Data",value="31.80 29.82 25.94 27.61 29.97 28.28 25.19 26.70 26.79 24.46 27.36 24.68 24.72 25.89 24.04 30.30 30.72 25.75 25.17 25.66 27.80 27.82 25.08 28.11 27.24 27.32 32.44 28.84 29.88 33.29 33.97")
                  #),
                  #br(),
                  fileInput(ns("tTestData"),"Enter data file location",accept=".xlsx"),
                  br(),
                  br(),
                  tableOutput(ns("loadedData")),
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
    
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           
           h2("Model Assumptions"),
           br(),
           "The t-test requires that several assumptions be met for it to perform optimally. A two-sample t-test assumes that the observations are independent of each other and that they are all sampled from the same distribution for a given group. A paired t-test also assumes that they are sampled from the same distribution, but it allows the observations to be correlated within a person or experimental unit across the two time points or replicates. Thus, they are allowed to be correlated in a particular way for the paired t-test. Both t-tests assume the sample mean is normally distributed. The original Student's t-test assumed equal variance or standard deviations in the two groups, though we use an unequal variances t-test here. See the note on that below.",
           
           h3("Normality"),
           "Use the following plots to assess the assumption of normality.",
           br(),
           br(),
           column(6, 
                  h4("Distribution of Data"),
                  br(),
                  plotOutput(ns("histogram2"),height=300),
                  br(),
                  plotOutput(ns("histogram3"),height=300),
                  br(),
                  plotOutput(ns("histogram6"),height=300),
                  br()
           ),
           column(6, 
                  h4("Distribution of Sample Means (bootstrapped)"),
                  br(),
                  plotOutput(ns("histogram4"),height=300),
                  br(),
                  plotOutput(ns("histogram5"),height=300),
                  br(),
                  plotOutput(ns("histogram7"),height=300),
                  br()
                  
           ),
           br(),
           br(),
           br(),

 
           br(),
           br()
    ),
    
    
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = "background-color: white; border-radius: 5px; ",
           
           h2("Test Output"),
           br(),
           "The t-test itself gives a test-statistic value, called the t-value or just t, as can be seen in the 'Test Results' table below. Paired with its degrees of freedom, or DF, which is calculated from the sample size, the t-test calculates a p-value. The p-value can be interpretted as 'the probability of observing our results or something more extreme if the null hympothesis is true'. So, the smaller the p-value, the less likely it is that the null hypothesis is true. We usually use a cut off of p<0.05 as the criteria to reject the null hypothesis.",
           br(),
           br(),
           "In addition to the 'Test Results' table, there is an 'Estimates' table below. Technically, the results in this table aren't part of the t-test, they're the estimates and confidence intervals we learned about previously. However, it's convention to report estimates and confidence intervals with the results of a test. So, we give those numbers in the 'Estimates' table below. These two tables are not tables that you would disseminate as is. However, results from both tables below will be combined and reported in the 'Tables and Figures for Publication' section below.",
           br(),
           br(),
           h3("Estimates"),
           tableOutput(ns("ttest1")),
           br(),
           h3("Test Results"),
           tableOutput(ns("ttest2")),
           br()
    ),
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = "background-color: white; border-radius: 5px; ",
           h2("Tables and Figures for Publication"),
           br(),
           "The following table is a publication-worthy way to display your results. 
       The figure below is one way to graphically display your results. For an interpretation and write up of these results, see the next section.",
       br(),
           br(),
           tableOutput(ns("ttestTable")),
           br(),
           br(),
           plotOutput(ns("forestPlot"),height=500,width=500),
           br()
    ),
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           h2("Write-Up"),
           h3("Methods"),
           "The following is an example of what one might write about this test in the methods section of a paper. 
       This example uses the BMI data and test present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way.",
           br(),
           br(),
           em("A paired t-test compared the mean pre- to post-intervention change in BMI to the null value of 0 (no change) 
           using a two-tailed type I error rate of \u03B1 = 0.05. The distributional assumption of 
       normality was verified graphically using histograms."),
           br(),
           br(),
           h3("Results"),
           "The following is an example of what one might write about the results of this test in the results section of a paper. 
       This example uses the BMI data and test present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way.",
           br(),
           br(),
           em("The mean BMI pre-intervention was 31.64 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          30.70 kg/m",tags$sup("2")," to 32.58 kg/m",tags$sup("2"),". Post-intervention, the mean was
          27.62 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          26.69 kg/m",tags$sup("2")," to 28.55 kg/m",tags$sup("2"),". BMI decreased significantly with the intervention (p<0.0001), with a mean decrese of 4.01 kg/m",tags$sup("2")," 
          and a 95% confidence interval of 2.18 kg/m",tags$sup("2")," to 5.85 kg/m",tags$sup("2"),"."),
           
           
           br(),
           br(),
           br()
    ),
    column(12,
           br(),
           br(),
           br()
    )
  )
  
  
  
  
  
  
  
  
}








pairedTTestServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      output$loadedData <- renderTable({
        inFile <- input$tTestData
        if (is.null(inFile))
          return(NULL)
        readxl::read_excel(inFile$datapath)
      })
      
      matrix1a <- reactive({
        inFile <- input$tTestData
        if (is.null(inFile))
          return(NULL)
        mat<-as.matrix(readxl::read_excel(inFile$datapath,col_types="numeric"))
        mat1<-as.matrix(mat[,1],ncol=1)
        colnames(mat1)<-colnames(mat)[1]
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
        }
        if(input$dataInput==3){
          matrix1a<-na.omit(mat1)
        }
        matrix1a
      })
      
      matrix1b <- reactive({
        inFile <- input$tTestData
        if (is.null(inFile))
          return(NULL)
        mat<-as.matrix(readxl::read_excel(inFile$datapath,col_types="numeric"))
        mat1<-as.matrix(mat[,2],ncol=1)
        colnames(mat1)<-colnames(mat)[2]
        if(input$dataInput==1){
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1b<-na.omit(mat1)
        }
        matrix1b
      })
      
      
      dat<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
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
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
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
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        
        dat0b<-as.matrix(matrix1b)
        
        colNames1<-vector(length=length(na.omit(dat0b)))
        colNames1[]<-colnames(matrix1b)
        
        matrix1b1<-cbind(na.omit(dat0b),colNames1)
        
        matrix1_2<-na.omit(matrix1b1)
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
        
      })
      
      dat3<-reactive({
        
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        
        #dat0<-as.matrix(matrix1In)
        dat0a<-as.matrix(matrix1a)
        dat0b<-as.matrix(matrix1b)
        dat0c<-dat0b-dat0a
        
   
        matrix1c1<-na.omit(dat0c)
        
        dat1<-data.frame("Outcome"=as.numeric(matrix1c1))
        
        dat1
        
      })
      
      
      
      bootMean1<-reactive({
        
        if(input$dataInput==1){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1_0<-matrix1a()
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
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
      
      bootMean2<-reactive({
        
        if(input$dataInput==1){
          matrix1_0<-input$matrix1b
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1_0<-input$matrix1b
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1_0<-matrix1b()
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
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
      
      bootMean3<-reactive({
        
        if(input$dataInput==1){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1_0<-matrix1a()
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        
        #dat0<-as.matrix(matrix1In)
        dat0a<-as.matrix(matrix1a)
        dat0b<-as.matrix(matrix1b)
        dat0c<-dat0b-dat0a
        
        
        matrix1c1<-na.omit(dat0c)
        
        meanFunc<-function(dat,wt){
          sum(dat * wt)
        }
        
        bootMean<-boot(matrix1c1,meanFunc,R=100000, stype = "w")$t
        
        dat0<-as.matrix(bootMean)
        
        colNames1<-vector(length=length(na.omit(dat0)))
        colNames1[]<-"Mean Change"
        
        matrix1_1<-cbind(na.omit(dat0),colNames1)
        
        matrix1_2<-na.omit(matrix1_1)
        
        dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
        
        dat1
      })
      
      
      #matrix1a<-reactive({
      #  matrix1a<-input$matrix1a
      #  matrix1a
      #})
      #
      #matrix1b<-reactive({
      #  matrix1b<-input$matrix1b
      #  matrix1b
      #})
      
      matrix1c<-reactive({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        matrix1c<-as.matrix(matrix1b-matrix1a)
        matrix1c
      })
      
      
      outcomeLabel<-reactive({
        input$outcomeLabel
      })
      
      predLabel<-reactive({
        input$predLabel
      })
      
      
      
      output$histogram2<-renderPlot({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        ggplot(dat1(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + #xlim(min(c(matrix1a,matrix1b))-0.1*(max(c(matrix1a,matrix1b))-min(c(matrix1a,matrix1b))),max(c(matrix1a,matrix1b))+0.1*(max(c(matrix1a,matrix1b))-min(c(matrix1a,matrix1b)))) + 
          ylab("Count")
        #ggplot() + geom_boxplot(aes(y=matrix1a))
      })
      
      output$histogram3<-renderPlot({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        ggplot(dat2(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + #xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + 
          ylab("Count")
        #ggplot() + geom_boxplot(aes(y=matrix1a))
      })
      
      output$histogram6<-renderPlot({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        ggplot(dat3(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + #xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + 
          ylab("Count")
        #ggplot() + geom_boxplot(aes(y=matrix1a))
      })
      
      output$histogram4<-renderPlot({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        bw<-(max(bootMean1()$Outcome)-min(bootMean1()$Outcome))/30
        nObs<-sum(!is.na(bootMean1()$Outcome))
        ggplot(bootMean1(),aes(x=Outcome)) + 
          geom_histogram(
            binwidth=bw#,
            #aes(y=..density..)
          ) + 
          xlab(outcomeLabel()) + 
          #xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + 
          ylab("Count") + 
          stat_function(fun = function(x) 
            dnorm(x, mean = mean(bootMean1()$Outcome), sd = sd(bootMean1()$Outcome)) * bw * nObs,color="red")
      })
      
      output$histogram5<-renderPlot({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        bw<-(max(bootMean2()$Outcome)-min(bootMean2()$Outcome))/30
        nObs<-sum(!is.na(bootMean2()$Outcome))
        ggplot(bootMean2(),aes(x=Outcome)) + 
          geom_histogram(
            binwidth=bw#,
            #aes(y=..density..)
          ) + 
          xlab(outcomeLabel()) + 
          #xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + 
          ylab("Count") + 
          stat_function(fun = function(x) 
            dnorm(x, mean = mean(bootMean2()$Outcome), sd = sd(bootMean2()$Outcome)) * bw * nObs,color="red")
      })
      
      output$histogram7<-renderPlot({
        if(input$dataInput==1){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
        }
        bw<-(max(bootMean3()$Outcome)-min(bootMean3()$Outcome))/30
        nObs<-sum(!is.na(bootMean3()$Outcome))
        ggplot(bootMean3(),aes(x=Outcome)) + 
          geom_histogram(
            binwidth=bw#,
            #aes(y=..density..)
          ) + 
          xlab(outcomeLabel()) + 
          #xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + 
          ylab("Count") + 
          stat_function(fun = function(x) 
            dnorm(x, mean = mean(bootMean3()$Outcome), sd = sd(bootMean3()$Outcome)) * bw * nObs,color="red")
      })
      
      output$ttestTable<-renderTable({
        if(input$dataInput==1){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1_0<-matrix1a()
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
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
        
        
        
        xBar1<-mean(matrix1a)
        xBar2<-mean(matrix1b)
        deltaXBar<-xBar2-xBar1
        
        se1<-sd(matrix1a)/sqrt(length(matrix1a))
        se2<-sd(matrix1b)/sqrt(length(matrix1b))
        seDelta<-se1+se2
        
        df1<-length(matrix1a)-1
        df2<-length(matrix1b)-1
        
        lcl1<-xBar1-qt(p=0.975,df=df1)*se1
        ucl1<-xBar1+qt(p=0.975,df=df1)*se1
        lcl2<-xBar2-qt(p=0.975,df=df2)*se2
        ucl2<-xBar2+qt(p=0.975,df=df2)*se2
        lclDelta<-deltaXBar-qt(p=0.975,df=df2+df1)*seDelta
        uclDelta<-deltaXBar+qt(p=0.975,df=df2+df1)*seDelta
        
        sp<-sqrt(
          (df1*sd(matrix1a)^2 + df2*sd(matrix1b)^2)/(df1 + df2)
        )
        
        t<-(
          deltaXBar - input$nullDiff
        )/(
          sp*sqrt(1/length(matrix1a)+1/length(matrix1b))
        )
        
        #p2Tail<-pt(q=abs(t),df=df1+df2,lower.tail=FALSE)*2
        #pValue<-ifelse(p2Tail<0.0001,"<0.0001",round(p2Tail,digits=4))
        
        tTest<-t.test(Outcome~Group,data=dat(),mu=input$nullDiff,paired=TRUE)
        pValue<-ifelse(tTest$p.value<0.0001,"<0.0001",round(tTest$p.value,digits=4))
        
        Results<-data.frame("Outcome"=paste(outcomeLabel()),"Group 1"=paste(round(xBar1,digits=2)," (",round(lcl1,digits=2),", ",round(ucl1,digits=2),")",sep=""),
                            "Group 2"=paste(round(xBar2,digits=2)," (",round(lcl2,digits=2),", ",round(ucl2,digits=2),")",sep=""),
                            "Difference"=paste(round(deltaXBar,digits=2)," (",round(lclDelta,digits=2),", ",round(uclDelta,digits=2),")",sep=""),
                            #"t-Value"=round(t,digits=2),
                            "p-Value"=pValue
        )
        colnames(Results)<-c("Outcome",paste(colnames(matrix1a)," Mean (95% CI)",sep=""),paste(colnames(matrix1b)," Mean (95% CI)",sep=""),"Difference in Means (95% CI)",
                             #"t-Value",
                             "p-Value")
        
        Results
        
      })
      
      output$ttest1<-renderTable({
        if(input$dataInput==1){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1_0<-matrix1a()
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
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
        
        xBar1<-mean(matrix1a)
        xBar2<-mean(matrix1b)
        deltaXBar<-xBar2-xBar1
        
        se1<-sd(matrix1a)/sqrt(length(matrix1a))
        se2<-sd(matrix1b)/sqrt(length(matrix1b))
        seDelta<-se1+se2
        
        df1<-length(matrix1a)-1
        df2<-length(matrix1b)-1
        
        lcl1<-xBar1-qt(p=0.975,df=df1)*se1
        ucl1<-xBar1+qt(p=0.975,df=df1)*se1
        lcl2<-xBar2-qt(p=0.975,df=df2)*se2
        ucl2<-xBar2+qt(p=0.975,df=df2)*se2
        lclDelta<-deltaXBar-qt(p=0.975,df=df2+df1)*seDelta
        uclDelta<-deltaXBar+qt(p=0.975,df=df2+df1)*seDelta
        
        data.frame("Group"=c(colNames1[1],colNames2[1],"Group Difference"),"Estimate"=c(xBar1,xBar2,deltaXBar),"SE"=c(se1,se2,seDelta),"Lower"=c(lcl1,lcl2,lclDelta),"Upper"=c(ucl1,ucl2,uclDelta))
      })
      
      output$ttest2<-renderTable({
        tTest<-t.test(Outcome~Group,data=dat(),mu=input$nullDiff,paired=TRUE)
        pValue<-ifelse(tTest$p.value<0.0001,"<0.0001",round(tTest$p.value,digits=4))
        data.frame("Method"=tTest$method,"t"=tTest$statistic,"DF"=tTest$parameter,"p-Value"=pValue)
      })
      
      #switch(Sys.info()[['sysname']],
      #       Windows= {setwd(file.path(Sys.getenv("USERPROFILE"),"Desktop",fsep="\\"))},
      #       Mac = {  setwd("~/Desktop/")})
      #
      #observeEvent(input$save_inputs,{ 
      #  saveRDS( reactiveValuesToList(input) , file = 'inputs.RDS')
      #})
      
      #observeEvent(input$load_inputs,{   
      #  
      #  if(!file.exists('inputs.RDS')) {return(NULL)}
      #  
      #  savedInputs <- readRDS('inputs.RDS')
      #  
      #  inputIDs      <- names(savedInputs) 
      #  inputvalues   <- unlist(savedInputs) 
      #  for (i in 1:length(savedInputs)) { 
      #    session$sendInputMessage(inputIDs[i],  list(value=inputvalues[[i]]) )
      #  }
      #})
      
      observeEvent(input$load_inputs, {
        # Load inputs
        uploaded_inputs <- read.csv(input$inputsLocation)
        # Update each input
        for(i in 1:nrow(uploaded_inputs)){
          updateNumericInput(session,
                             inputId = uploaded_inputs$inputId[i],
                             value = uploaded_inputs$value[i])
        }
      })
      
      observeEvent(input$save_inputs, {
        # Inputs data.frame
        inputs_data_frame <- data.frame(cbind(matrix1a(),matrix1b()))
        # Save Inputs
        write.csv(inputs_data_frame, file = input$inputsLocation, row.names = FALSE)
      }) 
      
      
      output$forestPlot<-renderPlot({
        if(input$dataInput==1){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==2){
          matrix1_0<-input$matrix1a
          matrix1a<-input$matrix1a
          matrix1b<-input$matrix1b
        }
        if(input$dataInput==3){
          matrix1_0<-matrix1a()
          matrix1a<-matrix1a()
          matrix1b<-matrix1b()
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
        
        xBar1<-mean(matrix1a)
        xBar2<-mean(matrix1b)
        deltaXBar<-xBar2-xBar1
        
        se1<-sd(matrix1a)/sqrt(length(matrix1a))
        se2<-sd(matrix1b)/sqrt(length(matrix1b))
        seDelta<-se1+se2
        
        df1<-length(matrix1a)-1
        df2<-length(matrix1b)-1
        
        lcl1<-xBar1-qt(p=0.975,df=df1)*se1
        ucl1<-xBar1+qt(p=0.975,df=df1)*se1
        lcl2<-xBar2-qt(p=0.975,df=df2)*se2
        ucl2<-xBar2+qt(p=0.975,df=df2)*se2
        lclDelta<-deltaXBar-qt(p=0.975,df=df2+df1)*seDelta
        uclDelta<-deltaXBar+qt(p=0.975,df=df2+df1)*seDelta
        
        plotUpper<-max(c(ucl1,ucl2))+0.1*abs(ucl1-ucl2)
        plotLower<-min(c(lcl1,lcl2))-0.1*abs(ucl1-ucl2)
        
        dat2<-data.frame("Index"=c(1,2),"Estimate"=c(xBar1,xBar2),
                         "lcl"=c(lcl1,lcl2),"ucl"=c(ucl1,ucl2),
                         "Group"=c(colnames(matrix1a),colnames(matrix1b)))
        
        dat2$Group <- as.character(dat2$Group)
        dat2$Group <- factor(dat2$Group, levels=unique(dat2$Group))
        #ggplot(dat1(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + ylab("Count")
        
        ggplot(dat2,aes(y=Estimate,x=Group)) +
          geom_point(shape = 18, size = 5) +  
          geom_segment(aes(x = Group, y = lcl, xend = Group, yend = ucl))+
          #geom_errorbarh(aes(xmin = lcl, xmax = ucl), height = 0.25) +
          #geom_vline(xintercept = 0, color = "red", linetype = "dashed", cex = 1, alpha = 0.5) +
          #scale_y_continuous(name = "", breaks=1:4, labels = dat$label, trans = "reverse") +
          ylab(outcomeLabel()) + 
          ggtitle(paste(outcomeLabel(),"by",predLabel()),subtitle="Means and 95% Confidence Intervals")+
          xlab(predLabel())+
          ylim(c(plotLower,plotUpper))+
          #xlim(c(0,3))+ 
          #scale_x_discrete(name = predLabel(), labels = c(colnames(matrix1a),colnames(matrix1b)))+#, trans = "reverse") +
          theme_bw() +
          theme(panel.border = element_blank(),
                panel.background = element_blank(),
                panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                axis.line = element_line(colour = "black"),
                axis.text.y = element_text(size = 12, colour = "black"),
                axis.text.x.bottom = element_text(size = 12, colour = "black"),
                axis.title.x = element_text(size = 14, colour = "black"),
                axis.title.y = element_text(size = 14, colour = "black"),
                plot.title = element_text(size=16, colour="black",hjust=0.5),
                plot.subtitle = element_text(size=14, colour="black",hjust=0.5))
        
              })
      
      
      

      
      
    }
  )    
}
