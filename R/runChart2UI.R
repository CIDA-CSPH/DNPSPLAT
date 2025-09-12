# Module UI function
runChart2UI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           br(),
           column(width=12,
                  h2("Data")),
           #column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
           #       column(width=6,h4(style="color:#818e9f;", "Learn:")),
           #       column(width=4,
           #              actionButton(ns("snip7a1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
           #              actionButton(ns("snip7a2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
           #              #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
           #       )),
           br(),
           br(),
           br(),
            column(12,
                   br(),
                   "Choose a tab below. You can practice with the tool and learn about run charts using the example data. Or, you can paste or upload your own data from Excel using the Paste Data and the Upload Data tabs.",
                   br(),
                   br()
                   ),
           
           br(),
           br(),
           br(),
           br(),
           
           
           column(width=9, style="background-color: white",
                  
                  tabsetPanel(type = "tabs",id=ns("dataEntry"),
                              
                              tabPanel("Example Data", value=1,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                              h3("Example Data"),
                                                "These are simulated data and do not represent real-world observations. You can modify them to ee how it effects the ran chart and the evaluation of the run chart rules.",
                                                br(),
                                                br(),
                                                column(6, 
                                                                                          style="background-color: white",
                                                                                          matrixInput(
                                                                                            inputId = ns("matrix1a"),
                                                                                            label = "Time Variable (Dates)",
                                                                                            value = matrix(
                                                                                              c(
                                                                                                "01/01/2024",
                                                                                                "02/01/2024",
                                                                                                "03/01/2024",
                                                                                                "04/01/2024",
                                                                                                "05/01/2024",
                                                                                                "06/01/2024",
                                                                                                "07/01/2024",
                                                                                                "08/01/2024",
                                                                                                "09/01/2024",
                                                                                                "10/01/2024",
                                                                                                "11/01/2024",
                                                                                                "12/01/2024"
                                                                                              ),
                                                                                              ncol=1,
                                                                                              nrow=12,
                                                                                              dimnames=list(NULL,NULL)
                                                                                              ),
                                                                                            class = "text",
                                                                                            cols = list(
                                                                                              names = FALSE,
                                                                                              extend=FALSE,
                                                                                              editableNames = FALSE
                                                                                              ),
                                                                                            rows = list(
                                                                                              names = FALSE,
                                                                                              extend=TRUE,
                                                                                              editableNames = FALSE,
                                                                                              delta=1
                                                                                              )#,
                                                                                            #cells = list(editableCells = FALSE)
                                                                                            )
                                                                                          ),
                                                column(6, 
                                                       style="background-color: white",
                                                       matrixInput(
                                                         inputId = ns("matrix1b"),
                                                         label = "Summary Statistic (mean, %, etc.)",
                                                         value = matrix(
                                                           c(
                                                             47,43,65,51,59,71,77,81,83,79,82,87
                                                           ),
                                                           ncol=1,
                                                           nrow=12,
                                                           dimnames=list(NULL,NULL)
                                                         ),
                                                         class = "numeric",
                                                         cols = list(
                                                           names = FALSE,
                                                           extend=FALSE,
                                                           editableNames = FALSE
                                                         ),
                                                         rows = list(
                                                           names = FALSE,
                                                           extend=TRUE,
                                                           editableNames = FALSE,
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
                              
                              
                              tabPanel("Paste Data",value=2,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Paste Data"),
                                                "Paste one column of date or time values and one column of summary statistic values (means, percentages, etc.) 
                                                from Excel into the fields below. The first/top row of each should 
                                                contain column/variable labels. After pasting, look at the table below the paste fields to see that your data 
                                                have been read in correctly.",
                                                br(),
                                                br(),
                                                
                                                                   
                                                
                                                
                                                column(6,
                                                       textAreaInput(ns("matrix1a2in"),"Paste time/date data here.",
                                                                     value="Example Date\n1/1/2024\n2/1/2024\n3/1/2024\n4/1/2024\n5/1/2024\n6/1/2024\n7/1/2024\n8/1/2024\n9/1/2024\n10/1/2024\n11/1/2024\n12/1/2024",
                                                                     width="200px",height="400px",cols=1),
                                               
                                                       br(),
                                                       br(),
                                                       
                                                ),
                                                column(6,
                                                       textAreaInput(ns("matrix1b2in"),"Paste summary statistic data here.",
                                                                     value="Example Percentage\n10\n12\n11\n13\n15\n6\n17\n9\n10\n17\n13\n11",width="200px",height="400px",cols=1),
                                                       
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
                              
                #              tabPanel("Paste Data",value=2,
                #                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                #                       br(),
                #                       fluidPage(
                #                       column(12,style = " background-color: white; border-radius: 5px; ",
                #                              h3("Data Entry by Pasting"),
                #                              "Paste your data (values separated by spaces) in the cells below.",
                #                              br(),
                #                              br(),
                #                              column(6, 
                #                                     style="background-color: white",
                #                                     textInput(ns("matrix1c"),"Enter Time Data (Dates)",value=c("01/01/2024",
                #                                                                              "02/01/2024",
                #                                                                              "03/01/2024",
                #                                                                              "04/01/2024",
                #                                                                              "05/01/2024",
                #                                                                              "06/01/2024",
                #                                                                              "07/01/2024",
                #                                                                              "08/01/2024",
                #                                                                              "09/01/2024",
                #                                                                              "10/01/2024",
                #                                                                              "11/01/2024",
                #                                                                              "12/01/2024")
                #                              )
                #                              ),
                #                              column(6, 
                #                                     style="background-color: white",
                #                                     textInput(ns("matrix1d"),"Summary Statistic (mean, %, etc.)",value=c("47","43","65","51","59","71","77","81","83","79","82","87")
                #                              ),
                #                              br()
                #                       ),
                #                       br()
                #                     ),
                #                     br(),
                #                     br(),
                #                     br()
                #                     
                #            )
                #),
                  
                              tabPanel("Upload Data",value=3,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h3("Upload Data"),
                                                "Upload your data or Analysis file. You can download an example dataset to see its formatting by clicking this link:",
                                                br(),
                                                br(),
                                                tags$a(href="runChartIn.xlsx",download="runChartIn.xlsx",
                                                       "Example Analysis File for a Run Chart",target="_blank"),
                                                br(),
                                                br(),
                                                "You can also use the Analysis file saved after using this tool previously. This is the tab named 'Analysis' in the reproducible file you downladed. The fact that you can upload that file and get the exact same results as you did then is what makes this reproducible research (see last section).",
                                                
                                                br(),
                                                br(),
                                                fileInput(ns("runChartData"),"Enter data file location",accept=".xlsx"),
                                                br(),
                                                br(),
                                                #tableOutput(ns("loadedData")),
                                                

                                                                           column(6, 
                                                                                  style="background-color: white",
                                                                                  matrixInput(
                                                                                    inputId = ns("matrix1a2"),
                                                                                    label = "Time Variable (Dates)",
                                                                                    value = matrix(
                                                                                      c("",""),
                                                                                      ncol=1,
                                                                                      nrow=2,
                                                                                      dimnames=list(
                                                                                        NULL,
                                                                                        NULL
                                                                                      )
                                                                                    ),
                                                                                    class = "text",
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
                                                                           column(6, 
                                                                                  style="background-color:white",
                                                                                  matrixInput(
                                                                                    
                                                                                    inputId = ns("matrix1b2"),
                                                                                    label = "Summary Statistic (mean, %, etc.)",
                                                                                    value = matrix(c("",""),ncol=1,nrow=2,dimnames=list(NULL,NULL)),
                                                                                    class = "numeric",
                                                                                    cols = list(
                                                                                      names = FALSE,
                                                                                      editableNames = TRUE
                                                                                    ),
                                                                                    rows = list(
                                                                                      names = FALSE,
                                                                                      extend=TRUE,
                                                                                      delta=1
                                                                                    )
                                                                                    #,
                                                                                    #cells = list(editableCells = FALSE)
                                                                                  ))
                                                                           
                                                
                                         ),
                                         br()
                                       ),
                                       br()
                ),
                tabPanel("Enter Data by Hand", value=4,
                         style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                         br(),
                         fluidPage(
                           column(12,style = " background-color: white; border-radius: 5px; ",
                                  h3("Enter Data by Hand"),
                                  "Enter your data in the cells below.",
                                  br(),
                                  br(),
                                  column(6, 
                                         style="background-color: white",
                                         matrixInput(
                                           inputId = ns("matrix1a4"),
                                           label = "Time Variable (Dates)",
                                           value = matrix(
                                             c(
                                               "01/01/2024",
                                               "02/01/2024",
                                               "03/01/2024",
                                               "04/01/2024",
                                               "05/01/2024"
                                             ),
                                             ncol=1,
                                             nrow=5,
                                             dimnames=list(NULL,NULL)
                                           ),
                                           class = "text",
                                           cols = list(
                                             names = FALSE,
                                             extend=FALSE,
                                             editableNames = FALSE
                                           ),
                                           rows = list(
                                             names = FALSE,
                                             extend=TRUE,
                                             editableNames = FALSE,
                                             delta=1
                                           )#,
                                           #cells = list(editableCells = FALSE)
                                         )
                                  ),
                                  column(6, 
                                         style="background-color: white",
                                         matrixInput(
                                           inputId = ns("matrix1b4"),
                                           label = "Summary Statistic (mean, %, etc.)",
                                           value = matrix(
                                             c(
                                               47,43,65,51,59
                                             ),
                                             ncol=1,
                                             nrow=5,
                                             dimnames=list(NULL,NULL)
                                           ),
                                           class = "numeric",
                                           cols = list(
                                             names = FALSE,
                                             extend=FALSE,
                                             editableNames = FALSE
                                           ),
                                           rows = list(
                                             names = FALSE,
                                             extend=TRUE,
                                             editableNames = FALSE,
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
                         
                )
           ),
           br(),
           br()
           ),
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
           h2("Plot Options"),
           br(),
           "The following controls can be used to set the options for your plot.",
           br(),
           br(),
           column(4, style = "background-color: white; border-radius: 5px; ",
           textInput(ns("interventionStart"),"Enter Intervention Start Date",value="04/01/2024"),
           radioButtons(
             inputId=ns("interventionStartSelect"),
             label=NULL,
             choiceNames = c("Plot intervention start date","Don't plot intervention start date"),
             choiceValues=c(1,2),
             selected = 1,
             inline = FALSE,
             width = NULL
           ),
           numericInput(ns("goal"),"Enter Goal Value",value="85"),
           radioButtons(
             inputId=ns("goalSelect"),
             label=NULL,
             choiceNames = c("Plot goal","Don't plot goal"),
             choiceValues=c(1,2),
             selected = 1,
             inline = FALSE,
             width = NULL
           ),
           radioButtons(
             inputId=ns("blMedianSelect"),
             label=NULL,
             choiceNames = c("Plot baseline median","Don't plot baseline median"),
             choiceValues=c(1,2),
             selected = 1,
             inline = FALSE,
             width = NULL
           ),
           textInput(ns("chartTitle"),"Enter Chart Title",value="Monthly Readmissions"),
           textInput(ns("subTitle"),"Enter Chart Sub-Title",value="Jan 2024-Dec 2024")
           ),
           column(4, style = "background-color: white; border-radius: 5px; ",
                  
                  textInput(ns("xLab"),"Enter X-Axis Label",value="Month"),
                  textInput(ns("yLab"),"Enter Y-Axis Label",value="Percent Readmitted"),
                  numericInput(ns("lineSize"),"Enter Line Thickness",value="2"),
                  numericInput(ns("textSize"),"Enter Text Size",value="20"),
                  selectInput(
                    ns("axisTimeFormat"),"Select a Format for X-Axis Values",
                    choices=c("Default","Mon-YY Monthly","DD-MM-YY Monthly","DD-MM-YY Weekly","Mon Monthly","DD-MM Monthly","DD-MM Weekly"),
                    selected = "Mon-YY Monthly",
                    multiple = FALSE,
                    selectize = TRUE,
                    width = NULL,
                    size = NULL
                  ),
                  br(),
                  br(),
                  br()
           ),
           column(4, style = "background-color: white; border-radius: 5px; ",
                  
      
           numericInput(ns("widthSelect"),"Enter the Chart Width",value="900"),
           numericInput(ns("heightSelect"),"Enter the Chart Height",value="600"),
           numericInput(ns("yMax"),"Enter the Vertical Axis Maximum",value="100"),
           numericInput(ns("yMin"),"Enter the Vertical Axis Minimum",value="0"),
           numericInput(ns("axisTextAngle"),"Enter Angle of X-Axis Text",value="-70"),
           br(),
           br(),
           br()
    )
    ),
        
    column(12,
           br(),
           br(),
           br()
    ),
    
    
    
    
    
    column(12, style = "background-color: white; border-radius: 5px;  ",
           br(),
           column(width=12,
                  h2("Run Chart")),
           #column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
           #       column(width=6,h4(style="color:#818e9f;", "Learn:")),
           #       column(width=4,
           #              actionButton(ns("snip7b1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
           #              actionButton(ns("snip7b2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
           #              #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
           #       )),
           br(),
           br(),
           br(),
           br(),

           #h2("Tables and Figures for Publication"),
           br(),
      #     "The following table is a publication-worthy way to display your results. 
      # The figure below is one way to graphically display your results.",
          # br(),
           #br(),
           #tableOutput(ns("ttestTable")),
           br(),
           br(),
           plotOutput(ns("runChartPlot")
                      ),
      br(),
      br(),           br(),
      br(),           br(),
      br(),           br(),
      br(),           br(),
      br(),           br(),
      br(),
           br()
    ),
    
  
  column(12,
         br(),
         br(),
         br()
  ),
  
  
  
  
  
  
  
  
  
  ##################################################
  #   Save reproducible work
  ####################################################
  column(12, style = " background-color: white; border-radius: 5px; ",
         
         br(),
         column(width=10,
                h2("Save Reproducible Work")),
         column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                column(width=6,h4(style="color:#818e9f;", "Learn:")),
                column(width=4,
                       actionButton(ns("snip1g1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                       actionButton(ns("snip1g2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
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
           and the information needed to run the analysis again if you input the file again. It also creates a sheet that contains all of the non-graphical output from your analysis, as well 
           as information about the analysis tool itself. Click the link below to download your reproducible analysis file and your results:",
           br(),
           br(),
           
           #    tags$a(href=paste0(tempdir(), "/", "2SampTTestOut.xlsx"),download="2SampTTestOut.xlsx",
           #           "Download Reproducible Analysis and Output Files.",target="_blank"),
           downloadButton(ns("downloadData"),"Download Reproducible Analysis File & Results"),
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
    )
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  )
  
  
  
  
  
  
  
  
}








runChart2Server <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      
      version<-reactive({
        1.1
      })
      
      
      selectedWidth<-reactive({
        input$widthSelect
      })
      
      selectedHeight<-reactive({
        input$heightSelect
      })
      

      
      
      runChartPlot1<-reactive({
        if(input$dataEntry == 1){
          matrixa1<-input$matrix1a
          matrix1a<-as.Date(matrixa1)
          matrix1a1<-as.Date(matrixa1, "%m/%d/%Y")
          matrix1b<-input$matrix1b
        }
        if(input$dataEntry == 2){
          #matrixa1<-Dat1a2()
          #matrixa12<-as.numeric(unlist(matrixa1))
          #matrix1a<-as.Date(matrixa12,origin="1970-01-01")
          #matrix1a1<-as.Date(matrixa12,origin="1970-01-01", "%m/%d/%Y")
          #matrix1b<-as.numeric(unlist(Dat1b2()))
          matrixa1<-Dat1a2()
          matrixa12<-as.numeric(unlist(matrixa1))
          matrix1a<-anydate(unlist(matrixa1))
          matrix1a1<-anydate(unlist(matrixa1))
          matrix1b<-as.numeric(unlist(Dat1b2()))
        }
        if(input$dataEntry == 3){
          matrixa1<-input$matrix1a2
          matrix1a<-as.Date(matrixa1)
          matrix1a1<-as.Date(matrixa1, "%m/%d/%Y")
          matrix1b<-as.numeric(input$matrix1b2)
          req(Dat1ab())
        }
        if(input$dataEntry == 4){
          matrixa1<-input$matrix1a4
          matrix1a<-as.Date(matrixa1)
          matrix1a1<-as.Date(matrixa1, "%m/%d/%Y")
          matrix1b<-input$matrix1b4
        }
        

        dat<-data.frame("Date"=matrix1a,"Estimate"=matrix1b)
        
        blDat<-matrix1b[which(matrix1a[]<anydate(input$interventionStart))]
        blMedian<-median(blDat)
        
        scaleX<-NULL
        
        if(input$axisTimeFormat=="Mon-YY Monthly"){
          scaleX<-scale_x_date(date_breaks = "months" , date_labels = "%b-%y")
        }
        
        if(input$axisTimeFormat=="DD-MM-YY Monthly"){
          scaleX<-scale_x_date(date_breaks = "months" , date_labels = "%d-%m-%y")
        }
        
        if(input$axisTimeFormat=="DD-MM-YY Weekly"){
          scaleX<-scale_x_date(date_breaks = "weeks" , date_labels = "%d-%m-%y")
        }
        
        if(input$axisTimeFormat=="Mon Monthly"){
          scaleX<-scale_x_date(date_breaks = "months" , date_labels = "%b")
        }
        
        if(input$axisTimeFormat=="DD-MM Monthly"){
          scaleX<-scale_x_date(date_breaks = "months" , date_labels = "%d-%m")
        }
        
        if(input$axisTimeFormat=="DD-MM Weekly"){
          scaleX<-scale_x_date(date_breaks = "weeks" , date_labels = "%d-%m")
        }
        
        
               
        runChartPlot<-ggplot() +
          geom_line(aes(x=as.Date(matrix1a1, "%m/%d/%Y"),y=matrix1b,color=input$yLab),size=input$lineSize)+
          geom_point(aes(x=as.Date(matrix1a1, "%m/%d/%Y"),y=matrix1b),color="black", size = input$lineSize+3) +  
          #geom_segment(aes(x = Group, y = lcl, xend = Group, yend = ucl))+
          #geom_errorbarh(aes(xmin = lcl, xmax = ucl), height = 0.25) +
           #scale_y_continuous(name = "", breaks=1:4, labels = dat$label, trans = "reverse") +
          #ylab(outcomeLabel()) + 
          ggtitle(input$chartTitle,subtitle=input$subTitle)+
          xlab(input$xLab)+
          ylab(input$yLab)+
          ylim(c(input$yMin,input$yMax))+
          #xlim(c(0,3))+ 
          #scale_x_date(name =  , minor_breaks=as.Date(matrix1a1, "%m/%d/%Y") #+#, trans = "reverse"
          #                 ) +
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
                plot.title = element_text(size=input$textSize+10, colour="black",hjust=0.5),
                plot.subtitle = element_text(size=input$textSize+6, colour="black",hjust=0.5))+
          scaleX
        
        goalPlot<-geom_hline(aes(yintercept = input$goal, color = "Goal"), linetype = "solid", cex = input$lineSize, alpha = 0.5)
        blMedianPlot<-geom_hline(aes(yintercept = blMedian, color = "Baseline Median"), linetype = "solid", cex = input$lineSize, alpha = 0.5) 
        interventionStartPlot<-geom_vline(aes(xintercept = as.Date(input$interventionStart, "%m/%d/%Y"), color = "Intervention Start"), linetype = "solid", cex = input$lineSize, alpha = 0.5, show.legend = TRUE) 
        
        
        if(input$goalSelect==1 & input$blMedianSelect==1 & input$interventionStartSelect==1){
          plotAll<-runChartPlot+
            goalPlot +
            blMedianPlot +
            interventionStartPlot+
            scale_color_manual(values=c("darkgreen","red","blue","black"))
                        
        }
        if(input$goalSelect==2 & input$blMedianSelect==1 & input$interventionStartSelect==1){
          plotAll<-runChartPlot+
            blMedianPlot +
            interventionStartPlot+
            scale_color_manual(values=c("darkgreen","blue","black"))
          
        }
        if(input$goalSelect==1 & input$blMedianSelect==2 & input$interventionStartSelect==1){
          plotAll<-runChartPlot+
            goalPlot +
            interventionStartPlot+
            scale_color_manual(values=c("red","blue","black"))
          
        }
        if(input$goalSelect==1 & input$blMedianSelect==1 & input$interventionStartSelect==2){
          plotAll<-runChartPlot+
            goalPlot +
            blMedianPlot +
            scale_color_manual(values=c("darkgreen","red","black"))
          
        }
        if(input$goalSelect==1 & input$blMedianSelect==2 & input$interventionStartSelect==2){
          plotAll<-runChartPlot+
            goalPlot +
            scale_color_manual(values=c("red","black"))
          
        }
        if(input$goalSelect==2 & input$blMedianSelect==1 & input$interventionStartSelect==2){
          plotAll<-runChartPlot+
            blMedianPlot+
            scale_color_manual(values=c("darkgreen","black"))
          
        }
        if(input$goalSelect==2 & input$blMedianSelect==2 & input$interventionStartSelect==1){
          plotAll<-runChartPlot+
            interventionStartPlot+
            scale_color_manual(values=c("blue","black"))
          
        }
        if(input$goalSelect==2 & input$blMedianSelect==2 & input$interventionStartSelect==2){
          plotAll<-runChartPlot+
            scale_color_manual(values=c("black"))
          
        }
        

        
        plotAll
                  
        
              })
      
      
      output$runChartPlot<-renderPlot({
        if(input$dataEntry == 2){
          req(Dat1ab2())
        }
        if(input$dataEntry == 3){
          req(Dat1ab())
        }
        runChartPlot1()
      },width=reactive({
        selectedWidth()}),
      height=reactive({
        selectedHeight()}))
      
      
      
      
      output$downloadData<-downloadHandler(filename=function(){
        paste0(tempdir(), "/", "runChartOut.xlsx")
      },
      content=function(file){
        #observe({
        if(input$dataEntry == 1){
          matrixa1<-input$matrix1a
          matrix1a<-as.Date(matrixa1)
          matrix1a1<-as.Date(matrixa1, "%m/%d/%Y")
          matrix1b<-input$matrix1b
        }
        if(input$dataEntry == 2){
          #matrixa1<-Dat1a2()
          #matrixa12<-as.numeric(unlist(matrixa1))
          #matrix1a<-as.Date(matrixa12,origin="1970-01-01")
          #matrix1a1<-as.Date(matrixa12,origin="1970-01-01", "%m/%d/%Y")
          #matrix1b<-as.numeric(unlist(Dat1b2()))
          matrixa1<-Dat1a2()
          matrixa12<-as.numeric(unlist(matrixa1))
          matrix1a<-anydate(unlist(matrixa1))
          matrix1a1<-anydate(unlist(matrixa1))
          matrix1b<-as.numeric(unlist(Dat1b2()))
        }
        if(input$dataEntry == 3){
          matrixa1<-input$matrix1a2
          matrix1a<-as.Date(matrixa1)
          matrix1a1<-as.Date(matrixa1, "%m/%d/%Y")
          matrix1b<-as.numeric(input$matrix1b2)
        }
        if(input$dataEntry == 4){
          matrixa1<-input$matrix1a4
          matrix1a<-as.Date(matrixa1)
          matrix1a1<-as.Date(matrixa1, "%m/%d/%Y")
          matrix1b<-input$matrix1b4
        }
        
        wb = createWorkbook()
        
        sheet = addWorksheet(wb, "Analysis",gridLines = FALSE)
        
        headStyle<-createStyle(border = "TopBottom", borderColour ='black', borderStyle="thick",textDecoration = "bold")
        bottomStyle<-createStyle(border="Bottom",borderStyle="thick")
        boldStyle<-createStyle(textDecoration = "bold")
        
        
        col1<-matrix(c("Run Chart","",
                       #"Outcome Label:",outcomeLabel(),"",
                       #"Predictor Label:","Time","",
                       "Intervention Start Date:",input$interventionStart,"",
                       "Plot Intervention Start:",input$interventionStartSelect,"",
                       "Goal:",input$goal,"",
                       "Plot Goal:",input$goalSelect,"",
                       "Plot Baseline Median:",input$blMedianSelect,"",
                       "Plot Title:",input$chartTitle,"",
                       "Plot Sub Title:",input$subTitle,"",
                       "Plot Width:",input$widthSelect,"",
                       "Plot Height:",input$heightSelect,"",
                       "X-Axis Label:",input$xLab,"",
                       "Y-Axis Label:",input$yLab,"",
                       #"Plot Title Size:",input$titleSize,"",
                       "Plot Text Size:",input$textSize,"",
                       "Plot Line Size:",input$lineSize,"",
                       #"Use Axis Limits:",input$useLimits,"",
                       "Plot Y-Axis Max:",input$yMax,"",
                       "Plot Y-Axis Min:",input$yMin,"",
                       "X-Axis Text Angle:",input$axisTextAngle,"",
                       "X-Axis Time Format:",input$axisTimeFormat,""
                       ),ncol=1)
      
        colnames(col1)<-"Tool:"
        #matrix1a<-input$matrix1a
        #matrix1b<-input$matrix1b
        datOut<-data.frame("Date"=as.character(matrixa1),"Measure"=matrix1b)
        colnames(datOut)<-c("Date","Measure")
        writeData(wb,sheet=sheet,x=as.data.frame(col1), startCol=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x=as.data.frame(matrix1a), startCol=2, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x=as.data.frame(matrix1b), startCol=3, rowNames=FALSE)
        writeDataTable(wb,sheet=sheet,x=as.data.frame(datOut), startCol=2,startRow = 1, rowNames=FALSE,tableStyle = "TableStyleLight8")
        #writeData(wb,sheet=sheet,x=datOut, startCol=2, rowNames=FALSE)
        setColWidths(wb,sheet,cols=1,widths = "auto")
        
        sheet = addWorksheet(wb, "Tabular Output",gridLines = FALSE)
        
        
        header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny"),ncol=1)
        colnames(header)<-"General Information"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header), startCol=1, startRow=1, rowNames=FALSE)
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        header2<-matrix(c("Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus"),ncol=1)
        colnames(header2)<-"Creator"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header2), startCol=1, startRow=8, rowNames=FALSE)
        
        header3<-matrix(c("Run Chart","Core R Packages and Functions: ggplot{ggplot2}"),ncol=1)
        colnames(header3)<-"Tool"
        writeDataTable(wb,sheet=sheet,x=as.data.frame(header3), startCol=1, startRow=15, rowNames=FALSE)
        
        
        #header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny","","Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus","","","Tool: Run Chart","Core R Packages and Functions: ggplot{ggplot2}"),ncol=1)
        #colnames(header)<-"General Information"
        #
        #writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        setColWidths(wb,sheet,cols=c(1:256),widths = "auto")
        
        sheet = addWorksheet(wb, "Plot Output",gridLines = FALSE)
        
        runChart<-runChartPlot1()
          
        
        selectedHeight<-selectedHeight()
        selectedWidth<-selectedWidth()
        
        png(paste0(tempdir(), "/", "runChart.png"), width=selectedWidth*4, height=selectedHeight*4, units="px", res=300)
        print(runChart)
        dev.off()  
        insertImage(wb, sheet=sheet, paste0(tempdir(), "/", "runChart.png"), startRow=3, startCol=3,width=selectedWidth*4, height=selectedHeight*4, units="px")
       
        saveWorkbook(wb, file,overwrite=TRUE)

      })
      
      
      
      
      
      
      Dat1ab <- reactiveVal()
      
      observeEvent(input[["runChartData"]], {
        xlfile <- input[["runChartData"]][["datapath"]]
        ext <- tolower(tools::file_ext(xlfile))
        if(ext == "xlsx") {
          sheets <- excel_sheets(xlfile)
          if(length(sheets) == 1L) {
            Dat1ab(read_xlsx(input[["runChartData"]][["datapath"]], sheet = 1L))
            #Dat1a(read_xlsx(input[["tTestData"]][["datapath"]], sheet = 1L,range=cell_cols(1)))
            #Dat1b(read_xlsx(input[["tTestData"]][["datapath"]], sheet = 1L,range=cell_cols(2)))
          } else {
            inputSweetAlert(
              session,
              inputId = "sheet",
              title = "Select the Analysis Worksheet (the one with your data in columns B and C)",
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
        if(read_xlsx(input[["runChartData"]][["datapath"]], sheet = input[["sheet"]])[1,1] != "Run Chart"){
          sendSweetAlert(
            session,
            title = "Incorrect File",
            text = "Not a Run Chart Analysis File. Please upload an analysis file compatible with the Run Chart Tool.",
            type = "error",
            btn_colors="#5f5f62"
          )
        }else{
          Dat1ab(read_xlsx(input[["runChartData"]][["datapath"]], sheet = input[["sheet"]]))
          dat<-Dat1ab()
          options<-as.matrix(dat[,1])
          dat1<-as.matrix(dat[,2:3])
          dat2<-na.omit(dat1)
          matrix1a<-as.matrix(dat2[,1])
          matrix1b<-as.matrix(dat2[,2])
          
            updateMatrixInput(session,"matrix1a2",value=matrix1a)
            updateMatrixInput(session,"matrix1b2",value=matrix1b)
            updateTextInput(session,"interventionStart",value=options[4])
            updateNumericInput(session,"goal",value=options[10])
            
            updateTextInput(session,"chartTitle",value=options[19])
            updateTextInput(session,"subTitle",value=options[22])
            updateNumericInput(session,"widthSelect",value=options[25])
            updateNumericInput(session,"heightSelect",value=options[28])
            updateTextInput(session,"xLab",value=options[31])
            updateTextInput(session,"yLab",value=options[34])
            updateNumericInput(session,"textSize",value=options[37])
            updateNumericInput(session,"lineSize",value=options[40])
            #updateSelectInput(session,"useLimits",selected=options[40])
            updateNumericInput(session,"yMax",value=options[43])
            updateNumericInput(session,"yMin",value=options[46])
            updateNumericInput(session,"axisTextAngle",value=options[49])
            updateSelectInput(session,"axisTimeFormat",
                              choices=c("Default","Mon-YY Monthly","DD-MM-YY Monthly","DD-MM-YY Weekly","Mon Monthly","DD-MM Monthly","DD-MM Weekly"),
                              selected =options[52]
                              )
            updateRadioButtons(session,"interventionStartSelect",selected=options[7])
            updateRadioButtons(session,"goalSelect",selected=options[13])
            updateRadioButtons(session,"blMedianSelect",selected=options[7])

        }
      })
      

      
      
      
      
      
      
      
      Dat1a2 <- reactiveVal()
      Dat1b2 <- reactiveVal()
      
      observeEvent(input[["matrix1a2in"]], {
        
        Dat1a2(input$matrix1a2in)
        dat<-Dat1a2()
        rows<-unlist(strsplit(as.character(dat),split="\n"))
        df<-data.frame()
        for(j in 1:length(rows)){
          df<-rbind(df,unlist(strsplit(as.character(rows[j]),split="\t")))
        }
        
        clnms<-df[1,]
        
        matrix12<-df[-1,]
        

        matrix12<-anydate(matrix12)
        matrix12<-data.frame(matrix12)
        req(matrix12)
        colnames(matrix12)<-clnms
        
        Dat1a2(matrix12)
        
      })
      
      
      observeEvent(input[["matrix1b2in"]], {
        
        Dat1b2(input$matrix1b2in)
        dat<-Dat1b2()
        rows<-unlist(strsplit(as.character(dat),split="\n"))
        df<-data.frame()
        for(j in 1:length(rows)){
          df<-rbind(df,unlist(strsplit(as.character(rows[j]),split="\t")))
        }
        
        clnms<-df[1,]
        
        matrix12<-df[-1,]
        matrix12<-as.numeric(as.character(matrix12))
        
        matrix12<-data.frame(matrix12)
        

        
        req(matrix12)
        colnames(matrix12)<-clnms
        
        Dat1b2(matrix12)
        
      })
      
      
      Dat1ab2<-reactive({
        dat1<-Dat1a2()
        dat2<-Dat1b2()
        dat<-as.data.frame(cbind(dat1,dat2))
        dat
      })
      
      
      output$matrix12<-renderDT({
        req(Dat1ab2())
        Dat1ab2()
      },editable='all')
      
      

      
      
      
      
      observeEvent(
        input$snip7a1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Run Chart Data"), ##### Change this one every time and text below
                               " ", 
                               
                               
                               br(), br() ) ) )) })
      observeEvent(
        input$snip7a2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Run Chart Data"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip7a2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      
      observeEvent(
        input$snip7b1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Plotting a Run Chart"), ##### Change this one every time and text below
                               " ", 
                               
                               
                               br(), br() ) ) )) })
      observeEvent(
        input$snip7b2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Plotting a Run Chart"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip7b2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      observeEvent(
        input$snip1g1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Saving your Work Reproducibly"), ##### Change this one every time and text below
                               "Always save your work, and do it in a reproducible way. This means that, if someone needed to reproduce your results, you could simply give them one or more files (that's what you're saving here) and tell them what analysis program or language or tool you used, and they'd be able to reproduce your results exactly. This is helpful if someone challenges your work or you get audited. It's also helpful if you leave an institution, corporation, or clinic and someone there needs to reproduce your results at some point. But it's probably most useful for you. There are any number of reasons you might need to reproduce your owwn results for yourself, such as when you need to pick up where you left off the last time you worked on your analysis.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip1g2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height:  450px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
                h3("Saving your Work Reproducibly"), ##### Change this one every time
                tags$iframe(
                  width="600", height="400",
                  src = "snip1g2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
    }
  )    
}
