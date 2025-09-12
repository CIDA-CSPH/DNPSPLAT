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
                  selectizeInput(ns("activeAnalyses"),"ActiveAnalyses",choices=c("temp1File.xlsx","temp2File.xlsx")),
                  br(),
                  br(),
                  br()
           ),
                  
                  
           #h2("Explanation of Analysis Parameters: 2-Sample T-Test"),

           
           column(width=9, style="background-color: white",
                  
                  tabsetPanel(type = "tabs", id=ns("dataInput"),
                              
                              tabPanel("Use Difference in Means & Standard Deviation", value=1,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(

                                         br(),
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                #h2("Analysis Parameters"),
                                                br(),
                                               
                                                
                                                
                                                h4("Parameter to Solve For"),
                                                "You can solve for the sample size required to detect a given mean difference with a given power (solve for sample size), the power that is 
                                                acheived by a given sample size to detect a given mean difference (solve for power), or the minimum detectable mean difference for a given power and sample size (solve for mean difference).",
                                                br(),
                                                br(),
                                                selectInput(ns("solveFor"),label="Parameter to Solve For",
                                                            choices=c(
                                                              "Solve for Sample Size",
                                                              "Solve for Power",
                                                              "Solve for Difference in Means"
                                                            )
                                                ),
                                               
                                                br(),
                                                h4("Parameters to Set"),
                                                
                                                "Enter parameter values below. The parameter you chose to solve for above will be ignored here. You can leave it blank or at its default value.",
                                                br(),
                                                br(),
                                                column(4, 
                                                       style="background-color: white",
                                                       #numericInput(ns("sampleSize"),label="Sample Size per Group",value=NULL),

                                                       selectizeInput(
                                                         ns("sampleSize")
                                                         , "Sample Size per Group"
                                                         , choices = NULL
                                                         , multiple = TRUE
                                                         , options = list(create = TRUE)
                                                       ),
                                                       
                                                       selectizeInput(
                                                         ns("sd")
                                                         , "Standard Deviation"
                                                         , choices = NULL
                                                         , multiple = TRUE
                                                         , options = list(create = TRUE)
                                                       ),
                                                       br(),           
                                                       br()
                                                ),

                                                
                                                
                                                column(4, 
                                                       style="background-color: white",

                                                       selectizeInput(
                                                         ns("meanDif")
                                                         , "Difference in Means"
                                                         , choices = NULL
                                                         , multiple = TRUE
                                                         , options = list(create = TRUE)
                                                       ),
                                                       numericInput(ns("alpha"),label="Significance Level",value=0.05),
                                                       br(),           
                                                       br()
                                                ),
                                                
                                                
                                                
                                                column(4, 
                                                       style="background-color: white",

                                                       selectizeInput(
                                                         ns("power")
                                                         , "Power"
                                                         , choices = NULL
                                                         , multiple = TRUE
                                                         , options = list(create = TRUE)
                                                       ),
                                                       selectInput(ns("alternative"),label="Type of Alternative Hypothesis",
                                                                   choices=c(
                                                                     "Two-sided",
                                                                     "One-sided"
                                                                   ),
                                                                   selected="Two-sided"
                                                       ),
                                                       br(),           
                                                       br()
                                                       
                                                ),
                                                br(),           
                                                br(),
                                                br()
                                                
                                         ),
                                         br(),
                                         br(),
                                         #actionButton('save_inputs', 'Save inputs'),
                                         br()
                                       ),
                                       br()

                                       
                                       
                              ),
                              tabPanel("Use Standardized Effect Size", value=2,
                                       style = "background-color: #7b8a98; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; padding: 5px;",
                                       br(),
                                       fluidPage(
                                         
                                         br(),
                                         column(12,style = " background-color: white; border-radius: 5px; ",
                                                h2("Analysis Parameters"),
                                                br(),
                                                
                                                
                                                
                                                h4("Parameter to Solve For"),
                                                "You can solve for the sample size required to detect a given standardized effect size with a given power (solve for sample size), the power that is 
                                                acheived by a given sample size to detect a given standardized effect size (solve for power), or the minimum detectable standardized effect size for a given power and sample size (solve for standardized effect size).",
                                                br(),
                                                br(),
                                                selectInput(ns("solveFor2"),label="Parameter to Solve For",
                                                            choices=c(
                                                              "Solve for Sample Size",
                                                              "Solve for Power",
                                                              "Solve for Standardized Effect Size"
                                                            )
                                                ),
                                                

                                                
                                                br(),
                                                h4("Parameters to Set"),
                                                
                                                "Enter parameter values below. The parameter you chose to solve for above will be ignored here. You can leave it blank or at its default value. You can enter a single number for the required parameters, resulting in a single row in the table below. You can also enter multiple numbers in the fields, giving you a table with multiple rows, calculating power, sample size, etc. for multiple possibilities. The example table was done this way. When entering multiple values into a field, be sure to hit Enter/Return between entries.",
                                                br(),
                                                br(),
                                                column(4, 
                                                       style="background-color: white",
                                                       #numericInput(ns("sampleSize"),label="Sample Size per Group",value=NULL),
                                                       selectizeInput(
                                                         ns("sampleSize2")
                                                         , "Sample Size per Group"
                                                         , choices = NULL
                                                         , multiple = TRUE
                                                         , options = list(create = TRUE)
                                                       ),
                                                       br(),           
                                                       br()
                                                ),
                                                
                                                
                                                
                                                column(4, 
                                                       style="background-color: white",
                                                       selectizeInput(
                                                         ns("d")
                                                         , "Standardized Effect Size"
                                                         , choices = NULL
                                                         , multiple = TRUE
                                                         , options = list(create = TRUE)
                                                       ),
                                                       numericInput(ns("alpha2"),label="Significance Level",value=0.05),
                                                       br(),           
                                                       br()
                                                ),

                                                
                                                
                                                column(4, 
                                                       style="background-color: white",
                                                       selectizeInput(
                                                         ns("power2")
                                                         , "Power"
                                                         , choices = NULL
                                                         , multiple = TRUE
                                                         , options = list(create = TRUE)
                                                       ),
                                                       selectInput(ns("alternative2"),label="Type of Alternative Hypothesis",
                                                                   choices=c(
                                                                     "Two-sided",
                                                                     "One-sided"
                                                                   ),
                                                                   selected="Two-sided"
                                                       ),
                                                       br(),           
                                                       br()
                                                       
                                                ),
                                                br(),           
                                                br()
                                                
                                         ),
                                         br(),
                                         br(),
                                         #actionButton('save_inputs', 'Save inputs'),
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
    
    
    
    column(12, style = "background-color: white; border-radius: 5px; ",
           h2("Analysis Results"),
           br(),
           "The following table gives power analysis results. If you specified the required parameters above, this table gives results of your power analysis. If you've specified only some or none of the required parameters above, the table below is only an example table and does not give your results. You can check the table title to be sure - if it has the word 'Example' in the title, it does not give your results. If the word 'Example' is not in the table title, it gives your results, based on the parameter values you've specified above. It will automatically update once you've entered your parameters.",
           br(),
           br(),
           br(),
           h4(textOutput(ns("powerTableTitle"))),
           br(),
           tableOutput(ns("powerTable")),
           textOutput(ns("footnote")),
           br(),
           br(),
           #plotOutput(ns("forestPlot"),height=500,width=500),
           #br()
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
                         actionButton(ns("snip4f1"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('read.png'); background-size: cover; background-position: center;"),
                         #actionButton(ns("snip4f2"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background: url('watch.png'); background-size: cover; background-position: center;")
                         #actionButton(ns("snipXX"), label=NULL, style="width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center;") 
                         tags$div(style = "width: 45px; height: 20px; font-size: 100%; background-color: #818e9f; background-size: cover; background-position: center; border-radius: 4px;")
                  )
                  
           ),
           br(),
           br(),
           br(),
           
           column(width=12,
br(),
         
           "The following are examples of what one might write when writing up the results of a power analysis for a two-sample t-test.",
           br(),
           br(),
           h4("Using Difference in Means and Standard Deviation"),
           "Assuming a significance level of 0.05, equal group sizes, equal standard deviations in both groups of 0.7 (insert units), and a two-sided alternative hypothesis, a sample size of 64 observations per group acheives 80% power to detect a difference in means of 0.35 (insert units) using a two-sample, equal-variances t-test. This is equivalent to a standardized effect size of Glass's d = 0.5, conventionally-classified as a medium effect size.",
           br(),
           br(),
           h4("Using a Standardized Effect Size (Glass's d)"),
           "Assuming a significance level of 0.05, equal group sizes, and a two-sided alternative hypothesis, a sample size of 527 observations per group acheives 90% power to detect a standardized effect size of Glass'ss d = 0.20, conventionally-classified as a small effect size.",
           
           
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


  )
  
  
  
  
  
  
  
  
}








uploadFileServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      
      
      
      version<-reactive({
        1.1
      })
      
      
      alternative<-reactive({
        input$alternative
      })
      
      footnote1<-reactive({
        alternative<-alternative()
        paste('Results are for a ',tolower(alternative),', two-sample t-test with equal group sizes and a common standard deviation in the two groups. The standardized effect size (d) is the difference in means divided by the standard deviation.',sep='')
      })
      
      output$footnote<-renderText({
        footnote1()
      })
      
      
      
      
      
      powerTable1<-reactive({
        if(input$alternative=="One-sided") alternative="one.sided"
        if(input$alternative=="Two-sided") alternative="two.sided"
        
        
        
        if(input$solveFor=="Solve for Sample Size"){
          
          req(input$meanDif)
          req(input$sd)
          req(input$alpha)
          req(input$power)
          
          tab<-matrix(ncol=6,nrow=length(input$meanDif)*length(input$sd)*length(input$power))
          
          row<-1
          for(j in 1:length(input$meanDif)){
            for(k in 1:length(input$sd)){
              for(s in 1:length(input$power)){
                out<-power.t.test(n = NULL, delta = as.numeric(input$meanDif[j]), sd = as.numeric(input$sd[k]), sig.level = input$alpha,
                                  power = as.numeric(input$power[s]),
                                  type = "two.sample",
                                  alternative = alternative)
                tab[row,]<-c(out$n,out$delta,out$sd,out$delta/out$sd,out$sig.level,out$power)
                row<-row+1
              }
            }
          }
          
        }
        
        if(input$solveFor=="Solve for Power"){
          
          req(input$meanDif)
          req(input$sd)
          req(input$alpha)
          req(input$sampleSize)
          
          tab<-matrix(ncol=6,nrow=length(input$meanDif)*length(input$sd)*length(input$sampleSize))
          
          row<-1
          for(j in 1:length(input$meanDif)){
            for(k in 1:length(input$sd)){
              for(s in 1:length(input$sampleSize)){
                out<-power.t.test(n = as.numeric(input$sampleSize[s]), delta = as.numeric(input$meanDif[j]), sd = as.numeric(input$sd[k]), sig.level = input$alpha,
                                  power = NULL,
                                  type = "two.sample",
                                  alternative = alternative)
                tab[row,]<-c(out$n,out$delta,out$sd,out$delta/out$sd,out$sig.level,out$power)
                row<-row+1
              }
            }
          }
          
        }
        
        if(input$solveFor=="Solve for Difference in Means"){
          req(input$sampleSize)
          req(input$sd)
          req(input$alpha)
          req(input$power)
          
          tab<-matrix(ncol=6,nrow=length(input$power)*length(input$sd)*length(input$sampleSize))
          
          row<-1
          for(j in 1:length(input$power)){
            for(k in 1:length(input$sd)){
              for(s in 1:length(input$sampleSize)){
                out<-power.t.test(n = as.numeric(input$sampleSize[s]), delta = NULL, sd = as.numeric(input$sd[k]), sig.level = input$alpha,
                                  power = as.numeric(input$power[j]),
                                  type = "two.sample",
                                  alternative = alternative)
                tab[row,]<-c(out$n,out$delta,out$sd,out$delta/out$sd,out$sig.level,out$power)
                row<-row+1
              }
            }
          }
        }
        
        
        colnames(tab)<-c("Sample Size per Group","Difference in Means","Standard Deviation","Standardized Effect Size (d)","Significance Level","Power")
        
        tab
        
      })
      
      
      powerTable1a<-reactive({
        
        if(input$dataInput==1){
          tab<-examplePowerTable1()
          if(input$solveFor=="Solve for Difference in Means" && !is.null(input$sampleSize) && !is.null(input$alpha) && !is.null(input$power) && !is.null(input$sd)){
            tab<-powerTable1()
          }
          if(input$solveFor=="Solve for Sample Size" && !is.null(input$meanDif) && !is.null(input$alpha) && !is.null(input$power) && !is.null(input$sd)){
            tab<-powerTable1()
          }
          if(input$solveFor=="Solve for Power" && !is.null(input$meanDif) && !is.null(input$alpha) && !is.null(input$sampleSize) && !is.null(input$sd)){
            tab<-powerTable1()
          }
        } 
        
        if(input$dataInput==2){
          tab<-examplePowerTable2()
          if(input$solveFor2=="Solve for Standardized Effect Size" && !is.null(input$sampleSize2) && !is.null(input$alpha2) && !is.null(input$power2)){
            tab<-powerTable2()
          }
          if(input$solveFor2=="Solve for Sample Size" && !is.null(input$d) && !is.null(input$alpha2) && !is.null(input$power2)){
            tab<-powerTable2()
          }
          if(input$solveFor2=="Solve for Power" && !is.null(input$d) && !is.null(input$alpha2) && !is.null(input$sampleSize2)){
            tab<-powerTable2()
          }
        } 
        tab
        
      })
      
      output$powerTable<-renderTable({
        powerTable1a()
      })
      
      
      
      
      
      
      
      
      powerTable2<-reactive({
        if(input$alternative2=="One-sided") alternative="one.sided"
        if(input$alternative2=="Two-sided") alternative="two.sided"
        sd<-1
        standardizedD<-input$d
        

        if(input$solveFor2=="Solve for Sample Size"){
          
          req(input$d)
          req(input$alpha2)
          req(input$power2)
          
          tab<-matrix(ncol=4,nrow=length(standardizedD)*length(sd)*length(input$power2))
          
          row<-1
          for(j in 1:length(standardizedD)){
            for(k in 1:length(sd)){
              for(s in 1:length(input$power2)){
                out<-power.t.test(n = NULL, delta = as.numeric(standardizedD[j]), sd = as.numeric(sd[k]), sig.level = input$alpha2,
                                  power = as.numeric(input$power2[s]),
                                  type = "two.sample",
                                  alternative = alternative)
                tab[row,]<-c(out$n,out$delta/out$sd,out$sig.level,out$power)
                row<-row+1
              }
            }
          }
          colnames(tab)<-c("Sample size","Standardized Effect Size","Significance Level","Power")
        }
        
        if(input$solveFor2=="Solve for Power"){
          
          req(input$d)
          req(input$alpha2)
          req(input$sampleSize2)
          
          tab<-matrix(ncol=4,nrow=length(standardizedD)*length(sd)*length(input$sampleSize2))
          
          row<-1
          for(j in 1:length(standardizedD)){
            for(k in 1:length(sd)){
              for(s in 1:length(input$sampleSize2)){
                out<-power.t.test(n = as.numeric(input$sampleSize2[s]), delta = as.numeric(standardizedD[j]), sd = as.numeric(sd[k]), sig.level = input$alpha2,
                                  power = NULL,
                                  type = "two.sample",
                                  alternative = alternative)
                tab[row,]<-c(out$n,out$delta/out$sd,out$sig.level,out$power)
                row<-row+1
              }
            }
          }
          colnames(tab)<-c("Sample size","Standardized Effect Size","Significance Level","Power")
          
        }
        
        if(input$solveFor2=="Solve for Standardized Effect Size"){
          
          req(input$sampleSize2)
          req(input$alpha2)
          req(input$power2)
          
          tab<-matrix(ncol=4,nrow=length(input$power2)*length(sd)*length(input$sampleSize2))
          
          row<-1
          for(j in 1:length(input$power2)){
            for(k in 1:length(sd)){
              for(s in 1:length(input$sampleSize2)){
                out<-power.t.test(n = as.numeric(input$sampleSize2[s]), delta = NULL, sd = as.numeric(sd[k]), sig.level = input$alpha2,
                                  power = as.numeric(input$power2[j]),
                                  type = "two.sample",
                                  alternative = alternative)
                tab[row,]<-c(out$n,out$delta/out$sd,out$sig.level,out$power)
                row<-row+1
              }
            }
          }
          #colnames(tab)<-c("Sample size","Standardized Effect Size","Significance Level","Power")
        }
        
        
        colnames(tab)<-c("Sample Size per Group","Standardized Effect Size (d)","Significance Level","Power")
        
        tab
        
      })
      
      
      examplePowerTable1<-reactive({
        if(input$alternative2=="One-sided") alternative="one.sided"
        if(input$alternative2=="Two-sided") alternative="two.sided"
        sd<-2
        #standardizedD<-input$d
        
        
        power2<-c(0.8,0.9,0.95)
        standardizedD<-c(0.4,1,1.6)
        alpha2<-0.05
        
        tab<-matrix(ncol=6,nrow=length(standardizedD)*length(sd)*length(power2))
        
        row<-1
        for(j in 1:length(standardizedD)){
          for(k in 1:length(sd)){
            for(s in 1:length(power2)){
              out<-power.t.test(n = NULL, delta = as.numeric(standardizedD[j]), sd = as.numeric(sd[k]), sig.level = alpha2,
                                power = as.numeric(power2[s]),
                                type = "two.sample",
                                alternative = alternative)
              tab[row,]<-c(out$n,out$delta,out$sd,out$delta/out$sd,out$sig.level,out$power)
              row<-row+1
            }
          }

      }
     
        colnames(tab)<-c("Sample Size per Group","Difference in Means","Standard Deviation","Standardized Effect Size (d)","Significance Level","Power")
        
        tab
        
      })
      
      
      examplePowerTable2<-reactive({
        if(input$alternative2=="One-sided") alternative="one.sided"
        if(input$alternative2=="Two-sided") alternative="two.sided"
        sd<-1
        #standardizedD<-input$d

          
          power2<-c(0.8,0.9,0.95)
          standardizedD<-c(0.2,0.5,0.8)
          alpha2<-0.05
          
          tab<-matrix(ncol=4,nrow=length(standardizedD)*length(sd)*length(power2))
          
          row<-1
          for(j in 1:length(standardizedD)){
            for(k in 1:length(sd)){
              for(s in 1:length(power2)){
                out<-power.t.test(n = NULL, delta = as.numeric(standardizedD[j]), sd = as.numeric(sd[k]), sig.level = alpha2,
                                  power = as.numeric(power2[s]),
                                  type = "two.sample",
                                  alternative = alternative)
                tab[row,]<-c(out$n,out$delta/out$sd,out$sig.level,out$power)
                row<-row+1
              }
            }
          }

        colnames(tab)<-c("Sample Size per Group","Standardized Effect Size (d)","Significance Level","Power")
        
        tab
        
      })
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      powerTableTitle1<-reactive({
        title<-"Table 1. Example Power Analysis Results Using Unstandardized Effect Size (example only)"

        if(input$dataInput==1){
          if(input$solveFor=="Solve for Difference in Means" && !is.null(input$sampleSize) && !is.null(input$alpha) && !is.null(input$power) && !is.null(input$sd)){
            title<-"Table 1. Effect Size Analysis Results"
          }
          if(input$solveFor=="Solve for Sample Size" && !is.null(input$meanDif) && !is.null(input$alpha) && !is.null(input$power) && !is.null(input$sd)){
            title<-"Table 1. Sample Size Analysis Results"
          }
          if(input$solveFor=="Solve for Power" && !is.null(input$meanDif) && !is.null(input$alpha) && !is.null(input$sampleSize) && !is.null(input$sd)){
            title<-"Table 1. Power Analysis Results"
          }
        } 
        
        if(input$dataInput==2){
          title<-"Table 1. Example Power Analysis Results Using Standardized Effect Size (example only)"
          if(input$solveFor2=="Solve for Standardized Effect Size" && !is.null(input$sampleSize2) && !is.null(input$alpha2) && !is.null(input$power2)){
            title<-"Table 1. Effect Size Analysis Results"
          }
          if(input$solveFor2=="Solve for Sample Size" && !is.null(input$d) && !is.null(input$alpha2) && !is.null(input$power2)){
            title<-"Table 1. Sample Size Analysis Results"
          }
          if(input$solveFor2=="Solve for Power" && !is.null(input$d) && !is.null(input$alpha2) && !is.null(input$sampleSize2)){
            title<-"Table 1. Power Analysis Results"
          }
        } 
        title
        
      })
      
      output$powerTableTitle<-renderText({
        powerTableTitle1()
        })
      
      
      
      
      
      
      
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
      
      observeEvent(input[["tTestPowerData"]], {
        xlfile <- input[["tTestPowerData"]][["datapath"]]
        ext <- tolower(tools::file_ext(xlfile))
        if(ext == "xlsx") {
          sheets <- excel_sheets(xlfile)
          if(length(sheets) == 1L) {
            Dat1ab(read_xlsx(input[["tTestPowerData"]][["datapath"]], sheet = 1L))
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
      
      
      
      observeEvent(input[["sheet"]], {
        if(read_xlsx(input[["tTestPowerData"]][["datapath"]], sheet = input[["sheet"]])[1,1] != "2-Sample T-Test Power"){
          sendSweetAlert(
            session,
            title = "Incorrect File",
            text = "Not a 2-Sample T-Test Power Analysis File. Please upload an analysis file compatible with the 2-Sample T-Test Power Tool.",
            type = "error",
            btn_colors="#5f5f62"
          )
        }else{
          Dat1ab(read_xlsx(input[["tTestPowerData"]][["datapath"]], sheet = input[["sheet"]]))
          dat<-Dat1ab()
          options<-as.matrix(dat[,1])
          effectSize<-options[4]
          toSolveFor<-options[7]
          
          
          
          
          sampleSizeSpot<-9
          deltaSpot<-which(options[]=="Difference in Means:")
          powerSpot<-which(options[]=="Power:")
          sdSpot<-which(options[]=="Standard Deviation:")
          alphaSpot<-which(options[]=="Significance Level:")
          h1Spot<-which(options[]=="Type of Alternative Hypothesis:")
          dSpot<-which(options[]=="Glass's/Cohen's d:")
          stopSpot<-length(options)
          sampleSize<-as.factor(options[(sampleSizeSpot+1):(deltaSpot-2)])
          delta<-options[(deltaSpot+1):(powerSpot-2)]
          power<-options[(powerSpot+1):(sdSpot-2)]
          sd<-options[(sdSpot+1):(alphaSpot-2)]
          alpha<-options[(alphaSpot+1):(h1Spot-2)]
          h1<-options[(h1Spot+1):(dSpot-2)]
          d<-options[(dSpot+1):(stopSpot-1)]
          
          if(length(sampleSize)==1){
            if(sampleSize=="-") sampleSize<-NULL
          }
          if(length(delta)==1){
            if(delta=="-") delta<-NULL
          }
          if(length(power)==1){
            if(power=="-") power<-NULL
          }
          if(length(d)==1){
            if(d=="-") d<-NULL
          }

          if(effectSize=="Raw (use difference in means and standard deviation)"){
            updateTabsetPanel(session,inputId="dataInput",selected="1")
            updateSelectInput(session,"solveFor",selected=toSolveFor)
            updateSelectizeInput(session,"sampleSize", choices=sampleSize,selected=sampleSize,options=list(create=TRUE))
            updateSelectizeInput(session,"sd", choices=sd,selected=sd,options=list(create=TRUE))
            updateSelectizeInput(session,"meanDif", choices=delta,selected=delta,options=list(create=TRUE))
            updateSelectizeInput(session,"power", choices=power,selected=power,options=list(create=TRUE))
            updateSelectInput(session,"alternative",selected=h1)
            updateNumericInput(session,"alpha",value=alpha)
          }
          if(effectSize=="Standardized (use Cohen's/Glass's d)"){
            updateTabsetPanel(session,inputId="dataInput",selected="2")
            updateSelectInput(session,"solveFor2",selected=toSolveFor)
            updateSelectizeInput(session,"sampleSize2", choices=sampleSize,selected=sampleSize,options=list(create=TRUE))
            updateSelectizeInput(session,"d", choices=d,selected=d,options=list(create=TRUE))
            updateSelectizeInput(session,"power2", choices=power,selected=power,options=list(create=TRUE))
            updateSelectInput(session,"alternative2",selected=h1)
            updateNumericInput(session,"alpha2",value=alpha)
            
          }
          
        }
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
