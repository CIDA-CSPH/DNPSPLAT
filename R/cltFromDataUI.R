# Module UI function
cltFromDataUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    

    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           h2("Data"),
           br(),
           "Enter your outcome label and your data below.",
           br(),
           br(),
           textInput(ns("outcomeLabel"),"Enter Outcome Label",value="Body Mass Index"),
           #textInput(ns("predLabel"),"Enter Predictor Label",value="Treatment Group"),
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
                                                #"Enter your group names and data in the cells below.",
                                                br(),
                                                br(),
                                                column(6, 
                                                                                          style="background-color: white",
                                                                                          matrixInput(
                                                                                            inputId = ns("matrix1a"),
                                                                                            label = "Enter Data",
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
                                                                                                NULL#,
                                                                                                #c("Control")
                                                                                                )
                                                                                              ),
                                                                                            class = "numeric",
                                                                                            cols = list(
                                                                                              names = FALSE,
                                                                                              editableNames = FALSE
                                                                                              ),
                                                                                            rows = list(
                                                                                              names = FALSE,
                                                                                              extend=TRUE,
                                                                                              delta=1
                                                                                              )#,
                                                                                            #cells = list(editableCells = FALSE)
                                                                                            )
                                                                                          ),
                                                                                   #column(6, 
                                                                                   #       style="background-color:white",
                                                                                   #       matrixInput(
                                                                                   #  
                                                                                   #  inputId = ns("matrix1b"),
                                                                                   #  label = "Enter Group 2 Name & Data",
                                                                                   #  value = matrix(c(31.80,
                                                                                   #                   29.82,
                                                                                   #                   25.94,
                                                                                   #                   27.61,
                                                                                   #                   29.97,
                                                                                   #                   28.28,
                                                                                   #                   25.19,
                                                                                   #                   26.70,
                                                                                   #                   26.79,
                                                                                   #                   24.46,
                                                                                   #                   27.36,
                                                                                   #                   24.68,
                                                                                   #                   24.72,
                                                                                   #                   25.89,
                                                                                   #                   24.04,
                                                                                   #                   30.30,
                                                                                   #                   30.72,
                                                                                   #                   25.75,
                                                                                   #                   25.17,
                                                                                   #                   25.66,
                                                                                   #                   27.80,
                                                                                   #                   27.82,
                                                                                   #                   25.08,
                                                                                   #                   28.11,
                                                                                   #                   27.24,
                                                                                   #                   27.32,
                                                                                   #                   32.44,
                                                                                   #                   28.84,
                                                                                   #                   29.88,
                                                                                   #                   33.29,
                                                                                   #                   33.97),ncol=1,nrow=31,dimnames=list(NULL,c("Treatment"))),
                                                                                   #  class = "numeric",
                                                                                   #  cols = list(
                                                                                   #    names = TRUE,
                                                                                   #    editableNames = TRUE
                                                                                   #  ),
                                                                                   #  rows = list(
                                                                                   #    names = FALSE,
                                                                                   #    extend=TRUE,
                                                                                   #    delta=1
                                                                                   #  )
                                                                                   #  #,
                                                                                   #  #cells = list(editableCells = FALSE)
                                                                                   #)),
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
                                                "Paste your data (values separated by spaces) in the cells below.",
                                                br(),
                                                br(),
                                                column(6, 
                                                       style="background-color: white",
                                                       #textInput(ns("group1Name"),"Enter Group 1 Name",value="Control"),
                                                       textInput(ns("group1Data"),"Enter Data",value="35.74 33.84 29.99 31.75 34.09 32.28 29.16 30.77 30.61 28.49 31.29 28.55 28.70 29.94 28.09 34.38 34.81 29.70 29.09 29.77 31.90 31.82 29.20 32.04 31.22 31.12 36.50 32.89 37.40")
                                                ),
                                                #column(6, 
                                                #       style="background-color: white",
                                                #       textInput(ns("group2Name"),"Enter Group 2 Name",value="Treatment"),
                                                #       textInput(ns("group2Data"),"Enter Group 2 Data",value="31.80 29.82 25.94 27.61 29.97 28.28 25.19 26.70 26.79 24.46 27.36 24.68 24.72 25.89 24.04 30.30 30.72 25.75 25.17 25.66 27.80 27.82 25.08 28.11 27.24 27.32 32.44 28.84 29.88 33.29 33.97")
                                                #),
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
           
           h2("Distributions"),
           br(),
           #h3("Normality"),
           "Use the following plot to assess the assumption of normality.",
           br(),
           br(),
           column(6, 
                  h4("Distribution of Data"),
                  br(),
                  plotOutput(ns("histogram2"),height=300),
                  br(),
                  #plotOutput(ns("histogram3"),height=300),
                  #br()
           ),
           column(6, 
                  h4("Distribution of Sample Means (bootstrapped)"),
                  br(),
                  plotOutput(ns("histogram4"),height=300),
                  br(),
                  #plotOutput(ns("histogram5"),height=300),
                  #br()
                  
           ),
           br(),
           br(),
           br(),
           br(),
           
    )
  )
  
  
  
  
  
  
  
  
}








cltFromDataServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      dat<-reactive({
        
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
      
      bootMean1<-reactive({
        
        matrix1_0<-input$matrix1a
        
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
        
        matrix1_0<-input$matrix1b
        
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
      
      
      matrix1a<-reactive({
        matrix1a<-input$matrix1a
        matrix1a
      })
      
      matrix1b<-reactive({
        matrix1b<-input$matrix1b
        matrix1b
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
        ggplot(dat1(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + ylab("Count")
        #ggplot() + geom_boxplot(aes(y=matrix1a))
      })
      
      output$histogram3<-renderPlot({
        ggplot(dat2(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + ylab("Count")
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
          xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + 
          ylab("Count") + 
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
          xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + 
          ylab("Count") + 
          stat_function(fun = function(x) 
            dnorm(x, mean = mean(bootMean2()$Outcome), sd = sd(bootMean2()$Outcome)) * bw * nObs,color="red")
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
        
        tTest<-t.test(Outcome~Group,data=dat(),mu=input$nullDiff)
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
