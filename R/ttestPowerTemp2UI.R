# Module UI function
ttestPowerUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  tagList(
    
    
    
    br(),
    
    
    
    
  
    
    column(12,style = " background-color: white; border-radius: 5px; ",
           h2("Analysis Parameters"),
           br(),
           "Specify the parameters below to run your power, sample size, or effect size analysis. Note that the term 'effect size' can mean an unstandardized or raw effect size or a standardized effect size.
           In the case of a t-test, the unstandardized/raw effect size is the difference in means, which has the same units as the means themselves. The standardized effect size 
           is the difference in means divided by the standard deviation and has a specific name: Cohen's d. If we refer to effect size below, we'll either be specific and refer to a 'difference in means' 
           or 'Cohen's d', or we'll say 'effect size' when we mean to be general or generic. Note that, when the standard deviation is equal to 1, the mean difference is equal to Cohen's d. So, 
           to power for a Cohen's d of 0.5, enter 1 for the standard deviation and 0.5 for the mean difference.",
           br(),
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
                                                              "Solve for Mean Difference"
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
           br()
                                         
                                         
    ),
    
    column(12,
           br(),
           br(),
           br()
    ),
    

    
    
    column(12, style = "background-color: white; border-radius: 5px; ",
           h2("Analysis Results"),
           br(),
           "The following table gives the results of your power/sample size/effect size analysis.",
           br(),
           br(),
           tableOutput(ns("powerTable")),
           br(),
           br(),
           #plotOutput(ns("forestPlot"),height=500,width=500),
           #br()
    ),
    
    column(12,
           br(),
           br(),
           br()
    )
    
    
    
  
  )
  
  
  
  
  
  
  
  
}






ttestPowerServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      

      
      
      
      output$powerTable<-renderTable({
        if(input$alternative=="One-sided") alternative="one.sided"
        if(input$alternative=="Two-sided") alternative="two.sided"
        
        
        
        if(input$solveFor=="Solve for Sample Size"){
          
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
        
        if(input$solveFor=="Solve for Mean Difference"){
          
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
       

        colnames(tab)<-c("Sample size","Difference in Means","Standard Deviation","Cohen's d","Significance Level","Power")
        
       tab
        
      },rownames=FALSE)
      
      

      
      
    }
  )    
}
