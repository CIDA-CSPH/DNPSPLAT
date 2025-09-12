# Module UI function
uploadedFilesUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           
           br(),
           column(width=10,
                  h2("Uploaded Files")),
           column(width=2, style = " background-color: white; border-radius: 5px; padding: 10px;",
                  column(width=6,h4(style="color:#818e9f;", "Learn:")),
                  column(width=4,
                         #actionButton(ns("snip4a1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip4a2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;"),
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                         
                  )
                  
           ),
           br(),
           br(),
           br(),
           
           
           
           column(width=12,
                  "Data and other information that is uploaded, downloaded, saved, opened, or otherwise manipulated using this site is always stored as a Microsoft Excel workbook so you can download it and look at it offline. A given use of a given tool generates one Excel Workbook that usually has three sheets or tabs in the workbook. The two tabs that will most likely be of interest to you are the Tabular Output and Plot Output tabs/sheets, as they contain all of the results you will disseminate. However, the sheet/tab you will need to upload to open an analysis you previously worked on is the tab/sheet titled Analysis. The information in the Analysis tab consists of the data that was input or used by the tool, all of the options or settings that were used, and the name of the tool itself. Thus, the Analysis tab or sheet fills the roles traditionally filled by the input dataset and by the code file when conducting an analysis in SAS, R, or some other code-based analysis tool. All of the tools on our site actually run R code behind the scenes, so there's a 1-to-1 correspondence between the information in the Analysis file and the set of R statements and functions that exist in the code for our site and tools. We've taken great care to do this in a way that conforms to the principles of reproducible research.",
                  br(),br(),
                  "Click directly below to upload an Analysis File. Once uploaded, the analysis file will show up in the Active Analyses list further below and will be available to interact with and modify. You can upload multiple analysis files and have multiple active analyses at any given time.",
                  br(),
                  br(),
                  fileInput(ns("uploadFileData"),"Enter data file location",accept=".xlsx"),
                  br(),
                  br(),
                  selectInput(ns("activeAnalyses"),"Active Analyses",choices=c("No Analyses Active/Open"),width="50%",size=10,selectize=FALSE),
                  br(),
                  actionGroupButtons(c(ns("view"),ns("run"),ns("Save")),c("View File","Run Analysis","Save File")),
                  br(),
                  br(),
                  br(),
                  br()
           ),
                  
                  
           #h2("Explanation of Analysis Parameters: 2-Sample T-Test"),

           
           column(width=9, style="background-color: white",
                  
                  tabsetPanel(type = "tabs", id=ns("dataInput"),
                              
                              tabPanel("Analysis", value=1,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(

                                       ),
                                       br()

                                       
                                       
                              ),
                              tabPanel("Tabular Output", value=2,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                       
                                       ),
                                       br()
                                       
                              ),
                              tabPanel("Plot Output", value=3,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         
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
                     actionButton(ns("snip4g1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                     actionButton(ns("snip4g2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                     #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                     #tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
              )
              
       ),
       br(),
       br(),
       br(),
       column(width=12,
              br(),
              "These analysis tools save files in a reproducible way in Excel files with multiple sheets. Each time you save your results, it creates an Excel sheet that contains your data 
           and the information needed to run the analysis again if you input the file again. It also creates a sheet that contains all of the non-graphical output from your analysis, as well 
           as information about the analysis tool itself. Click the link below to download your reproducible analysis files and your results:",
           br(),
           br(),
           
           #    tags$a(href=paste0(tempdir(), "/", "2SampTTestOut.xlsx"),download="2SampTTestOut.xlsx",
           #           "Download Reproducible Analysis and Output Files.",target="_blank"),
           downloadButton(ns("downloadData"),"Download Reproducible Analysis Files & Results"),
           br(),
           br()
       ),
       br(),
       br(),
       br()
),


  )
  
  
  
  
  
  
  
  
}








uploadedFilesServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      version<-reactive({
        1.1
      })
      
      
      
   #   analysisFilesChoices<-reactive({
   #     c("2SampTTestExample.xlsx          Two-Sample T-Test")
   #   })
      
      
      
      
      
      
      
      
      output$downloadData<-downloadHandler(filename=function(){
        paste0(tempdir(), "/", "tTestPower.xlsx")
      },
      content=function(file){
        #observe({
        
        sampleSize<-input$sampleSize
        sampleSize2<-input$sampleSize2
        sd<-input$sd
        meanDif<-input$meanDif
        power<-input$power
        power2<-input$power2
        d<-input$d
        
        if(is.null(sampleSize)) sampleSize<-"-"
        if(is.null(sampleSize2)) sampleSize2<-"-"
        if(is.null(sd)) sd<-"-"
        if(is.null(meanDif)) meanDif<-"-"
        if(is.null(power)) power<-"-"
        if(is.null(power2)) power2<-"-"
        if(is.null(d)) d<-"-"
        
        if(input$dataInput==1){
          effectSize<-"Raw (use difference in means and standard deviation)"
          solveFor0<-input$solveFor
          sampleSize0<-sampleSize
          sd0<-sd
          meanDif0<-meanDif
          power0<-power
          alternative0<-input$alternative
          alpha0<-input$alpha
          d0<-"-"
        }
        if(input$dataInput==2){
          effectSize<-"Standardized (use Cohen's/Glass's d)"
          solveFor0<-input$solveFor2
          sampleSize0<-sampleSize2
          sd0<-"-"
          meanDif0<-"-"
          power0<-power2
          alternative0<-input$alternative2
          alpha0<-input$alpha2
          d0<-d
        }
        if(solveFor0=="Solve for Sample Size") sampleSize0<-"-"
        if(solveFor0=="Solve for Power") power0<-"-"
        if(solveFor0=="Solve for Standardized Effect Size") d0<-"-"
        if(solveFor0=="Solve for Difference in Means") meanDif0<-"-"
        
        
        
        wb = createWorkbook()
        
        sheet = addWorksheet(wb, "Analysis")
        
        
        col1<-matrix(c("2-Sample T-Test Power","-",
                       "Effect Size:",effectSize,"-",
                       "Parameter to Solve For:",solveFor0,"-",
                       "Sample Size per Group:",sampleSize0,"-",
                       "Difference in Means:",meanDif0,"-",
                       "Power:",power0,"-",
                       "Standard Deviation:",sd0,"-",
                       "Significance Level:",alpha0,"-",
                       "Type of Alternative Hypothesis:",alternative0,"-",
                       "Glass's/Cohen's d:",d0,"-"
                       ),ncol=1)
        colnames(col1)<-"Tool:"
        writeData(wb,sheet=sheet,x=as.data.frame(col1), startCol=1, rowNames=FALSE)

        sheet = addWorksheet(wb, "Tabular Output")
        
        header<-matrix(c(paste0("System Date:",as.Date(Sys.time())),paste0("System Time:",format(Sys.time(),"%H:%M:%S")),"Statistical Planning, Learning, and Analysis Tool",paste("Version:",version()),"An R tool built with Shiny","","Created by Bryan McNair, MS","Center for Innovative Design and Analysis","Department of Biostatistics and Informatics","Colorado School of Public Health","University of Colorado Anschutz Medical Campus","","","Tool: 2-Sample T-Test Power/Sample Size/Effect Size","Core R Packages and Functions: power.t.test{stats}"),ncol=1)
        colnames(header)<-"General Information"
        
        writeData(wb,sheet=sheet,x=as.data.frame(header), startCol=1, rowNames=FALSE)
        
        powerTableTitle<-powerTableTitle1()
        
        writeData(wb,sheet=sheet,x=powerTableTitle, startCol=6, startRow=2, rowNames=FALSE,colNames=FALSE)
        
        powerTable<-powerTable1a()
        nRowPowerTable<-nrow(powerTable)
        
        writeData(wb,sheet=sheet,x=powerTable, startCol=6, startRow=4, rowNames=FALSE,colNames=TRUE)
        
        footnote<-footnote1()
        
        writeData(wb,sheet=sheet,x=footnote, startCol=6, startRow=5+nRowPowerTable, rowNames=FALSE,colNames=FALSE)
        
        sheet = addWorksheet(wb, "Plot Output")
        
        writeData(wb,sheet=sheet,x="No plot output available.", startCol=2, startRow=2, rowNames=FALSE,colNames=FALSE)
        
        saveWorkbook(wb, file,overwrite=TRUE)

      })
      
      
      
      
      
      
      Dat1ab <- reactiveVal()
      
      observeEvent(input[["uploadFileData"]], {
        xlfile <- input[["uploadFileData"]][["datapath"]]
        ext <- tolower(tools::file_ext(xlfile))
        if(ext == "xlsx") {
          sheets <- excel_sheets(xlfile)
          if(length(sheets) == 1L) {
            Dat1ab(read_xlsx(input[["uploadFileData"]][["datapath"]], sheet = 1L))
            #Dat1a(read_xlsx(input[["tTestData"]][["datapath"]], sheet = 1L,range=cell_cols(1)))
            #Dat1b(read_xlsx(input[["tTestData"]][["datapath"]], sheet = 1L,range=cell_cols(2)))
          } else {
            inputSweetAlert(
              session,
              inputId = "sheet",
              title = "Select the Analysis Worksheet.",
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
      
      analysisFilesChoices <- reactiveVal()
      
      observeEvent(input[["sheet"]], {

          Dat1ab(read_xlsx(input[["uploadFileData"]][["datapath"]], sheet = input[["sheet"]]))
          dat<-Dat1ab()
          options<-as.matrix(dat[,1])
          tool<-options[1]

          
          analysisFilesChoices(c(analysisFilesChoices(),paste(input[["uploadFileData"]][1],"          ",tool)))
          
          updateSelectInput(session,"activeAnalyses",choices=analysisFilesChoices())


      })
      
     

      
      
      observeEvent(
        input$snip4a1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Analysis Parameters"),
                               br(),

                               h4("Sample Size"),
                               "Sample size is pretty self explanatory, except that, on this page, we need to remember that the 
           sample size specified or solved for is the sample size per group for two groups of the same size.",
           br(),
           br(),
           h4("Power"),
           "Power is the probability of NOT making a Type II error or, more descriptively, power is the probability
           of detecting an effect IF THERE REALLY IS ONE TO DETECT IN THE POPULATION. By convention, values of power
           of 0.80 and above are considered 'good'.",
           br(),
           br(),
           h4("Effect Size"),
           "The term 'effect size' can mean an unstandardized or 
           raw effect size or it can mean a standardized effect size.
           In the case of a 2-sample t-test, the unstandardized/raw effect size is the difference in means, which has the same units as the means themselves. There are several standardized effect sizes that could be used 
           in the case of a 2-sample t-test, usually denoted by 'd'. The most basic standardized effect size used with a 2-sample t-test is the difference in means divided by a common (same for both groups) standard deviation. This is called 'Glass's d', 
           A similar and more famous version is 'Cohen's d', which replaces the common standard deviation in the denominator with a pooled (across groups) standard deviation. If we refer to effect size below and we want to be specific, we'll refer to an 'unstandardized effect size' or a 'difference in means' 
           or we'll refer to a 'standardized effect size,' 'Cohen's d,' 'Glass's d,' etc. If we want to be general or generic, we'll simply say, 'effect size.' Note that, when the standard deviation is equal to 1, the mean difference is equal to Cohen's d or Glass's d, depending on whether we assume it's pooled or common across groups. Cohen famously classified his d statistic into three categories:",
           br(),
           br(),
           "Small: d = 0.2",
           br(),
           "Medium: d = 0.5",
           br(),
           "Large: d = 0.8",
           br(),
                    br(), br() ) ) )) })
      observeEvent(
        input$snip4a2,{ ##### Change this one every time
          showModal(
            modalDialog(
              tags$div(
                style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                h3("Analysis Parameters"), ##### Change this one every time
                tags$iframe(
                  width="1280", height="720",
                  src = "snip4a2.mp4", ##### Change this one every time
                  frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })
      
      
      
      
      observeEvent(input$snip4f1,{
        showModal(modalDialog(
          tags$div(
            style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
            
            br(),
            column(width = 12,
                   h3("Write up: Power, Sample Size, or Effect Size"),
                   "The power and sample size section of a grant or protocol should included everything another statistician would need 
           to reproduce your results. It should also be written in a way that non-statistician 
           scientists or clinicians can read and understand well, even if they're not familiar with all of the statistical 
           methods you used. The balance between statistical completeness and accessibility to a general sientific audience 
           can be tricky to attain. It may be easiest to start with statistical completeness, then revise your draft for clarity 
           and conciseness without losing completeness along the way.",
           br(),
           br(),
           "The value of each parameter of the power analysis should be mentioned. As a guide, pick a row in the output table given above. Each row corresponds to a single power analysis. Construct a sentence that collects all of those values together and lists them. You also need to mention what hypothesis test you were powering for. Can you identify these elements in the write up below?",
           br(),
           br(),
          
           em("Assuming a significance level of 0.05, equal group sizes, equal standard deviations in both groups of 0.7 (insert units), and a two-sided alternative hypothesis, a sample size of 64 observations per group acheives 80% power to detect a difference in means of 0.35 (insert units) using a two-sample, equal-variances t-test. This is equivalent to a standardized effect size of Glass's d = 0.5, conventionally-classified as a medium effect size."),
       br(),
       br(),
            )
       
          )
        ))
      })
      
      observeEvent(input$snip4f2,{
        showModal(modalDialog(
          tags$div(
            style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
            h3("Write-Up"),
            tags$iframe(
              width="1280",
              height="720",
              src = "snip4f2.mp4",
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
        input$snip4g1,{ ##### Change this one every time
          showModal(
            modalDialog( 
              tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                        column(width = 12,
                               h3("Saving your Work Reproducibly"), ##### Change this one every time and text below
                               "Always save your work, and do it in a reproducible way. This means that, if someone needed to reproduce your results, you could simply give them one or more files (that's what you're saving here) and tell them what analysis program or language or tool you used, and they'd be able to reproduce your results exactly. This is helpful if someone challenges your work or you get audited. It's also helpful if you leave an institution, corporation, or clinic and someone there needs to reproduce your results at some point. But it's probably most useful for you. There are any number of reasons you might need to reproduce your owwn results for yourself, such as when you need to pick up where you left off the last time you worked on your analysis.",
                               br(), br() ) ) )) })
      observeEvent(
        input$snip4g2,{ ##### Change this one every time
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
