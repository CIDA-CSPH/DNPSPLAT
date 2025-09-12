# Module UI function
planDNPUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
 br(),
           
           
           column(width=9, style="background-color: white",
                  
                  
                  h2("Planning Data Analyses for DNP Projects"),

                  br(),
                  "This video goes through a table that will be useful in determining your statistical analysis plan, and in meeting with a statistician.",
                  br(),
                  br(),
                  ####  ## Link to handout document, which will open in a new browser tab with the opportunity to download it 
                  tags$a("View or Download PDF: Data Analysis for DNP Students",target="_blank",href="240628 Data Analysis for DNP Students.pdf", align="center"),
                  
                  br(),
                  tags$a("Download Word Document: Data Analysis for DNP Students",target="_blank",download="240628 Data Analysis for DNP Students.docx",href="240628 Data Analysis for DNP Students.docx", align="center"),
                  
                    br(),
                    br(),
                  ## Video icon and link
                  tags$div(style="display:inline-block;width:500px;height:200;",
                           title="T-Tests",
                           actionButton(ns("videoDNP10"),
                                        label=NULL,
                                        style="width: 350px;
                                    height: 200px;
                                    #padding: 10px; 
                                    font-size: 200%;
                                    background: url('vidLectImage.png');
                                    background-size: cover;
                                    background-position: center;"
                           )
                  ),
                  br(),
                  br(),
                  ############################################
                  ##  End video and possibly handout section
                  ############################################
                  

                  
                  h3("Statistical Analysis Plan and Statistical Methods Section"),
                  "In the statistical analysis plan of your proposal and in the statistical methods section of your final presentation, the analysis for each measure must be described fully, although it’s ok to combine the description for two measures that will be analyzed in the same manner, such as, 'run charts will be created for __measure_1__ and for __measure_2__...'",
                  br(),
                  h3("Components of an Analysis"),
                  "There are three possible components to the analysis for a given measure:",
                    "1.	Descriptive statistics",
                  "2.	Plots",
                  "3.	A decision on/test of the effect of the intervention, which can be arrived at through one of two means:",
                    "a.	Applying run chart rules if possible (preferred)",
                  "b.	Conducting a hypothesis test if applying run chart rules is impossible or highly impractical.",
                  "The analysis for an outcome measure needs to have all three components. The analysis for a balancing or process measure needs to at least include descriptive statistics, though it may include plots and/or a test if mentors/DNP faculty/proposal reviewers deem it necessary.",
                  br(),
                  h3("Multiple Testing Options"),
                  "At most, one test should be performed or one set of rules applied for each measure. This means there will never be a situation where the run chart rules lead to one conclusion while a hypothesis test leads to a different conclusion because you did one or the other, not both (for a given measure). The test should be decided on prior to data analysis.",
                  br(),
                  h3("Matching Analyses to the Data Analysis Plan"),
                  "When deciding what analysis to do after data collection, a student should do one of the following:",
                  "1.	Do the analyses they specified for a given measure in their proposal",
                  "2.	Change to a more appropriate analysis if the analysis specified in their proposal is no longer possible (for instance, no pre-intervention data were available) or if it is possible but highly impractical (for instance, a t-test with only 3 subjects per group).", 
                  "If the analysis needs to change, you should include a paragraph that has a sentence or two addressing each of the following",
                  "1.	What changed with the circumstances of your project (for instance, discuss the clinical/scientific/practical reasons that you only had 3 observations)",
                  "2.	Why that made the analysis in your proposal impossible or impractical (for instance, a t-test with only 3 observations per group has virtually no statistical power)",
                  "3.	What the new analysis will be",
                  br(),
                  
                  h3("Analysis Planning Handout and Table"),
                  "Use the following links to view and/or download our analysis planning document, which includes a table that you should try to fill out before meeting with me for the first time.",
                  br(),

                  
                  tags$a("View or Download PDF: Data Analysis for DNP Students",target="_blank",href="240628 Data Analysis for DNP Students.pdf", align="center"),
              
                  br(),
                  tags$a("Download Word Document: Data Analysis for DNP Students",target="_blank",download="240628 Data Analysis for DNP Students.docx",href="240628 Data Analysis for DNP Students.docx", align="center"),
                  br(),
                  br(),
                  br(),
                  br()

                  
           )
           
    )
  )
  
  
  
  
  
  
  
  
}








planDNPServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
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
      
      selectedWidth<-reactive({
        input$widthSelect
      })
      
      selectedHeight<-reactive({
        input$heightSelect
      })
      

      
      
      output$runChartPlot<-renderPlot({
        matrix1a<-as.Date(input$matrix1a)
        matrix1a1<-as.Date(input$matrix1a, "%m/%d/%Y")
        matrix1b<-input$matrix1b
        
        dat<-data.frame("Date"=matrix1a,"Estimate"=matrix1b)
        
        blDat<-matrix1b[which(matrix1a[]<input$interventionStart)]
        blMedian<-median(blDat)
               
        runChartPlot<-ggplot() +
          geom_line(aes(x=as.Date(matrix1a1, "%m/%d/%Y"),y=matrix1b),size=input$lineSize)+
          geom_point(aes(x=as.Date(matrix1a1, "%m/%d/%Y"),y=matrix1b), size = input$lineSize+3) +  
          #geom_segment(aes(x = Group, y = lcl, xend = Group, yend = ucl))+
          #geom_errorbarh(aes(xmin = lcl, xmax = ucl), height = 0.25) +
           #scale_y_continuous(name = "", breaks=1:4, labels = dat$label, trans = "reverse") +
          #ylab(outcomeLabel()) + 
          ggtitle(input$chartTitle,subtitle=input$subTitle)+
          xlab(input$xLab)+
          ylab(input$yLab)+
          ylim(c(input$yMin,input$yMax))+
          #xlim(c(0,3))+ 
          scale_x_date(name =  , minor_breaks=as.Date(matrix1a1, "%m/%d/%Y") #+#, trans = "reverse"
                           ) +
          theme_bw() +
          theme(panel.border = element_blank(),
                legend.position="right",
                panel.background = element_blank(),
                panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                axis.line = element_line(colour = "black",size=input$lineSize),
                axis.text.y = element_text(size = input$textSize, colour = "black"),
                axis.text.x.bottom = element_text(size = input$textSize, colour = "black"),
                axis.title.x = element_text(size = input$textSize, colour = "black"),
                axis.title.y = element_text(size = input$textSize, colour = "black"),
                plot.title = element_text(size=input$textSize+10, colour="black",hjust=0.5),
                plot.subtitle = element_text(size=input$textSize+6, colour="black",hjust=0.5))
        
        goalPlot<-geom_hline(yintercept = input$goal, color = "red", linetype = "solid", cex = input$lineSize, alpha = 0.5)
        blMedianPlot<-geom_hline(yintercept = blMedian, color = "darkgreen", linetype = "solid", cex = input$lineSize, alpha = 0.5) 
        interventionStartPlot<-geom_vline(xintercept = as.Date(input$interventionStart, "%m/%d/%Y"), color = "blue", linetype = "solid", cex = input$lineSize, alpha = 0.5) 
        
        
        if(input$goalSelect==1 & input$blMedianSelect==1 & input$interventionStartSelect==1){
          plotAll<-runChartPlot+
            goalPlot +
            blMedianPlot +
            interventionStartPlot
                        
        }
        if(input$goalSelect==2 & input$blMedianSelect==1 & input$interventionStartSelect==1){
          plotAll<-runChartPlot+
            blMedianPlot +
            interventionStartPlot
          
        }
        if(input$goalSelect==1 & input$blMedianSelect==2 & input$interventionStartSelect==1){
          plotAll<-runChartPlot+
            goalPlot +
            interventionStartPlot
          
        }
        if(input$goalSelect==1 & input$blMedianSelect==1 & input$interventionStartSelect==2){
          plotAll<-runChartPlot+
            goalPlot +
            blMedianPlot 
          
        }
        if(input$goalSelect==1 & input$blMedianSelect==2 & input$interventionStartSelect==2){
          plotAll<-runChartPlot+
            goalPlot 
          
        }
        if(input$goalSelect==2 & input$blMedianSelect==1 & input$interventionStartSelect==2){
          plotAll<-runChartPlot+
            blMedianPlot
          
        }
        if(input$goalSelect==2 & input$blMedianSelect==2 & input$interventionStartSelect==1){
          plotAll<-runChartPlot+
            interventionStartPlot
          
        }
        if(input$goalSelect==2 & input$blMedianSelect==2 & input$interventionStartSelect==2){
          plotAll<-runChartPlot
          
        }
        
        plotAll
                  
        
              },width=reactive({
                selectedWidth()}),
                height=reactive({
                  selectedHeight()})
        )
      
      
      
      
      
      
      observeEvent(input$videoDNP10,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Analysis Planning"),
            tags$iframe(
              width="1280",
              height="720",
              src = "videoDNP10.mp4",
              #src = "video4a.pdf",
              frameborder="0", 
              allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
              allowfullscreen=NA
            ),
            br(),
            br(),
            column(width = 4,
                   br(),
                   br(),
                   #actionButton(("video40_3f"), label = "< Previous Video") ,actionButton(("video40_4a"), label = "Next Video >") 
            ), #end column
            column(width = 4,
                   br(),
                   br()#,
                   #tags$a("Handout: Best Data Practices",target="_blank",href="dataPract.pdf", align="center"),
                   #br(),
                   #tags$a("Booklet of All Materials",target="_blank",href="bookAll.pdf", align="center")
            ),
            br(),
            br(),
          )
        ))
      })
      
      

      
      
    }
  )    
}
