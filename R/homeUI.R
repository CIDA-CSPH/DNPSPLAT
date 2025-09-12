# Module UI function
homeUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
 br(),
           
           
           column(width=9, style="background-color: white",
                  
                  
                  h2("Center for Research and Nursing Scholarship"),
                  h4("Office of Research and Scholarship"),
                  h4("College of Nursing"),
                  h4("University of Colorado Anschutz Medical Campus"),
                  br(),
                  br(),
                  "Bryan McNair, MS", br(),	
                  "Instructor", br(),	
                  "Center for Innovative Design and Analysis",br(),
                  "Department of Biostatistics and Informatics", br(),	
                  "Colorado School of Public Health", br(),	
                  "University of Colorado Anschutz Medical Campus", br(),	
                  "Bryan.McNair@cuanschutz.edu", br(),
                  br(),
                  br(),
                  
                  "Welcome to the Statistical Planning, Learning, and Analysis Tool. This tool is primarily meant for our DNP students. The content reflects this. The 'Learn' tab above contains learning modules with video lectures and handouts on various statistical topics and is meant to supplement formal statistical coursework. The 'Plan' tab above contains resources and handouts that are useful during the planning stage of a study. The Analyze tab contains point and click analysis tools. There are currently tools for conducting a two-sample t-test, conducting a paired t-test, conducting a chi-square test, conducting a Fisher's exact test, conducting a McNemar's test, calculating confidence intervals for means and percentages, and creating run charts and longitudinal plots. Each of these tools includes an instructional video, which can also be found under the 'Learn' tab.",
                  br(),
                  br(),
                  h4("Appointments"),
                  br(),
                  h5("DNP Students"), 
                  "Initial Meeting: You can schedule a meeting (no need to email first) using this link:",
                  tags$a("DNP Meeting with CRNS statistician",target="_blank",href="https://outlook.office365.com/book/CollegeofNursingDNPMeetings@cuanschutz.edu/", align="center"),
                  
                  "If none of the availble times work for you, please email (addresses in Microsoft Teams) so we can find a time that works for both of us.",br(),
                  
                  "Follow-up Meetings: You’re welcome to meet with me as often as you need to. Schedule follow-up meetings using the same link above.", br(),
                  br(),
                  h5("Non-DNP-Students and Faculty"), 
                  "Please email con.research@cuanschutz.edu before scheduling a meeting.",
                       
                  
                  
                  
                  
                  
                  #br(),
                  br(),
                  br()
                  
           )
           
    )
  )
  
  
  
  
  
  
  
  
}








homeServer <- function(id) {
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
      
      
      

      
      
    }
  )    
}
