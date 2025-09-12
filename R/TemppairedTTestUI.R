

# Module UI function
TemppairedTTestUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    
    column(12,style = " background-color: white; border-radius: 4px; ",
           h2("Hypotheses"),
           br(),
           HTML(paste0(
             "Enter your null hypothesis H",tags$sub("0")," for the mean difference/change in the population \u0394\u03BC."
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
           "Enter the labels for your variables, your replicate/time point names, and your data below.",
           br(),
           br(),
           textInput(ns("outcomeLabel"),"Enter Outcome Label",value="Body Mass Index"),
           textInput(ns("predLabel"),"Enter Time/Replicate Variable Label",value="Time Point"),
           br(),
           br(),
           
           column(width=9, style="background-color: white",
                  
                  tabsetPanel(type = "tabs",
                              
                              tabPanel("Enter Data by Hand",
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Data Entry by Hand"),
                                                "Enter your time point/replicate names and outcome data values in the cells below.",
                                                br(),
                                                br(),
                                                column(12, 
                                                       style="background-color: white",
                                                       matrixInput(
                                                         inputId = ns("matrix1a"),
                                                         label = "",
                                                         value = matrix(
                                                           cbind(c("P1","P2","P3","P4","P5","P6","P7","P8"),
                                                                 c(21,23,22,20,24,21,21,22),
                                                                 c(26,28,27,25,28,27,26,27)),
                                                           ncol=3,
                                                           nrow=8,
                                                           dimnames=list(
                                                             NULL,
                                                             c("Patient ID","Time Point 1","Time Point 2")
                                                           )
                                                         ),
                                                         class = "character",
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
                                                
                                                br()
                                         ),
                                         br()
                                       ),
                                       br()
                                       
                              ),
                              
                              tabPanel("Paste Data",
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Data Entry by Pasting"),
                                                "Enter your replicate/time point names and paste your data (values separated by spaces) in the cells below.",
                                                br(),
                                                br(),
                                                column(6, 
                                                       style="background-color: white",
                                                       textInput(ns("group1Name"),"Enter Time Point/Replicate 1 Name",value="Treatment"),
                                                       textInput(ns("group1Data"),"Enter Time Point/Replicate 1 Data",value="21 23 22 20 24 21 21 22")
                                                ),
                                                column(6, 
                                                       style="background-color: white",
                                                       textInput(ns("group2Name"),"Enter Time Point/Replicate 2 Name",value="Control"),
                                                       textInput(ns("group2Data"),"Enter Time Point/Replicate 2 Data",value="26 28 27 25 28 27 26 27")
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
    
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           
           h2("Model Assumptions"),
           br(),
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
    
    
    
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    column(12, style = "background-color: white; border-radius: 5px; ",
           
           h2("Test Output"),
           br(),
           "The following gives the output of your paired t-test.",
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
       The figure below is one way to graphically display your results.",
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
       em("A paired t-test estimated the mean change in BMI from time point 1 to time point 2 and tested it against a null change of 0 
       using a two-tailed type I error rate of \u03B1 = 0.05. The distributional assumption of 
       normality was examined graphically using histograms."),
       br(),
       br(),
       h3("Results"),
       "The following is an example of what one might write about the results of this test in the results section of a paper. 
       This example uses the BMI data and test present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way.",
       br(),
       br(),
       em("The mean BMI at time point 1 was 26.70 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          26.02 kg/m",tags$sup("2")," to 27.38 kg/m",tags$sup("2"),". At time point 2, the mean was
          __________",tags$sup("2"),", with a 95% confidence interval of 
          ___________",tags$sup("2")," to _______",tags$sup("2"),". There was a significant change in BMI (p_____________), as the mean change was a decrease of ________",tags$sup("2")," with a 95% confidence interval of _______",tags$sup("2")," lower to __________",tags$sup("2")," lower."),
       
       
       br(),
       br(),
       br()
    ),
    column(12,
           br(),
           br(),
           br())
    )
  )
  
  
  
  
  




  

  
}








pairedTTestServer <- function(id) {moduleServer(
  id,
  ## Below is the module function
  function(input, output, session) {
    
    
    dat<-reactive({
      
      matrix1a<-input$matrix1a

      
      #dat0<-as.matrix(matrix1In)
      dat0a<-as.matrix(as.numeric(matrix1a[,2]))
      dat0b<-as.matrix(as.numeric(matrix1a[,3]))
      
      colNames1<-vector(length=length(na.omit(dat0a)))
      colNames1[]<-colnames(matrix1a)[2]
      #colNames1[]<-"ColName1"
      
      colNames2<-vector(length=length(na.omit(dat0b)))
      colNames2[]<-colnames(matrix1a)[3]
      #colNames2[]<-"ColName2"
      
      matrix1a1<-cbind(na.omit(dat0a),colNames1)
      matrix1b1<-cbind(na.omit(dat0b),colNames2)
      
      matrix1_2<-na.omit(rbind(matrix1b1,matrix1a1))
      
      dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
      
      dat1
      
    })
    
    dat1<-reactive({
      
      matrix1a<-input$matrix1a
      
      dat0a<-as.matrix(as.numeric(matrix1a[,2]))
      
      colNames1<-vector(length=length(na.omit(dat0a)))
      colNames1[]<-colnames(matrix1a)[2]
      
      matrix1a1<-cbind(na.omit(dat0a),colNames1)
      
      matrix1_2<-na.omit(matrix1a1)
      
      dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
      
      dat1
      
    })
    
    dat2<-reactive({
      
      matrix1a<-input$matrix1a
      
      dat0a<-as.matrix(as.numeric(matrix1a[,3]))
      
      colNames1<-vector(length=length(na.omit(dat0a)))
      colNames1[]<-colnames(matrix1a)[3]
      
      matrix1a1<-cbind(na.omit(dat0a),colNames1)
      
      matrix1_2<-na.omit(matrix1a1)
      
      dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
      
      dat1
      
    })
    
    dat3<-reactive({
      
      matrix1a<-input$matrix1a
      
      dat0a<-as.matrix(as.numeric(matrix1a[,3])-as.numeric(matrix1a[,2]))
      
      #colNames1<-vector(length=length(na.omit(dat0a)))
      #colNames1[]<-colnames(matrix1a)[3]
      
      matrix1a1<-na.omit(dat0a)
      
      matrix1_2<-na.omit(matrix1a1)
      
      dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])))
      
      dat1
      
    })
    
    bootMean1<-reactive({
      
      matrix1a<-input$matrix1a
      
      #matrix1_0<-input$matrix1a
      #tempMat2<-tempMat[,2]
      matrix1_0<-as.matrix(as.numeric(matrix1a[,2]))
      
      meanFunc<-function(dat,wt){
        sum(dat * wt)
      }
      
      bootMean<-boot(as.numeric(unlist(matrix1_0[,1])),meanFunc,R=100000, stype = "w")$t
      
      dat0<-as.matrix(bootMean)
      
      colNames1<-vector(length=length(na.omit(dat0)))
      #colNames1[]<-colnames(matrix1_0)
      colNames1[]<-"Temp"
      
      matrix1_1<-cbind(na.omit(dat0),colNames1)
      
      matrix1_2<-na.omit(matrix1_1)
      
      dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
      
      dat1
    })
    
   # bootMean2<-reactive({
   #   
   #   matrix1_0<-input$matrix1b
   #   
   #   meanFunc<-function(dat,wt){
   #     sum(dat * wt)
   #   }
   #   
   #   bootMean<-boot(unlist(matrix1_0[,1]),meanFunc,R=100000, stype = "w")$t
   #   
   #   dat0<-as.matrix(bootMean)
   #   
   #   colNames1<-vector(length=length(na.omit(dat0)))
   #   colNames1[]<-colnames(matrix1_0)
   #   
   #   matrix1_1<-cbind(na.omit(dat0),colNames1)
   #   
   #   matrix1_2<-na.omit(matrix1_1)
   #   
   #   dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
   #   
   #   dat1
   # })
    
    bootMean2<-reactive({
      
      matrix1a<-input$matrix1a
      
      #matrix1_0<-input$matrix1a
      #tempMat2<-tempMat[,2]
      matrix1_0<-as.matrix(as.numeric(matrix1a[,3]))
      
      meanFunc<-function(dat,wt){
        sum(dat * wt)
      }
      
      bootMean<-boot(as.numeric(unlist(matrix1_0[,1])),meanFunc,R=100000, stype = "w")$t
      
      dat0<-as.matrix(bootMean)
      
      colNames1<-vector(length=length(na.omit(dat0)))
      #colNames1[]<-colnames(matrix1_0)
      colNames1[]<-"Temp"
      
      matrix1_1<-cbind(na.omit(dat0),colNames1)
      
      matrix1_2<-na.omit(matrix1_1)
      
      dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])),"Group"=unlist(matrix1_2[,2]))
      
      dat1
    })
    
    bootMean3<-reactive({
      
      matrix1a<-input$matrix1a
      
      #matrix1_0<-input$matrix1a
      #tempMat2<-tempMat[,2]
      matrix1_0<-as.matrix(as.numeric(matrix1a[,3])-as.numeric(matrix1a[,2]))
      
      meanFunc<-function(dat,wt){
        sum(dat * wt)
      }
      
      bootMean<-boot(as.numeric(unlist(matrix1_0[,1])),meanFunc,R=100000, stype = "w")$t
      
      dat0<-as.matrix(bootMean)
      
      colNames1<-vector(length=length(na.omit(dat0)))
      #colNames1[]<-colnames(matrix1_0)
      colNames1[]<-"Temp"
      
      matrix1_1<-cbind(na.omit(dat0),colNames1)
      
      matrix1_2<-na.omit(matrix1_1)
      
      dat1<-data.frame("Outcome"=as.numeric(unlist(matrix1_2[,1])))
      
      dat1
    })
    
    
    matrix1a<-reactive({
      matrix1a<-input$matrix1a
      matrix1a[,2]
    })
    
    matrix1b<-reactive({
      matrix1b<-input$matrix1a
      matrix1b[,3]
    })
    
    
    outcomeLabel<-reactive({
      input$outcomeLabel
    })
    
    predLabel<-reactive({
      input$predLabel
    })
    
    
    output$boxPlot2<-renderPlot({
      ggplot(dat(),aes(x=Outcome,y=Group)) + geom_boxplot() + xlab(outcomeLabel()) + ylab(predLabel())
      #ggplot() + geom_boxplot(aes(y=matrix1a))
    })
    
    output$histogram2<-renderPlot({
      ggplot(dat1(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + xlim(min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))),max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))+
                                                                                     0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b()))))) + ylab("Count")
      #ggplot() + geom_boxplot(aes(y=matrix1a))
    })
    
    output$histogram3<-renderPlot({
      ggplot(dat2(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + xlim(min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))),max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))+
                                                                                       0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b()))))) + ylab("Count")
      #ggplot() + geom_boxplot(aes(y=matrix1a))
    })
    
    output$histogram6<-renderPlot({
      ggplot(dat3(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + xlim(min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))),max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))+
                                                                                       0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b()))))) + ylab("Count")
      #ggplot() + geom_boxplot(aes(y=matrix1a))
    })
    
  
    
    output$histogram4<-renderPlot({
      bw<-(max(bootMean1()$Outcome)-min(bootMean1()$Outcome))/30
      nObs<-sum(!is.na(bootMean1()$Outcome))
      ggplot(bootMean1(),aes(x=Outcome)) + 
        geom_histogram(
          binwidth=bw#,
          #aes(y=..density..)
        ) + 
        xlab(outcomeLabel()) + 
        xlim(min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))),max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))+
               0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b()))))) + 
        ylab("Count")+
        stat_function(fun = function(x) 
          dnorm(x, mean = mean(bootMean1()$Outcome), sd = sd(bootMean1()$Outcome)) * bw * nObs,color="red")
    })
    
    output$histogram5<-renderPlot({
      bw<-(max(bootMean2()$Outcome)-min(bootMean2()$Outcome))/30
      nObs<-sum(!is.na(bootMean2()$Outcome))
      ggplot(bootMean2(),aes(x=Outcome)) + 
        geom_histogram(
          binwidth=bw#,
          #aes(y=..density..)
        ) + 
        xlab(outcomeLabel()) + 
        xlim(min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))),max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))+
               0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b()))))) + 
        ylab("Count") + 
        stat_function(fun = function(x) 
          dnorm(x, mean = mean(bootMean2()$Outcome), sd = sd(bootMean2()$Outcome)) * bw * nObs,color="red")
    })
    
    output$histogram7<-renderPlot({
      bw<-(max(bootMean3()$Outcome)-min(bootMean3()$Outcome))/30
      nObs<-sum(!is.na(bootMean3()$Outcome))
      ggplot(bootMean3(),aes(x=Outcome)) + 
        geom_histogram(
          binwidth=bw#,
          #aes(y=..density..)
        ) + 
        xlab(outcomeLabel()) + 
        xlim(min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b())))),max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))+
               0.1*(max(c(as.numeric(matrix1a()),as.numeric(matrix1b())))-min(c(as.numeric(matrix1a()),as.numeric(matrix1b()))))) + 
        ylab("Count") + 
        stat_function(fun = function(x) 
          dnorm(x, mean = mean(bootMean3()$Outcome), sd = sd(bootMean3()$Outcome)) * bw * nObs,color="red")
    })
    
    output$ttestTable<-renderTable({
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
      
      tTest<-t.test(dat(),mu=input$nullDiff)
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
      tTest<-t.test(Outcome~Group,data=dat(),mu=input$nullDiff)
      pValue<-ifelse(tTest$p.value<0.0001,"<0.0001",round(tTest$p.value,digits=4))
      data.frame("Method"=tTest$method,"t"=tTest$statistic,"DF"=tTest$parameter,"p-Value"=pValue)
    })
    
    
    output$forestPlot<-renderPlot({
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
  

  
  
  
  
  
  
  