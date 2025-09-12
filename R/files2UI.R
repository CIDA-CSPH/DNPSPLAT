# Module UI function
files2UI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
        
           
           #column(width=12,
                  fileInput(ns("uploadFileData"),"Enter data file location",accept=".xlsx"),
                  #br(),
                  #br(),
                  selectInput(ns("activeAnalyses"),"Active Analyses",choices=c("No Analyses Active/Open"),width="75%",size=4,selectize=FALSE),
                  #br(),
                  actionGroupButtons(c(ns("view"),ns("run"),ns("Save")),c("View File","Run Analysis","Save File")),
           #),
                  
   



  )
  
  
  
  
  
  
  
  
}








files2Server <- function(id) {
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
      
     

   
      
      
    }
  )    
}
