# Module UI function
descStatUI <- function(id) {
  
  
  
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    
  
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           h2("Data"),
           br(),
           "Enter your data below.",
           br(),
           br(),
          
           
           column(width=9, style="background-color: white",
                  
                  tabsetPanel(type = "tabs",id=ns("dataInput"),
                              
                              tabPanel("Enter Data by Hand",value=1,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Data Entry by Hand"),
                                                "Enter your variable names and data in the cells below. If you want a stratified table, Enter the stratification variable on the far left.",
                                                br(),
                                                br(),
                                                column(4, 
                                                                                          style="background-color: white",
                                                                                          matrixInput(
                                                                                            inputId = ns("matrix1a"),
                                                                                            label = "Enter Stratifying variable or leave blank.",
                                                                                            value = matrix(
                                                                                              
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
                                                                                                  ),
                                                                                              ncol=1,
                                                                                        
                                                                                              dimnames=list(
                                                                                                NULL,
                                                                                                c("Study Group")
                                                                                                )),
                                                                                            
                                                                                            #class = "character",
                                                                                            cols = list(
                                                                                              names = TRUE,
                                                                                              extend=FALSE,
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
                                                                                  
                                               
                                         
                                         column(4, 
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
                                                      extend=TRUE,
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
                                                
                                         
                                         
                                         column(4, 
                                                style="background-color: white",
                                                matrixInput(
                                                  inputId = ns("matrix1c"),
                                                  label = "Enter categorical variables",
                                                  value = matrix(
                                                   
                                                      c("Male",
                                                        "Male",
                                                        "Female",
                                                        "Male",
                                                        "Male",
                                                        "Female",
                                                        "Female",
                                                        "Male",
                                                        "Male",
                                                        "Female")
                                                   ,
                                                    ncol=1,
                                                    
                                                    dimnames=list(
                                                      NULL,
                                                      c("Sex")
                                                    )),
                                                  
                                                  class = "character",
                                                  cols = list(
                                                    names = TRUE,
                                                    extend=TRUE,
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
                                         
                                         
                                         
                                         
                                         br()
                                       ),
                                       br()
                                       
                              )
                              
                              ),
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              #tabPanel("Paste Data",value=2,
                              #         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                              #         br(),
                              #         fluidPage(
                              #           column(12,style = " background-color: white; border-radius: 5px; ",
                              #                  h3("Data Entry by Pasting"),
                              #                  "Enter your group names and paste your data (values separated by spaces) in the cells below.",
                              #                  br(),
                              #                  br(),
                              #                  column(6, 
                              #                         style="background-color: white",
                              #                         textInput(ns("group1Name"),"Enter Group 1 Name",value="Control"),
                              #                         textInput(ns("group1Data"),"Enter Group 1 Data",value="35.74 33.84 29.99 31.75 34.09 32.28 29.16 30.77 30.61 28.49 31.29 28.55 28.70 29.94 28.09 34.38 34.81 29.70 29.09 29.77 31.90 31.82 29.20 32.04 31.22 31.12 36.50 32.89 37.40")
                              #                  ),
                              #                  column(6, 
                              #                         style="background-color: white",
                              #                         textInput(ns("group2Name"),"Enter Group 2 Name",value="Treatment"),
                              #                         textInput(ns("group2Data"),"Enter Group 2 Data",value="31.80 29.82 25.94 27.61 29.97 28.28 25.19 26.70 26.79 24.46 27.36 24.68 24.72 25.89 24.04 30.30 30.72 25.75 25.17 25.66 27.80 27.82 25.08 28.11 27.24 27.32 32.44 28.84 29.88 33.29 33.97")
                              #                  ),
                              #                  br()
                              #           ),
                              #           br()
                              #         ),
                              #         br()
                              #         
                              #),
                              #tabPanel("Upload Data",value=3,
                              #         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                              #         br(),
                              #         fluidPage(
                              #           column(12,style = " background-color: white; border-radius: 5px; ",
                              #                  h3("Upload Data"),
                              #                  "Enter your upload your data (Excel file with two columns of numbers in two left-most columns with group names as text in the first row).",
                              #                  br(),
                              #                  br(),
                              #                  #column(6, 
                              #                  #       style="background-color: white",
                              #                  #       textInput(ns("group1Name"),"Enter Group 1 Name",value="Control"),
                              #                  #       #textInput(ns("group1Data"),"Enter Group 1 Data",value="35.74 33.84 29.99 31.75 34.09 32.28 29.16 30.77 30.61 28.49 31.29 28.55 28.70 29.94 28.09 34.38 34.81 29.70 29.09 29.77 31.90 31.82 29.20 32.04 31.22 31.12 36.50 32.89 37.40")
                              #                  #),
                              #                  #column(6, 
                              #                  #       style="background-color: white",
                              #                  #       textInput(ns("group2Name"),"Enter Group 2 Name",value="Treatment"),
                              #                  #       #textInput(ns("group2Data"),"Enter Group 2 Data",value="31.80 29.82 25.94 27.61 29.97 28.28 25.19 26.70 26.79 24.46 27.36 24.68 24.72 25.89 24.04 30.30 30.72 25.75 25.17 25.66 27.80 27.82 25.08 28.11 27.24 27.32 32.44 28.84 29.88 33.29 33.97")
                              #                  #),
                              #                  #br(),
                              #                  fileInput(ns("tTestData"),"Enter data file location",accept=".xlsx"),
                              #                  br(),
                              #                  br(),
                              #                  tableOutput(ns("loadedData")),
                              #           ),
                              #           br()
                              #         ),
                              #         br()
                              #         
                              #)
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
           h2("Tables and Figures for Publication"),
           br(),
           "The following table is a publication-worthy way to display your results. 
       The figure below is one way to graphically display your results.",
           br(),
           br(),
           #tableOutput(ns("table1Table")),
           br(),
           br(),
       includeHTML("scatterplot.js"),
       reactiveSvg(outputId = "scatterplot")
           #plotOutput(ns("forestPlot"),height=500,width=500),
           #br()
    ),
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           h2("Write-Up"),
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








descStatServer <- function(id) {
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
        #mat1<-as.matrix(mat[,1],ncol=1)
        #colnames(mat1)<-colnames(mat)[1]
        if(input$dataInput==1){
          matrix1a<-data.frame(c(as.factor(input$matrix1a),as.numeric(input$matrix1b),as.factor(input$matrix1c)))
        }
        if(input$dataInput==2){
          matrix1a<-data.frame(c(as.factor(input$matrix1a),as.numeric(input$matrix1b),as.factor(input$matrix1c)))
        }
        if(input$dataInput==3){
          #matrix1a<-na.omit(mat1)
          matrix1a<-mat
        }
        as.data.frame(matrix1a)
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
      
      
      outcomeLabel<-reactive({
        input$outcomeLabel
      })
      
      predLabel<-reactive({
        input$predLabel
      })
      
      output$table1Table<-renderTable({
        if(input$dataInput==1){
          matrix1a<-data.frame(c(as.factor(input$matrix1a),as.numeric(input$matrix1b),as.factor(input$matrix1c)))
        }
        if(input$dataInput==2){
          matrix1a<-data.frame(c(as.factor(input$matrix1a),as.numeric(input$matrix1b),as.factor(input$matrix1c)))
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
        }
        mat<-as.data.frame(matrix1a)
        
        tab<-CreateTableOne(
          #vars,
          #strata,
          data=mat,
          #factorVars,
          #includeNA = FALSE,
          #test = TRUE,
          #testApprox = chisq.test,
          #argsApprox = list(correct = TRUE),
          #testExact = fisher.test,
          #argsExact = list(workspace = 2 * 10^5),
          #testNormal = oneway.test,
          #argsNormal = list(var.equal = TRUE),
          #testNonNormal = kruskal.test,
          #argsNonNormal = list(NULL),
          #smd = TRUE,
          #addOverall = FALSE
        )
        print(tab)
        
        #table1(list(input$matrix1b,input$matrix1c)|input$matrix1a)
        
      },rownames=TRUE)
      
      
      output$table1Table2<-renderTable({
        if(input$dataInput==1){
          matrix1a<-data.frame(c(as.factor(input$matrix1a),as.numeric(input$matrix1b),as.factor(input$matrix1c)))
        }
        if(input$dataInput==2){
          matrix1a<-data.frame(c(as.factor(input$matrix1a),as.numeric(input$matrix1b),as.factor(input$matrix1c)))
        }
        if(input$dataInput==3){
          matrix1a<-matrix1a()
        }
        mat<-data.frame("First"=c(1,2,3),"Second"=c("1","2","3"),"Third"=c(4,5,6))
        #mat<-as.data.frame(matrix1a)
        
        tab<-table1(
          ~mat[,1]+mat[,2],
          #labels=list(colnames(mat)),
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
        #print(tab)
        as.data.frame.table1(tab)
        
        #table1(list(input$matrix1b,input$matrix1c)|input$matrix1a)
        
      },rownames=TRUE)
      

      
      
      
      
     # data <- reactive(function(){
     #   getSymbols(c('VBMFX','VFINX','VDMIX','VEIEX'))
     #   #combine date from xts and coredata to get a data.frame in the format best for JSON pass in Shiny
     #   prices <- na.omit(merge(to.monthly(VBMFX)[,6],to.monthly(VFINX)[,6],to.monthly(VDMIX)[,6],to.monthly(VEIEX)[,6]))
     #   returns <- prices / lag(prices, k=1) - 1
     #   returns[1,] <- 0
     #   data <- cbind(coredata(returns),format(index(returns),"%Y-%m-%d"))
     #   #name columns same as the example
     #   colnames(data) <- c('VBMFX','VFINX','VDMIX','VEIEX','Date')
     #   data
     # })
     # 
     # output$scatterplot <- reactive(function() { data() })
      
      
      
      
      
      
      
      
    }
  )    
}
