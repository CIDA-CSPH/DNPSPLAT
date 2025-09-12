# Module UI function
ciForProportionUI <- function(id) {
  
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
                    "Enter your goal or null value for the population proportion ",intToUtf8(0x03C0),tags$sub("0")," here:"
                  )),
                  br(),
                  br(),
                  numericInput(ns("goal"),HTML(paste(
                    intToUtf8(0x03C0),tags$sub("0")," = ",sep=""
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
           
           br(),
           column(width=10,
                  h2("Data")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         actionButton(ns("snip5b1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip5b2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
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
                                                      
                                                       textInput(ns("outcomeLabel"),"Enter Outcome Label",value="30-Day Readmission Rate"),
                                                       numericInput(ns("numerator"),"Enter Number with Event (proportion/percentage numerator)",value="32"),
                                                       numericInput(ns("denominator"),"Enter Total Number Eligible/At Risk (proportion/percentage denominator)",value="86"),
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
                                                       "Paste the outcome/percentage label, the number of events (percentage numerator) and the number at risk 
                                                       (percentagge denominator) below.",
                                                       br(),
                                                       br(),
                                                       textInput(ns("outcomeLabel2"),"Enter Outcome Label",value="30-Day Readmission Rate"),
                                                       numericInput(ns("numerator2"),"Enter Number with Event (proportion/percentage numerator)",value="32"),
                                                       numericInput(ns("denominator2"),"Enter Total Number Eligible/At Risk (proportion/percentage denominator)",value="86"),
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
                                                       "Upload an analysis file by entering your data file location below. You can download an example analysis file to see its formatting and modify it by entering your own data by clicking this link:",
                                                       br(),
                                                       br(),
                                                       tags$a(href="ciForPropIn.xlsx",download="ciForPropIn.xlsx",
                                                              "Example Analysis File for Confidence Interval for Percentage",target="_blank"),
                                                       br(),
                                                       br(),
                                                       "You can also use the Analysis file (Analysis Tab in downloaded file) saved after using this tool previously. The fact that you can upload that file and get the exact same results as you did then is what makes this reproducible research (see last section).",
                                                       
                                                       br(),
                                                       br(),
                                                       
                                                       fileInput(ns("ciPropData"),"Enter data file location",accept=".xlsx"),
                                                       br(),
                                                       br(),
                                                       br(),
                                                       br(),
                                                       br(),
                                                       h3("Values Read"),
                                                       textInput(ns("outcomeLabel3"),"Outcome Label",value="30-Day Readmission Rate"),
                                                       numericInput(ns("numerator3"),"Number with Event (proportion/percentage numerator)",value="32"),
                                                       numericInput(ns("denominator3"),"Total Number Eligible/At Risk (proportion/percentage denominator)",value="86"),
                                                       br(),
                                                       br()
                                                ),
                                                br()
                                              ),
                                              br()
                                              
                                     ),
                                     tabPanel("Paste Data",value=4,
                                              style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                              br(),
                                              fluidPage(
                                                column(12,style = " background-color: white; border-radius: 5px; ",
                                                       h3("Paste Data"),
                                                       "Type the outcome/percentage label, the number of events (percentage numerator) and the number at risk 
                                                       (percentagge denominator) below.",
                                                       br(),
                                                       br(),
                                                       textInput(ns("outcomeLabel4"),"Enter Outcome Label",value="30-Day Readmission Rate"),
                                                       numericInput(ns("numerator4"),"Enter Number with Event (proportion/percentage numerator)",value="32"),
                                                       numericInput(ns("denominator4"),"Enter Total Number Eligible/At Risk (proportion/percentage denominator)",value="86"),
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
           h2("Tables and Figures for Publication"),
           br(),
           "The following table is a publication-worthy way to display your results. 
       The figure below is one way to graphically display your results.",
           br(),
           br(),
       h4(textOutput(ns("resultsTableTitle"))),
       br(),
           tableOutput(ns("ciForProportionTable")),
           br(),
           br(),
           plotOutput(ns("forestPlotForProportion"),inline = TRUE),
           br(),
       br(),  column(12,
                     bsCollapse(id="plotOptions",open="Panel 1",
                                bsCollapsePanel("Show Plot Options",
                                                column(4, style = "background-color: white; border-radius: 5px; ",
                                                       textInput(ns("chartTitle"),"Enter Chart Title",value="30-Day Readmission Rate"),
                                                       textInput(ns("subTitle"),"Enter Chart Sub-Title",value="Percent and 95% Confidence Interval"),
                                                       numericInput(ns("widthSelect"),"Enter the Chart Width",value="500"),
                                                       numericInput(ns("heightSelect"),"Enter the Chart Height",value="600"),
                                                       textInput(ns("goalLabel"),"Enter Label for Goal/Null Value",value="Rate Goal"),
                                                ),
                                                column(4, style = "background-color: white; border-radius: 5px; ",
                                                       textInput(ns("xLab"),"Enter X-Axis Label",value=""),
                                                       textInput(ns("yLab"),"Enter Y-Axis Label",value="30-Day Readmission Rate"),
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
    
    
    column(12, style = " background-color: white; border-radius: 5px; ",
           h3("Methods"),
           "The following is an example of what one might write about this estimate in the methods section of a paper. 
       This example uses the 30-day readmission rate data present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way.",
           br(),
           br(),
           em("The sample 30-day readmission percentage was calculated, as was a Clopper-Pearson 95% confidence interval."),
           br(),
           br(),
           h3("Results"),
           "The following is an example of what one might write about the results of this estimate in the results section of a paper. 
       This example uses the 30-day readmission rate data present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way.",
           br(),
           br(),
           em("37.21% of patients were readmitted within 30 days, with a 95% confidence interval of 27.02% to 48.30%. While our observed rate did not acheive our goal readmission rate of 30% or less, we can rule out a true, underlying readmission rate greater than 48.30% with 95% confidence."),
           
           
           br(),
           br(),
           br()
    )
    ),
    column(12,
           br(),
           br(),
           br(
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
           as information about the analysis tool itself. A third sheet contains all of you graphical output. Click the link below to download your reproducible analysis file and your results:",
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
    
    
  )
  
  
  
  
  
  
  
  
}








ciForProportionServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      version<-reactive({
        1.1
      })
      
      
      goal<-reactive({
        goal<-input$goal
        goal
      })
      
      
      
      
      outcomeLabel<-reactive({
        if(input$dataInput==1){
          input$outcomeLabel
        }
        if(input$dataInput==2){
          input$outcomeLabel2
        }
        if(input$dataInput==3){
          input$outcomeLabel3
        }
        if(input$dataInput==4){
          input$outcomeLabel4
        }
        
      })
      
      
      numerator<-reactive({
        if(input$dataInput==1){
          as.numeric(input$numerator)
        }
        if(input$dataInput==2){
          input$numerator2
        }
        if(input$dataInput==3){
          input$numerator3
        }
        if(input$dataInput==4){
          input$numerator4
        }
        
      })
      
      
      denominator<-reactive({
        if(input$dataInput==1){
          as.numeric(input$denominator)
        }
        if(input$dataInput==2){
          input$denominator2
        }
        if(input$dataInput==3){
          input$denominator3
        }
        if(input$dataInput==4){
          input$denominator4
        }
        
      })
      
      
      ciForProportionTable1<-reactive({
        if(input$dataInput==1){
          label<-input$outcomeLabel
          numerator<-input$numerator
          denominator<-input$denominator
        }
        if(input$dataInput==2){
          label<-input$outcomeLabel2
          numerator<-input$numerator2
          denominator<-input$denominator2
        }
        if(input$dataInput==3){
          label<-input$outcomeLabel3
          numerator<-input$numerator3
          denominator<-input$denominator3
        }
        if(input$dataInput==4){
          label<-input$outcomeLabel4
          numerator<-input$numerator4
          denominator<-input$denominator4
        }
      
        p1<-numerator/denominator
        
        ciP1<-clopper.pearson.ci(k=numerator, n=denominator, alpha = 0.05, CI = "two.sided")

        lcl1<-ciP1$Lower.limit
        ucl1<-ciP1$Upper.limit
       
        Results<-data.frame("Outcome"=paste(label),
                            "Goal"=paste(round(goal(),digits=2),"%",sep=""),
                            "Percentage (95% CI)"=paste(round(p1*100,digits=2),"% (",round(lcl1*100,digits=2),"%, ",round(ucl1*100,digits=2),"%)",sep="")
                            
        )
        colnames(Results)<-c("Outcome","Goal/Null Value","Percentage (95% CI)")
        
        
        Results
        
      })
      


      
      forestPlotForProportion1<-reactive({
        if(input$dataInput==1){
          label<-input$outcomeLabel
          numerator<-input$numerator
          denominator<-input$denominator
        }
        if(input$dataInput==2){
          label<-input$outcomeLabel2
          numerator<-input$numerator2
          denominator<-input$denominator2
        }
        if(input$dataInput==3){
          label<-input$outcomeLabel3
          numerator<-input$numerator3
          denominator<-input$denominator3
        }
        if(input$dataInput==4){
          label<-input$outcomeLabel4
          numerator<-input$numerator4
          denominator<-input$denominator4
        }
        
        p1<-numerator/denominator
        
        ciP1<-clopper.pearson.ci(k=numerator, n=denominator, alpha = 0.05, CI = "two.sided")
        
        lcl1<-ciP1$Lower.limit
        ucl1<-ciP1$Upper.limit
        
        
        dat2<-data.frame("Index"=1,"Estimate"=p1*100,
                         "lcl"=lcl1*100,"ucl"=ucl1*100,
                         "Group"="tempGroupName"
        )
        
        dat2$Group <- as.character(dat2$Group)
        dat2$Group <- factor(dat2$Group, levels=unique(dat2$Group))
        #ggplot(dat1(),aes(x=Outcome)) + geom_histogram() + xlab(outcomeLabel()) + xlim(min(c(matrix1a(),matrix1b()))-0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b()))),max(c(matrix1a(),matrix1b()))+0.1*(max(c(matrix1a(),matrix1b()))-min(c(matrix1a(),matrix1b())))) + ylab("Count")
        
        colors<-c("Mean"="black","Goal/Null Value"="red")
        
    
        
        plot<-ggplot(dat2,aes(y=Estimate,x=Group)) +
          geom_point(shape = 18, size = input$lineSize+3,color="black") +  
          geom_segment(aes(x = Group, y = lcl, xend = Group, yend = ucl,linetype="Percentage & Confidence Interval"),size=input$lineSize,color="black")+
          
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
            scale_linetype_manual(name="Legend",values=c(1,2), 
                                  guide = guide_legend(override.aes = list(color = c("black","red"))))
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
      
      
      output$ciForProportionTable<-renderTable({
        ciForProportionTable1()
      })
      
      
      output$forestPlotForProportion<-renderPlot({
        forestPlotForProportion1()
      },width=reactive({
        selectedWidth()}),
      height=reactive({
        selectedHeight()}))
      
      
      
      
      
      selectedWidth<-reactive({
        input$widthSelect
      })
      
      selectedHeight<-reactive({
        input$heightSelect
      })
      
      
      
      resultsTableTitle1<-reactive({
        paste("Table 1.",outcomeLabel(),"Percentage with Confidence Interval and Goal")
      })
      
      output$resultsTableTitle<-renderText({
        resultsTableTitle1()
      })
      
 
      
     
      
      
      
      
      output$downloadData<-downloadHandler(filename=function(){
        paste0(tempdir(), "/", "ciForProp.xlsx")
      },
      content=function(file){
        
        if(input$dataInput==1){
          label<-input$outcomeLabel
          numerator<-input$numerator
          denominator<-input$denominator
        }
        if(input$dataInput==2){
          label<-input$outcomeLabel2
          numerator<-input$numerator2
          denominator<-input$denominator2
        }
        if(input$dataInput==3){
          label<-input$outcomeLabel3
          numerator<-input$numerator3
          denominator<-input$denominator3
        }
        if(input$dataInput==4){
          label<-input$outcomeLabel4
          numerator<-input$numerator4
          denominator<-input$denominator4
        }
        
        wb = createWorkbook()
        
        sheet = addWorksheet(wb, "Analysis",gridLines = FALSE)
        
        headStyle<-createStyle(border = "TopBottom", borderColour ='black', borderStyle="thick",textDecoration = "bold")
        bottomStyle<-createStyle(border="Bottom",borderStyle="thick")
        boldStyle<-createStyle(textDecoration = "bold")
        
        col1<-matrix(c("CI for Percentage","",
                       "Outcome Label:",label,"",
                       "Predictor Label:","NA","",
                       "Goal/Null Hypothesis:",goal(),"",
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
                       "Estimator Type:","Clopper-Pearson Confidence Interval","",
                       "Contingency Table Rows","NA","",
                       "Contingency Table Columns","NA",""),ncol=1)
        colnames(col1)<-"Tool:"
        
        writeData(wb,sheet=sheet,x=as.data.frame(col1), startCol=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x="Contingency Table with Row and Column Labels", startCol=3, rowNames=FALSE)
        col2<-matrix(c("Numerator:",numerator,"",
                       "Denominator:",denominator,""),ncol=1)
        colnames(col2)<-"Data"
        writeData(wb,sheet=sheet,x=as.data.frame(col2), startCol=2,startRow = 1, rowNames=FALSE)
        setColWidths(wb,sheet,cols=1,widths = "auto")
        
        sheet = addWorksheet(wb, "Tabular Output",gridLines = FALSE)
        
        
        header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny"),ncol=1)
        colnames(header)<-"General Information"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header), startCol=1, startRow=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        header2<-matrix(c("Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus"),ncol=1)
        colnames(header2)<-"Creator"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header2), startCol=1, startRow=8, rowNames=FALSE)
        
        header3<-matrix(c("Confidence Interval for Mean",
                          "Core R Packages and Functions: clopper.pearson.ci{GenBinomApps}; ggplot{ggplot2}"),ncol=1)
        colnames(header3)<-"Tool"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header3), startCol=1, startRow=15, rowNames=FALSE)
        
        
        #header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),
        #                 paste0("System Time:",format(Sys.time(),"%H:%M:%S")),
        #                 "Statistical Planning, Learning, and Analysis Tool",
        #                 paste("Version:",version()),
        #                 "An R tool built with Shiny","",
        #                 "Created by Bryan McNair, MS",
        #                 "Center for Innovative Design and Analysis",
        #                 "Department of Biostatistics and Informatics",
        #                 "Colorado School of Public Health",
        #                 "University of Colorado Anschutz Medical Campus","","",
        #                 "Tool: Confidence Interval for Mean",
        #                 "Core R Packages and Functions: clopper.pearson.ci{GenBinomApps}; ggplot{ggplot2}"
        #),ncol=1)
        #colnames(header)<-"General Information"
        #
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        #expected<-expected1()
        #testTable<-testTable1()
        #propTable<-propTable1()
        #resultsTable<-resultsTable1()
        resultsTableTitle<-resultsTableTitle1()
        ciForPropTable<-ciForProportionTable1()
        
        writeData(wb,sheet=sheet,x="Publishable Table", startCol=3+4, startRow=1, rowNames=FALSE)
        writeData(wb,sheet=sheet,x=resultsTableTitle, startCol=3+4, startRow=3, rowNames=FALSE)
        writeData(wb,sheet=sheet,x=ciForPropTable, startCol=3+4, startRow=5, rowNames=FALSE)
        addStyle(wb,sheet,style=boldStyle,rows=c(1,3),cols=3+4)
        addStyle(wb,sheet,style=headStyle,rows=5,cols=c((3+4):(3+4+2)))
        addStyle(wb,sheet,style=bottomStyle,rows=6,cols=c((3+4):(3+4+2)))
        setColWidths(wb,sheet,cols=c(1:256),widths = "auto")
        
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
        

        forestPlotForProp<-forestPlotForProportion1()
        
        selectedHeight<-selectedHeight()
        selectedWidth<-selectedWidth()
        

        png(paste0(tempdir(), "/", "forestPlotForProp.png"), width=selectedWidth*4, height=selectedHeight*4, units="px", res=300)
        print(forestPlotForProp)
        dev.off()  
        insertImage(wb, sheet=sheet, paste0(tempdir(), "/", "forestPlotForProp.png"), startRow=5, startCol=2,width=selectedWidth*4, height=selectedHeight*4, units="px")
        
        writeData(wb,sheet=sheet,x="Figure for Publication", startCol=2, startRow=2, rowNames=FALSE,colNames=FALSE)
        addStyle(wb,sheet,style=boldStyle,rows=2,cols=2)
        
        
        saveWorkbook(wb, file,overwrite=TRUE)
        
      })
      
      
      
      
      
      
      Dat1ab <- reactiveVal()
      #Dat1a <- reactiveVal()
      #Dat1b <- reactiveVal()
      
      observeEvent(input[["ciPropData"]], {
        xlfile <- input[["ciPropData"]][["datapath"]]
        ext <- tolower(tools::file_ext(xlfile))
        if(ext == "xlsx") {
          sheets <- excel_sheets(xlfile)
          if(length(sheets) == 1L) {
            Dat1ab(read_xlsx(input[["ciPropData"]][["datapath"]], sheet = 1L))
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
        if(read_xlsx(input[["ciPropData"]][["datapath"]], sheet = input[["sheet"]])[1,1] != "CI for Percentage"){
          sendSweetAlert(
            session,
            title = "Incorrect File",
            text = "Not a CI for Percentage Analysis File. Please upload an analysis file compatible with the CI for Percentage Tool.",
            type = "error",
            btn_colors="#5f5f62"
          )
        }else{
          Dat1ab(read_xlsx(input[["ciPropData"]][["datapath"]], sheet = input[["sheet"]]))
          dat<-Dat1ab()
          options<-as.matrix(dat[,1])
          numerator<-as.numeric(dat[2,2])
          denominator<-as.numeric(dat[5,2])
          updateNumericInput(session,"numerator3",value=numerator)
          updateNumericInput(session,"denominator3",value=denominator)
          updateTextInput(session,"outcomeLabel3",value=options[4])
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
        input$snip5a2,{showModal(modalDialog(tags$div(style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
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
                               "We aren't truely using raw data here. We've already started the process of summarizing the data by counting the number of observations with events 
                               and the total number of observations, with or without an event. These two counts become the numerator and denominator of our proportion, which we multiply 
                               by 100% to get our percentage. The numerator and denominator taken as a set give us the information we need to calculate both the percentage itself and the 
                               confidence interval that goes with it. However, if we were given just the proportion or percentage without knowing the numerator and denominator distinctly, 
                               we wouldn't be able to calculate the confidence interval. For instance, if you tell me the percentage is 50%, I don't know if that's 5 out of 10 or 500 out of 1000. Both 
                               give a point estimate of 50%, but the latter has a whole lot more certainty associated with it, with a confidence interval of (46.85%, 53.15%), compared to (18.71%, 81.29%) for the former.",
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
                  src = "snip1e2.mp4", ##### Change this one every time
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
           em("The sample 30-day readmission percentage was calculated, as was a Clopper-Pearson 95% confidence interval."),
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
           em("37.21% of patients were readmitted within 30 days, with a 95% confidence interval of 27.02% to 48.30%. While our observed rate did not acheive our goal readmission rate of 30% or less, we can rule out a true, underlying readmission rate greater than 48.30% with 95% confidence."
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
